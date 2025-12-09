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

        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    context.read<LoginBloc>().add(LoginSubmitted());
                  },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                isLoading ? 56 : double.infinity,
                isLoading ? 56 : 48,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isLoading ? 0 : 16,
                vertical: isLoading ? 0 : 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(isLoading ? 28 : 8),
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: Curves.easeInOutCubic,
              switchOutCurve: Curves.easeInOutCubic,
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOutCubic,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOutCubic,
                      ),
                    ),
                    child: child,
                  ),
                );
              },
              child: isLoading
                  ? const SizedBox(
                      key: ValueKey('loading'),
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColorsTheme.white,
                        ),
                      ),
                    )
                  : Text(AppStrings.loginButton, key: const ValueKey('text')),
            ),
          ),
        );
      },
    );
  }
}
