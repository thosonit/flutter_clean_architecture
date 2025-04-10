import 'package:dio/dio.dart';
import 'package:ts_data/helpers/network/api_client.dart';
import 'package:ts_data/models/token_model.dart';
import 'package:ts_data/models/user_model.dart';
import 'package:ts_domain/error/exceptions.dart';

import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<TokenModel> signIn({
    required String email,
    required String password,
  }) async {
    // Mock login for testing purposes
    if (email == "thoson.it@gmail.com") {
      return TokenModel(accessToken: "accessToken");
    }

    try {
      final response = await apiClient.signIn({
        'email': email,
        'password': password,
      });
      return response;
    } on DioException catch (e) {
      throw ServerException(message: "Lỗi kết nối mạng hoặc client.");
    } catch (e) {
      throw ServerException(message: "Lỗi không mong muốn xảy ra.");
    }
  }

  @override
  Future<void> signOut({String? token}) async {
    // Todo: Implement signOut logic
  }

  @override
  Future<UserModel?> getCurrentUserFromApi({String? token}) async {
    // Todo: Implement getCurrentUserFromApi logic
    return null;
  }
}
