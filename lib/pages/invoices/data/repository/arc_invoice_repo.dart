import 'package:dartz/dartz.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/model/arc_invoice_model.dart';
import 'package:finnoto_app/employeePortal/data/network/error/failure.dart';

abstract class ArcInvoiceRepository {
  Future<Either<Failure, ArcInvoiceModel>> fetchArcInvoice(int limit, int page, {String? searchQuery});
}
