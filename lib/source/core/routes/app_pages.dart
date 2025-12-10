import 'package:go_router/go_router.dart';
import 'package:tecnical_task/source/core/dependencies/app_dependencies.dart';
import 'package:tecnical_task/source/core/routes/app_routes.dart';
import 'package:tecnical_task/source/core/services/shared_preferences_service.dart';
import 'package:tecnical_task/source/features/content/presentation/page/content_page.dart';
import 'package:tecnical_task/source/features/login/presentation/page/login_page.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    redirect: (context, state) async {
      final sharedPreferencesService = instance<SharedPreferencesService>();
      final isLoggedIn = await sharedPreferencesService.isLoggedIn();
      final isGoingToLogin = state.matchedLocation == AppRoutes.login;
      final isGoingToContent = state.matchedLocation == AppRoutes.content;

      /// If logged in and trying to go to login, redirect to content
      if (isLoggedIn && isGoingToLogin) {
        return AppRoutes.content;
      }

      /// If not logged in and trying to go to content, redirect to login
      if (!isLoggedIn && isGoingToContent) {
        return AppRoutes.login;
      }

      return null;
    },
    routes: [
      /// Login
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),

      /// Content
      GoRoute(
        path: AppRoutes.content,
        builder: (context, state) => const ContentPage(),
      ),
    ],
  );
}
