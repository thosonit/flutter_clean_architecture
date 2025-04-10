import 'package:ts_app/core/base/base_navigator.dart';
import 'package:ts_app/core/navigation/app_router.dart';

class SplashNavigator extends BaseNavigator {
  SplashNavigator({required super.context});

  void openSignIn() {
    pushReplacement(AppRouter.signIn);
  }

  void openHome() {
    pushReplacement(AppRouter.home);
  }
}
