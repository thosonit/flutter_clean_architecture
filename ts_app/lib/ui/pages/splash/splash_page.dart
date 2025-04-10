import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_app/ui/pages/splash/splash_navigator.dart';
import 'package:ts_app/ui/pages/splash/splash_vm.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashVM>(
      create: (BuildContext context) {
        return SplashVM(
          navigator: SplashNavigator(context: context),
          authStatusUserCase: context.read(),
        );
      },
      child: const SplashChildPage(),
    );
  }
}

class SplashChildPage extends StatefulWidget {
  const SplashChildPage({super.key});

  @override
  State<SplashChildPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SplashChildPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashVM>().checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FlutterLogo(size: 200)));
  }
}
