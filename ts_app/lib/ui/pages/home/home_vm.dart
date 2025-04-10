import 'package:flutter/foundation.dart';
import 'package:ts_domain/usecases/sign_out_usecase.dart';
import 'package:ts_domain/usecases/usecase.dart';

import '../../../utils/logger.dart';
import 'home_navigator.dart';

class HomeVM extends ChangeNotifier {
  HomeNavigator _navigator;
  SignOutUseCase _signOutUseCase;

  HomeVM({
    required HomeNavigator navigator,
    required SignOutUseCase signOutUseCase,
  }) : _navigator = navigator,
       _signOutUseCase = signOutUseCase;

  void logout() async {
    final result = await _signOutUseCase(NoParams());

    result.fold(
      (failure) {
        logger.e(failure.message);
      },
      (_) async {
        _navigator.openSignIn();
      },
    );
  }
}
