import 'package:dio/dio.dart';

class ApiUtil {
  static Dio? dio;

  ApiUtil._();

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = const Duration(milliseconds: 60000);
    }
    return dio!;
  }
}
