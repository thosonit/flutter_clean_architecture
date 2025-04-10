class ServerException implements Exception {
  final String? message;
  final int? statusCode;

  ServerException({this.message, this.statusCode});
}

class CacheException implements Exception {
  final String? message;

  CacheException({this.message});
}

class UnauthenticatedException implements Exception {
  final String? message;

  UnauthenticatedException({this.message});
}

class NetworkException implements Exception {
  final String? message;

  NetworkException({this.message});
}

class InvalidCredentialsException extends ServerException {
  InvalidCredentialsException({
    super.message = "Thông tin đăng nhập không hợp lệ.",
  });
}
