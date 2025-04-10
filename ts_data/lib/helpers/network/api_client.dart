import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ts_data/models/token_model.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///User
  @POST("/v1/auth/token")
  Future<TokenModel> signIn(@Body() Map<String, dynamic> body);
}
