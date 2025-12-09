import 'package:tecnical_task/source/core/dependencies/app_binding.dart';
import 'package:tecnical_task/source/core/dependencies/app_dependencies.dart';
import 'package:tecnical_task/source/core/services/api_service.dart';
import 'package:tecnical_task/source/features/content/data/repositories/content_repository.dart';
import 'package:tecnical_task/source/features/content/presentation/bloc/content_bloc.dart';

class ContentDi extends BaseBinding {
  @override
  void dependencies() {
    if (!instance.isRegistered<ContentRepository>()) {
      instance.registerLazySingleton<ContentRepository>(
        () => ContentRepositoryImpl(apiService: instance<ApiService>()),
      );
    }

    if (!instance.isRegistered<ContentBloc>()) {
      instance.registerFactory<ContentBloc>(
        () => ContentBloc(contentRepository: instance<ContentRepository>()),
      );
    }
  }

  @override
  void dispose() {}
}
