import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_navigator.dart';
import 'home_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeVM>(
      create: (BuildContext context) {
        return HomeVM(
          navigator: HomeNavigator(context: context),
          signOutUseCase: context.read(),
        );
      },
      child: const HomeChildPage(),
    );
  }
}

class HomeChildPage extends StatefulWidget {
  const HomeChildPage({super.key});

  @override
  State<HomeChildPage> createState() => _HomeChildPageState();
}

class _HomeChildPageState extends State<HomeChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              context.read<HomeVM>().logout();
            },
          ),
        ],
      ),
      body: Center(child: Text("Home Page")),
    );
  }
}
