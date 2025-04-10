import 'package:ts_data/models/token_model.dart';
import 'package:ts_data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> getLastUser();

  Future<void> cacheUser(UserModel userToCache);

  Future<void> clearCache();

  Future<TokenModel?> getToken();

  Future<void> saveToken(TokenModel token);

  Future<void> clearToken();
}
