import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ts_domain/error/failure.dart';
import 'package:ts_domain/models/entities/token.dart';
import 'package:ts_domain/repositories/auth_repository.dart';
import 'package:ts_domain/usecases/usecase.dart';

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignInUseCase implements UseCase<Token, SignInParams> {
  final AuthRepository authRepository;

  SignInUseCase(this.authRepository);

  @override
  Future<Either<Failure, Token>> call(SignInParams params) async {
    if (params.email.isEmpty || params.password.isEmpty) {
      return Left(InvalidInputFailure());
    }

    final result = await authRepository.signIn(
      email: params.email,
      password: params.password,
    );

    return result;
  }
}
