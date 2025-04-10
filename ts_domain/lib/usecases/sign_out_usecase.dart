import 'package:dartz/dartz.dart';
import 'package:ts_domain/error/failure.dart';
import 'package:ts_domain/repositories/auth_repository.dart';
import 'package:ts_domain/usecases/usecase.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await authRepository.signOut();
    return result;
  }
}
