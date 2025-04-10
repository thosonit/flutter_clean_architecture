import 'package:ts_app/core/base/base_navigator.dart';
import 'package:ts_app/core/navigation/app_router.dart';

class SignInNavigator extends BaseNavigator {
  SignInNavigator({required super.context});

  void openHomePage() {
    pushReplacement(AppRouter.home);
  }
}
