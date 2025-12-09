import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnical_task/source/core/bloc/app_bloc.dart';
import 'package:tecnical_task/source/core/routes/app_pages.dart';
import 'package:tecnical_task/source/core/themes/app_themes.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: MaterialApp.router(
        /// Router
        routerConfig: AppRouter.router,

        /// Name App
        title: AppStrings.appName,

        /// Cancel check marker in corner
        debugShowCheckedModeBanner: false,

        /// Theme
        theme: AppThemes.getAppTheme(),

        /// Initializes BotToast + RTL layout
        /// + scales text ×1.2 while displaying the child widget.
        builder: (context, child) {
          return BotToastInit()(
            context,
            Directionality(
              textDirection: TextDirection.rtl,
              child: MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.linear(1.2)),
                child: child!,
              ),
            ),
          );
        },
      ),
    );
  }
}
