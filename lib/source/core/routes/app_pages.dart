import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tecnical_task/source/core/routes/app_routes.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      /// Login
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => Container(), // todo
      ),
    ],
  );
}
