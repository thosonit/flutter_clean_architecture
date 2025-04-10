import 'package:ts_domain/models/entities/token.dart';

class TokenModel {
  String accessToken;

  TokenModel({required this.accessToken});

  TokenModel.fromJson(Map<String, dynamic> json)
    : accessToken = json['access_token'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    return data;
  }

  Token toToken() {
    return Token(accessToken: accessToken);
  }
}
