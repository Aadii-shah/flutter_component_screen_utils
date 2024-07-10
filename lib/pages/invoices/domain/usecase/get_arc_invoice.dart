import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/model/arc_invoice_model.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/data/repository/arc_invoice_repo.dart';
import 'package:finnoto_app/arcPortal/presentation/pages/dashboard/home/presentation/widget/card/invoices/domain/usecase/arc_invoice_usecase.dart';
import 'package:finnoto_app/employeePortal/data/network/error/failure.dart';
import 'package:finnoto_app/employeePortal/data/network/error/server_exception.dart';

class GetArcInvoice implements ArcInvoiceUseCase<ArcInvoiceModel, Params> {
  final ArcInvoiceRepository repository;

  GetArcInvoice(this.repository);

  @override
  Future<Either<Failure, ArcInvoiceModel>> call(Params params) async {
    try {
      final result = await repository.fetchArcInvoice(params.limit, params.page, searchQuery: params.searchQuery);
      return result;
    } on ServerException {
      return Left(ServerFailure(message: 'e.message,'));
    } on FormatException catch (e) {
      return Left(ServerFailure(message: "Data format error: $e"));
    } catch (e) {
      return Left(ServerFailure(message: "An unknown error occurred: $e"));
    }
  }
}

class Params extends Equatable {
  final int limit;
  final int page;
  final String? searchQuery;

  const Params({required this.limit, required this.page, this.searchQuery});

  @override
  List<Object?> get props => [limit, page, searchQuery];
}
