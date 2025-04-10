import 'package:go_router/go_router.dart';
import 'package:ts_app/ui/pages/home/home_page.dart';
import 'package:ts_app/ui/pages/sign_in/sign_in_page.dart';
import 'package:ts_app/ui/pages/splash/splash_page.dart';

class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String signIn = '/sign-in';
  static const String home = '/home';

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashPage()),
      GoRoute(path: signIn, builder: (context, state) => const SignInPage()),
      GoRoute(path: home, builder: (context, state) => const HomePage()),
    ],
  );
}
