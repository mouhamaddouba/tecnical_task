import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnical_task/app.dart';
import 'package:tecnical_task/source/core/bloc/bloc_observer.dart';
import 'package:tecnical_task/source/core/dependencies/app_dependencies.dart';

Future<void> main() async {
  /// Inject widget app
  WidgetsFlutterBinding.ensureInitialized();

  /// Set screen on vertical mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Init Bloc observer
  Bloc.observer = AppBlocObserver();

  /// Init Dependencies
  await appDependencies();

  /// App
  runApp(const App());
}
