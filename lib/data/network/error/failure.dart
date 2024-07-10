abstract class Failure {
  final String message;
  final int? code;

  Failure({required this.message, this.code});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message, super.code});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, super.code});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message, super.code});
}
