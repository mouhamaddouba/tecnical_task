import 'package:tecnical_task/source/core/bloc/network/network_bloc.dart';
import 'package:tecnical_task/source/core/dependencies/app_binding.dart';
import 'package:tecnical_task/source/core/dependencies/app_dependencies.dart';
import 'package:tecnical_task/source/core/services/shared_preferences_service.dart';
import 'package:tecnical_task/source/features/login/presentation/bloc/login_bloc.dart';

class LoginDi extends BaseBinding {
  @override
  void dependencies() {
    if (!instance.isRegistered<LoginBloc>()) {
      instance.registerFactory<LoginBloc>(
        () => LoginBloc(
          networkBloc: instance<NetworkBloc>(),
          sharedPreferencesService: instance<SharedPreferencesService>(),
        ),
      );
    }
  }

  @override
  void dispose() {}
}
