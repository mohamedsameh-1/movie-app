class Failure {
  final String failureMessage;
  Failure({required this.failureMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.failureMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.failureMessage});
}
