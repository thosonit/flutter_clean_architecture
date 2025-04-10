import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ts_data/models/token_model.dart';
import 'package:ts_data/models/user_model.dart';
import 'package:ts_domain/error/exceptions.dart';

import 'auth_local_datasource.dart';

const String CACHED_USER_KEY = 'CACHED_USER';
const String TOKEN_KEY = 'TOKEN_KEY';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl();

  @override
  Future<UserModel?> getLastUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      final jsonString = sharedPreferences.getString(CACHED_USER_KEY);

      if (jsonString != null) {
        try {
          final Map<String, dynamic> jsonMap = json.decode(jsonString);
          return UserModel.fromJson(jsonMap);
        } catch (e) {
          throw CacheException(message: "Lỗi phân tích dữ liệu cache.");
        }
      } else {
        return null;
      }
    } catch (e) {
      throw CacheException(message: "Không thể đọc dữ liệu từ cache.");
    }
  }

  @override
  Future<void> cacheUser(UserModel userToCache) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      final Map<String, dynamic> userJsonMap = userToCache.toJson();
      final String jsonString = json.encode(userJsonMap);
      final success = await sharedPreferences.setString(
        CACHED_USER_KEY,
        jsonString,
      );

      if (!success) {
        throw CacheException(message: "Không thể ghi dữ liệu vào cache.");
      }
    } catch (e) {
      throw CacheException(message: "Không thể ghi dữ liệu vào cache.");
    }
  }

  @override
  Future<void> clearCache() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      final success = await sharedPreferences.remove(CACHED_USER_KEY);
      if (!success) {
        throw CacheException(message: "Không thể xóa dữ liệu khỏi cache.");
      }
    } catch (e) {
      throw CacheException(message: "Không thể xóa dữ liệu khỏi cache.");
    }
  }

  @override
  Future<void> clearToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      final success = await sharedPreferences.remove(TOKEN_KEY);
      if (!success) {
        throw CacheException(message: "Không thể xóa dữ liệu khỏi cache.");
      }
    } catch (e) {
      throw CacheException(message: "Không thể xóa dữ liệu khỏi cache.");
    }
  }

  @override
  Future<TokenModel?> getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      final jsonString = sharedPreferences.getString(TOKEN_KEY);

      if (jsonString != null) {
        try {
          final Map<String, dynamic> jsonMap = json.decode(jsonString);
          return TokenModel.fromJson(jsonMap);
        } catch (e) {
          throw CacheException(message: "Lỗi phân tích dữ liệu cache.");
        }
      } else {
        return null;
      }
    } catch (e) {
      throw CacheException(message: "Không thể đọc dữ liệu từ cache.");
    }
  }

  @override
  Future<void> saveToken(TokenModel token) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    try {
      final Map<String, dynamic> tokenJsonMap = token.toJson();
      final String jsonString = json.encode(tokenJsonMap);
      final success = await sharedPreferences.setString(TOKEN_KEY, jsonString);

      if (!success) {
        throw CacheException(message: "Không thể ghi dữ liệu vào cache.");
      }
    } catch (e) {
      throw CacheException(message: "Không thể ghi dữ liệu vào cache.");
    }
  }
}
