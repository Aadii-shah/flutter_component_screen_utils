import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:finnoto_app/employeePortal/data/network/error/failure.dart';

Either<Failure, T> getParsedData<T>(Response? response, T Function(Map<String, dynamic>) fromJson) {
  try {
    if (response != null && response.statusCode == 201) {
      return Right(fromJson(response.data));
    } else {
      return Left(ServerFailure(message: response?.statusMessage ?? 'Unknown error', code: response?.statusCode));
    }
  } catch (e) {
    return Left(ServerFailure(message: 'Failed to parse data', code: response?.statusCode));
  }
}
