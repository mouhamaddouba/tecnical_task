import 'package:get_it/get_it.dart';
import 'package:tecnical_task/source/core/bloc/network/network_bloc.dart';
import 'package:tecnical_task/source/core/services/api_service.dart';
import 'package:tecnical_task/source/core/services/shared_preferences_service.dart';
import 'package:tecnical_task/source/features/content/presentation/di/content_di.dart';
import 'package:tecnical_task/source/features/login/presentation/di/login_di.dart';

final instance = GetIt.instance;

Future<void> appDependencies() async {
  /// Services injection
  instance.registerLazySingleton<ApiService>(() => ApiService());
  instance<ApiService>().init();

  instance.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(),
  );
  await instance<SharedPreferencesService>().init();

  /// Networks injection
  instance.registerLazySingleton<NetworkBloc>(() => NetworkBloc());

  /// Auth feature injection
  LoginDi().dependencies();

  /// Content feature injection
  ContentDi().dependencies();
}
