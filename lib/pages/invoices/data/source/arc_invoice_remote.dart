import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/model/arc_invoice_model.dart';
import 'package:finnoto_app/employeePortal/data/network/client/base_client.dart';

import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';

abstract class ArcInvoiceRemoteDataSource {
  Future<ArcInvoiceModel> fetchArcInvoice(int limit, int page, {String? searchQuery});
}

class ArcInvoiceRemoteDataSourceImpl implements ArcInvoiceRemoteDataSource {
  final BaseClient baseClient;

  ArcInvoiceRemoteDataSourceImpl({required this.baseClient});

  @override
  Future<ArcInvoiceModel> fetchArcInvoice(int limit, int page, {String? searchQuery}) async {
    try {
      final String? baseUrl = await SharedPreferencesHelper.getApiUrl();
      final Map<String, dynamic> payload = {
        "limit": limit,
        "page": page,
        "search": searchQuery,
        "listing_slug": "arc_invoices",
      };
      final result = await baseClient.postRequest(
        baseUrl: baseUrl,
        path: Apiconstants.kEndpointForArcInvoice,
        data: payload,
      );

      if (result!.statusCode == 201) {
        return ArcInvoiceModel.fromJson(result.data);
      } else {
        throw ServerException("Failed to load invoices: ${result.statusCode}");
      }
    } on SocketException catch (e) {
      debugPrint("No Internet connection: $e");
      throw ServerException("No Internet connection: $e");
    } on FormatException catch (e) {
      debugPrint("Data format error: $e");
      throw ServerException("Data format error: $e");
    } on ServerException catch (e) {
      // Re-throwing the custom ServerException
      debugPrint("Server exception: ${e.message}");
      throw ServerException(e.message);
    } catch (e) {
      // Catch any other exceptions
      debugPrint("An unknown error occurred: $e");
      throw ServerException("An unknown error occurred: $e");
    }
  }
}
