import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tecnical_task/source/core/routes/app_routes.dart';
import 'package:tecnical_task/source/core/themes/app_colors_theme.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';
import 'package:tecnical_task/source/core/values/enums/state_app_enum.dart';
import 'package:tecnical_task/source/features/login/presentation/bloc/login_bloc.dart';

class LoginButtonView extends StatelessWidget {
  const LoginButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.navigateToContent != current.navigateToContent ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.navigateToContent) {
          context.go(AppRoutes.content);
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColorsTheme.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      buildWhen: (previous, current) => previous.stateApp != current.stateApp,
      builder: (context, state) {
        final isLoading = state.stateApp == StateAppEnum.loading;

        return ElevatedButton(
          onPressed: isLoading
              ? null
              : () {
                  context.read<LoginBloc>().add(LoginSubmitted());
                },
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColorsTheme.white,
                    ),
                  ),
                )
              : Text(AppStrings.loginButton),
        );
      },
    );
  }
}
