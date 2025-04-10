import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  List<Object?> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = "Vui lòng kiểm tra kết nối mạng."});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.message = "Lỗi không mong muốn xảy ra."});
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({super.message = "Dữ liệu đầu vào không hợp lệ."});
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({super.message = "Xác thực thất bại."});
}
