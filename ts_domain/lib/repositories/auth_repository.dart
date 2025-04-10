import 'package:dartz/dartz.dart';
import 'package:ts_domain/error/failure.dart';
import 'package:ts_domain/models/entities/token.dart';
import 'package:ts_domain/models/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> getCurrentUser();

  Future<Either<Failure, Token>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();
}
