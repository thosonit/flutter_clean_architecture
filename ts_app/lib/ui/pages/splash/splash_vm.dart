import 'package:ts_app/core/base/base_vm.dart';
import 'package:ts_app/ui/pages/splash/splash_navigator.dart';
import 'package:ts_app/utils/logger.dart';
import 'package:ts_domain/usecases/check_auth_status_usecase.dart';
import 'package:ts_domain/usecases/usecase.dart';

class SplashVM extends BaseVM {
  final SplashNavigator _navigator;
  final CheckAuthStatusUseCase _authStatusUserCase;

  SplashVM({
    required SplashNavigator navigator,
    required CheckAuthStatusUseCase authStatusUserCase,
  }) : _navigator = navigator,
       _authStatusUserCase = authStatusUserCase;

  void checkLogin() async {
    final result = await _authStatusUserCase.call(NoParams());
    result.fold(
      (failure) {
        logger.e('Error checking login status: $failure');
      },
      (user) {
        if (user != null) {
          _navigator.openHome();
        } else {
          _navigator.openSignIn();
        }
      },
    );
  }
}
