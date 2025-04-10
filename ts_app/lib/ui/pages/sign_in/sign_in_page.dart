import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sign_in_navigator.dart';
import 'sign_in_vm.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInVM>(
      create: (BuildContext context) {
        return SignInVM(
          navigator: SignInNavigator(context: context),
          signInUseCase: context.read(),
        );
      },
      child: const SignInChildPage(),
    );
  }
}

class SignInChildPage extends StatefulWidget {
  const SignInChildPage({super.key});

  @override
  State<SignInChildPage> createState() => _SignInChildPageState();
}

class _SignInChildPageState extends State<SignInChildPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    await Future.delayed(Duration(seconds: 1));
    _emailController.text = "thoson.it@gmail.com";
    _passwordController.text = "Son@1234";
    if (context.mounted) {
      context.read<SignInVM>().changeEmail(_emailController.text);
      context.read<SignInVM>().changePassword(_passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              FlutterLogo(size: 80),
              const SizedBox(height: 40),

              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged:
                    (value) => context.read<SignInVM>().changeEmail(value),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged:
                    (value) => context.read<SignInVM>().changePassword(value),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed:
                    context.read<SignInVM>().isSigningIn
                        ? null
                        : () => context.read<SignInVM>().signIn(),
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
