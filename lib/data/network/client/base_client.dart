import 'package:dio/dio.dart';
import 'package:finnoto_app/employeePortal/data/network/interceptor/add_dio_interceptors.dart';
import 'package:finnoto_app/employeePortal/data/network/client/get_header.dart';
import 'package:finnoto_app/employeePortal/data/network/constant/network_constants.dart';
import 'package:finnoto_app/employeePortal/data/network/error/network_error_handler.dart';
import 'package:finnoto_app/employeePortal/presentation/core/constant/text/constants_text.dart';
import 'package:finnoto_app/employeePortal/presentation/core/helper/dialog/dialog_helper.dart';
import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';
import 'package:finnoto_app/employeePortal/presentation/core/logger/debug_log.dart';

import '../../../presentation/pages/authScreen/refresh/presentation/pages/refresh_token.dart';
import '../enum/http_enum.dart';

class BaseClient {
  static final BaseClient _baseClientImpl = BaseClient._internal();
  //static const int cacheExpirationInMinutes = 5;
  static const int cacheExpirationInSeconds = 20;

  factory BaseClient() {
    return _baseClientImpl;
  }

  BaseClient._internal();

  Future<Response?> getRequest({
    String? baseUrl,
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? queryParameters,
    required String path,
    bool showDialog = false,
    bool shouldCache = true,
    bool includeDefaultHeaders = true,
  }) async {
    baseUrl = baseUrl ?? NetworkConstants.eapiBaseUrl;
    Response? response;
    if (showDialog) DialogHelper.showLoadingDialog();

    // Check if we have a valid cache before making a network request
    if (shouldCache) {
      response = await getCachedResponse(path, queryParameters);
      if (response != null) {
        debugPrint("Using cached response for key: ${generateCacheKey(path, queryParameters)}");

        //! Attempt to refresh the cache in the background if it's expired
        _refreshCacheIfNeeded(path, queryParameters, response);

        return response;
      }
    }

    response = await _performNetworkRequest(
      baseUrl: baseUrl,
      optionalHeaders: optionalHeaders,
      queryParameters: queryParameters,
      path: path,
      includeDefaultHeaders: includeDefaultHeaders,
      showDialog: showDialog,
      shouldCache: shouldCache,
    );

    return response;
  }

