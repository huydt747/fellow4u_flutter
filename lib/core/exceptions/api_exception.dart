class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class NoConnectionException extends ApiException {
  NoConnectionException([String message = 'No internet connection or server is offline'])
      : super(message);
}

class ServerException extends ApiException {
  ServerException([String message = 'Internal server error']) : super(message, statusCode: 500);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([String message = 'Unauthorized access']) : super(message, statusCode: 401);
}
