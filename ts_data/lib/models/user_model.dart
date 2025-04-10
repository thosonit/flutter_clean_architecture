
import 'package:ts_domain/models/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      // token: json['token'], // Ví dụ
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      // 'token': token, // Ví dụ
    };
  }

}