  Future<Response?> _performNetworkRequest({
    String? baseUrl,
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? queryParameters,
    required String path,
    bool showDialog = false,
    bool includeDefaultHeaders = true,
    bool shouldCache = true,
  }) async {
    Response? response;

    try {
      Map<String, String> header = includeDefaultHeaders ? await getHeader() : {};
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }

      Dio dio = Dio();
      addDioInterceptors(dio);
      response = await dio.get(
        "$baseUrl/$path",
        queryParameters: queryParameters,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
      );

      // Cache the response if it's successful
      if (shouldCache && response.statusCode == 200) {
        String cacheUrlKey = generateCacheKey(path, queryParameters);
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Map<String, dynamic> cacheData = {"timestamp": DateTime.now().millisecondsSinceEpoch, "data": response.data};
          prefs.setString(cacheUrlKey, jsonEncode(cacheData));
          debugPrint("Response cached with key: $cacheUrlKey");
        } catch (e) {
          debugPrint("Error caching response: $e");
        }
      }
    } on DioException catch (e, stackTrace) {
      response = e.response;
      handleNetworkError(e, stackTrace);

      if (e.response?.statusCode == 404) {
        response = await getCachedResponse(path, queryParameters);
      } else if (e.response?.statusCode == 401) {
        await SharedPreferencesHelper.removeAllSharedPrefs();
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const RefreshToken()),
          (Route<dynamic> route) => false,
        );
      }

      if (shouldCache && e.error is SocketException) {
        String cacheUrlKey = generateCacheKey(path, queryParameters);
        response = await getCachedResponse(cacheUrlKey, queryParameters);
      }

      if (!shouldCache && e.error is SocketException) {
        response = Response(
          requestOptions: RequestOptions(path: path),
          data: {"status-message": kErrorMessageNoInternetConnection},
          statusCode: 400,
        );
      }
    } catch (e) {
      if (shouldCache && e is SocketException) {
        response = await getCachedResponse(path, queryParameters);
      } else {
        debugPrint("Error during request: $e");
      }
    }
    if (showDialog) DialogHelper.hideLoadingDialog();
    return response;
  }

  void _refreshCacheIfNeeded(String path, Map<String, dynamic>? queryParameters, Response cachedResponse) async {
    int cacheTimestamp = cachedResponse.extra["timestamp"];
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    // int cacheExpirationTime = cacheExpirationInMinutes * 60 * 1000;
    int cacheExpirationTime = cacheExpirationInSeconds * 1000;

    if (currentTime - cacheTimestamp >= cacheExpirationTime) {
      debugPrint("Cache expired, attempting to refresh for key: ${generateCacheKey(path, queryParameters)}");

      // Perform network request to refresh cache
      Response? response = await _performNetworkRequest(
        baseUrl: await SharedPreferencesHelper.getApiUrl(),
        optionalHeaders: null,
        queryParameters: queryParameters,
        path: path,
        includeDefaultHeaders: true,
        shouldCache: true,
      );

      if (response != null && response.statusCode == 200) {
        debugPrint("Cache refreshed successfully for key: ${generateCacheKey(path, queryParameters)}");
      } else {
        debugPrint("Failed to refresh cache for key: ${generateCacheKey(path, queryParameters)}");
      }
    }
  }

  String generateCacheKey(String path, Map<String, dynamic>? queryParameters) {
    return path + (queryParameters != null ? jsonEncode(queryParameters) : "");
  }

  Future<Response?> getCachedResponse(String endpoint, Map<String, dynamic>? queryParameters) async {
    String cacheUrlKey = generateCacheKey(endpoint, queryParameters);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cachedResponse = prefs.getString(cacheUrlKey);
      if (cachedResponse != null) {
        Map<String, dynamic> cacheData = jsonDecode(cachedResponse);
        int cacheTimestamp = cacheData["timestamp"];

        // Always return the cached response
        debugPrint("Retrieved cached response for key: $cacheUrlKey");
        return Response(
          requestOptions: RequestOptions(path: endpoint),
          data: cacheData["data"],
          statusCode: 200,
          extra: {
            AppConstants.kKeyForIsCached: true,
            "timestamp": cacheTimestamp,
          },
        );
      } else {
        debugPrint("No cached response found for key: $cacheUrlKey");
      }
    } catch (e) {
      debugPrint("Error retrieving cached response: $e");
    }
    return null;
  }

  Future<Response?> postRequest({
    String? baseUrl,
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? data,
    required String path,
    bool showDialog = false,
  }) async {
    baseUrl = baseUrl ?? NetworkConstants.eapiBaseUrl;
    Response? response;
    if (showDialog) {
      DialogHelper.showLoadingDialog();
    }
    try {
      Map<String, String> header = await getHeader();
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }

      Dio dio = Dio();
      addDioInterceptors(dio);
      response = await dio.post(
        "$baseUrl/$path",
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
        data: data,
      );
    } on DioException catch (e, stackTrace) {
      response = await handleNetworkError(e, stackTrace);
    } catch (e) {
      debugLog("Error in POST request : ${e.toString()}");
    }
    hideDialogIfNeeded(showDialog);
    return response;
  }

  Future<Response?> multiPartRequest({
    String? baseUrl,
    HttpMethods method = HttpMethods.post,
    required String path,
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? data,
    Map<String, File>? fileData,
    bool showDialog = false,
  }) async {
    baseUrl = baseUrl ?? NetworkConstants.eapiBaseUrl;
    Response? response;
    if (showDialog) {
      DialogHelper.showLoadingDialog();
    }
    try {
      Map<String, String> header = await getHeader();
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }
      Dio dio = Dio();
      addDioInterceptors(dio);
      final formData = FormData();

      if (data != null) {
        data.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      if (fileData != null) {
        fileData.forEach((key, file) async {
          String fileName = file.path.split('/').last;
          formData.files.add(
            MapEntry(
              key,
              await MultipartFile.fromFile(
                file.path,
                filename: fileName,
              ),
            ),
          );
        });
      }

      if (method == HttpMethods.post) {
        response = await dio.post(
          baseUrl + path,
          options: Options(
            headers: header,
            sendTimeout: const Duration(seconds: 40),
            receiveTimeout: const Duration(seconds: 40),
          ),
          data: formData,
        );
        hideDialogIfNeeded(showDialog);
        return response;
      } else {
        response = await dio.put(
          baseUrl + path,
          options: Options(
            headers: header,
            sendTimeout: const Duration(seconds: 40),
            receiveTimeout: const Duration(seconds: 40),
          ),
          data: formData,
        );
        hideDialogIfNeeded(showDialog);
        return response;
      }
    } on DioException catch (e, stackTrace) {
      hideDialogIfNeeded(showDialog);
      return handleNetworkError(e, stackTrace);
    } catch (e) {
      hideDialogIfNeeded(showDialog);
      return response;
    }
  }

  Future<Response?> putRequest({
    String? baseUrl,
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? data,
    required String path,
    bool showDialog = false,
  }) async {
    baseUrl = baseUrl ?? NetworkConstants.eapiBaseUrl;
    Response? response;
    if (showDialog) {
      DialogHelper.showLoadingDialog();
    }
    try {
      Map<String, String> header = await getHeader();
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }
      Dio dio = Dio();
      addDioInterceptors(dio);
      response = await dio.put(
        baseUrl + path,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
        data: data,
      );
      hideDialogIfNeeded(showDialog);
      return response;
    } on DioException catch (e, stackTrace) {
      hideDialogIfNeeded(showDialog);
      return handleNetworkError(e, stackTrace);
    } catch (e) {
      hideDialogIfNeeded(showDialog);
      debugLog("Error in PUT request : ${e.toString()}");
      return response;
    }
  }

  void hideDialogIfNeeded(bool showDialog) {
    if (showDialog) DialogHelper.hideLoadingDialog();
  }
}
