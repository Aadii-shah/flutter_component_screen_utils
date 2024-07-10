import 'package:dartz/dartz.dart';
import 'package:finnoto_app/employeePortal/data/network/error/failure.dart';

abstract class ArcInvoiceUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
