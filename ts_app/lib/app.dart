import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_app/core/navigation/app_router.dart';
import 'package:ts_app/injection/repository_providers.dart';
import 'package:ts_app/injection/use_case_providers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...createRepositoryProviders(), ...createUseCaseProviders()],
      child: MaterialApp.router(
        title: 'Clean Architecture',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
