import 'package:dartz/dartz.dart';
import 'package:ts_domain/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class CompletableUseCase<Params> {
  Future<Either<Failure, void>> call(Params params);
}

class NoParams {}
