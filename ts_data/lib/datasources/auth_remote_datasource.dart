import 'package:ts_data/models/token_model.dart';
import 'package:ts_data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> signIn({required String email, required String password});

  Future<void> signOut();

  Future<UserModel?> getCurrentUserFromApi();
}
