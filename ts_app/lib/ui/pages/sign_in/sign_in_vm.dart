import 'package:flutter/foundation.dart';
import 'package:ts_domain/usecases/sign_in_usecase.dart';

import '../../../utils/logger.dart';
import 'sign_in_navigator.dart';

class SignInVM extends ChangeNotifier {
  final SignInNavigator _navigator;
  final SignInUseCase _signInUseCase;

  String get email => _email;
  String _email = '';

  String get password => _password;
  String _password = '';

  bool get isSigningIn => _isSigningIn;
  bool _isSigningIn = false;

  SignInVM({
    required SignInNavigator navigator,
    required SignInUseCase signInUseCase,
  }) : _navigator = navigator,
       _signInUseCase = signInUseCase;

  void changeEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void changePassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> signIn() async {
    if (_isSigningIn) return;

    _isSigningIn = true;
    notifyListeners();

    final params = SignInParams(email: _email, password: _password);

    final result = await _signInUseCase(params);

    result.fold(
      (failure) {
        logger.e(failure.message);
      },
      (token) async {
        openHomePage();
      },
    );

    _isSigningIn = false;
    notifyListeners();
  }

  void openHomePage() {
    _navigator.openHomePage();
  }
}
