import 'package:dartz/dartz.dart';
import 'package:ts_data/datasources/auth_local_datasource.dart';
import 'package:ts_data/datasources/auth_remote_datasource.dart';
import 'package:ts_data/models/user_model.dart';
import 'package:ts_domain/error/exceptions.dart';
import 'package:ts_domain/error/failure.dart';
import 'package:ts_domain/models/entities/token.dart';
import 'package:ts_domain/models/entities/user.dart';
import 'package:ts_domain/repositories/auth_repository.dart';

typedef _AuthCall<T> = Future<T> Function();

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<Either<Failure, T>> _performAuthCall<T>(_AuthCall<T> authCall) async {
    try {
      final result = await authCall();
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final localUser = await localDataSource.getLastUser();
      if (localUser != null) {
        return Right(localUser);
      } else {
        return Right(null);
      }
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Token>> signIn({
    required String email,
    required String password,
  }) async {
    return await _performAuthCall<Token>(() async {
      final token = await remoteDataSource.signIn(
        email: email,
        password: password,
      );

      await localDataSource.saveToken(token);
      await localDataSource.cacheUser(
        UserModel(id: "id", name: "name", email: "email"),
      );

      return token.toToken();
    });
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await localDataSource.clearCache();
      await _performAuthCall(() => remoteDataSource.signOut());
      return Right(null); // Thành công
    } on CacheException {
      return Left(CacheFailure()); // Lỗi xóa cache
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
