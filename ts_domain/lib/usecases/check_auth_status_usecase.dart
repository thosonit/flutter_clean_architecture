import 'package:dartz/dartz.dart';
import 'package:ts_domain/error/failure.dart';
import 'package:ts_domain/models/entities/user.dart';
import 'package:ts_domain/repositories/auth_repository.dart';
import 'package:ts_domain/usecases/usecase.dart';

class CheckAuthStatusUseCase implements UseCase<User?, NoParams> {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  @override
  Future<Either<Failure, User?>> call(NoParams params) async {
    final result = await repository.getCurrentUser();

    return result;
  }
}
