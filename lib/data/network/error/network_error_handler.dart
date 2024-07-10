import 'package:dio/dio.dart';
import 'package:finnoto_app/employeePortal/data/remote/firebase/firebase_config.dart';
import 'package:finnoto_app/employeePortal/presentation/core/constant/firebase/firebase_remote_config_keys.dart';

import 'package:finnoto_app/employeePortal/presentation/core/constant/text/constants_text.dart';
import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';
import 'package:finnoto_app/employeePortal/presentation/core/logger/debug_log.dart';
import 'package:finnoto_app/employeePortal/presentation/core/sentry/report_error_sentry.dart';
import 'package:finnoto_app/employeePortal/presentation/pages/authScreen/refresh/presentation/pages/refresh_token.dart';

Future<Response<dynamic>?> handleNetworkError(
  dynamic exception,
  StackTrace stackTrace,
) async {
  debugLog("Error Endpoint: ${exception is DioException ? exception.requestOptions.path : 'Unknown'}");
  bool shouldReportDioErrorOnSentry = FirebaseRemoteConfigHelper.getBool(FirebaseRemoteConfigKeys.reportDioErrorOnSentry);
  if (shouldReportDioErrorOnSentry) {
    debugLog("Error reported on Sentry.");
    reportErrorToSentry(
      errorMessage: exception.toString(),
      stackTrace: stackTrace,
      errorCausingEndpoint: exception is DioException ? exception.requestOptions.path : 'Unknown',
    );
  }

  String path = exception is DioException ? exception.requestOptions.path : 'Unknown';

  if (exception is DioException) {
    if (exception.response?.statusCode == 401) {
      //logout
      await SharedPreferencesHelper.removeAllSharedPrefs();
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const RefreshToken()),
        (Route<dynamic> route) => false,
      );

      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: {"status-message": kErrorMessageUnauthorizedException},
        statusCode: 401,
      );
    } else if (exception.response?.statusCode == 400) {
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: {"status-message": kErrorMessageBadRequestException},
        statusCode: 400,
      );
    } else if (exception.response?.statusCode == 403) {
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: {"status-message": kErrorMessageForbiddenException},
        statusCode: 403,
      );
    } else if (exception.response?.statusCode == 404) {
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: {"status-message": kErrorMessageNotfoundException},
        statusCode: 404,
      );
    }

    if (exception.error is SocketException) {
      return Response<dynamic>(
        requestOptions: exception.requestOptions,
        data: {"status-message": kErrorMessageNoInternetConnection},
        statusCode: 400,
      );
    }

    return Response<dynamic>(
      requestOptions: exception.requestOptions,
      data: {"status-message": exception.message ?? 'Unexpected error occurred'},
      statusCode: exception.response?.statusCode,
    );
  } else if (exception is SocketException) {
    return Response<dynamic>(
      requestOptions: RequestOptions(path: path),
      data: {"status-message": kErrorMessageNoInternetConnection},
      statusCode: 400,
    );
  } else if (exception is TimeoutException) {
    return Response<dynamic>(
      requestOptions: RequestOptions(path: path),
      data: {"status-message": kErrorMessageConnectionTimeout},
      statusCode: 408,
    );
  } else if (exception is ServerSocket) {
    return Response<dynamic>(
      requestOptions: RequestOptions(path: path),
      data: {"status-message": kErrorMessageInternalServerErrorException},
      statusCode: 500,
    );
  } else if (exception is PlatformException) {
    return Response<dynamic>(
      requestOptions: RequestOptions(path: path),
      data: {"status-message": kErrorMessagePlatformException},
      statusCode: 500,
    );
  } else if (exception is HttpException) {
    return Response<dynamic>(
      requestOptions: RequestOptions(path: path),
      data: {"status-message": '$kErrorMessageHttpException ${exception.message}'},
      statusCode: 500,
    );
  } else if (exception is FormatException) {
    return Response<dynamic>(
      requestOptions: RequestOptions(path: path),
      data: {"status-message": kErrorMessageFormatException},
      statusCode: 500,
    );
  } else {
    return Response<dynamic>(
      requestOptions: RequestOptions(path: path),
      data: {"status-message": kErrorMessageUnexpectedException},
      statusCode: 500,
    );
  }
}
