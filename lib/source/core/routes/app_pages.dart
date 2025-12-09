import 'package:go_router/go_router.dart';
import 'package:tecnical_task/source/core/routes/app_routes.dart';
import 'package:tecnical_task/source/features/content/presentation/page/content_page.dart';
import 'package:tecnical_task/source/features/login/presentation/page/login_page.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
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
