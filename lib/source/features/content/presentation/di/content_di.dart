import 'package:tecnical_task/source/core/dependencies/app_binding.dart';
import 'package:tecnical_task/source/core/dependencies/app_dependencies.dart';
import 'package:tecnical_task/source/features/content/presentation/bloc/content_bloc.dart';

class ContentDi extends BaseBinding {
  @override
  void dependencies() {
    if (!instance.isRegistered<ContentBloc>()) {
      instance.registerFactory<ContentBloc>(() => ContentBloc());
    }
  }

  @override
  void dispose() {}
}
