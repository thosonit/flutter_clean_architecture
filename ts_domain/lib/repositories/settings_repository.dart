import 'package:dartz/dartz.dart';
import 'package:ts_domain/error/failure.dart';

abstract class AppSettingsRepository {
  Future<Either<Failure, bool>> isOnboardingComplete();

  Future<Either<Failure, void>> markOnboardingComplete();
}
