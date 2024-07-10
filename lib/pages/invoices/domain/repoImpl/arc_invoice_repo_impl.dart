import 'package:dartz/dartz.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/model/arc_invoice_model.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/repository/arc_invoice_repo.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/source/arc_invoice_remote.dart';
import 'package:finnoto_app/employeePortal/data/network/error/failure.dart';
import 'package:finnoto_app/employeePortal/data/network/error/server_exception.dart';

class ArcInvoiceRepositoryImpl implements ArcInvoiceRepository {
  final ArcInvoiceRemoteDataSource remoteDataSource;

  ArcInvoiceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ArcInvoiceModel>> fetchArcInvoice(int limit, int page, {String? searchQuery}) async {
    try {
      final result = await remoteDataSource.fetchArcInvoice(limit, page, searchQuery: searchQuery);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
