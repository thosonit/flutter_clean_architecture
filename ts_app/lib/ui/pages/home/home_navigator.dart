import 'package:ts_app/core/base/base_navigator.dart';
import 'package:ts_app/core/navigation/app_router.dart';

class HomeNavigator extends BaseNavigator {
  HomeNavigator({required super.context});

  void openSignIn() {
    pushReplacement(AppRouter.signIn);
  }
}
