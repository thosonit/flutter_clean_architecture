import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ts_app/core/navigation/app_router.dart';
import 'package:ts_app/utils/logger.dart';

class BaseNavigator {
  BuildContext context;

  BaseNavigator({required this.context});

  void pop<T extends Object?>([T? result]) {
    GoRouter.of(context).pop(result);
  }

  void popUntilNamed(String name) {
    Navigator.popUntil(context, ModalRoute.withName(name));
  }

  Future<dynamic> pushNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    return GoRouter.of(context).pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  Future<dynamic> pushReplacementNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    return GoRouter.of(context).pushReplacementNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  Future<dynamic> push(String path, {Object? extra}) async {
    return GoRouter.of(context).push(path, extra: extra);
  }

  Future<dynamic> pushReplacement(String path, {Object? extra}) async {
    return GoRouter.of(context).pushReplacement(path, extra: extra);
  }

  Future<dynamic> pushPage(Widget page) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ),
    );
  }
}
