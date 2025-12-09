import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/routes/app_pages.dart';
import 'package:tecnical_task/source/core/themes/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      /// Router
      routerConfig: AppRouter.router,

      /// Name App
      title: 'Tecnical test', // todo
      /// Cancel check marker in corner
      debugShowCheckedModeBanner: false,

      /// Theme
      theme: AppThemes.getAppTheme(),
    );
  }
}
