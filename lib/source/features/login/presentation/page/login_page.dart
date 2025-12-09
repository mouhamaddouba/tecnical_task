import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnical_task/source/core/dependencies/app_dependencies.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';
import 'package:tecnical_task/source/features/login/presentation/bloc/login_bloc.dart';
import 'package:tecnical_task/source/features/login/presentation/page/views/login_button_view.dart';
import 'package:tecnical_task/source/features/login/presentation/page/views/login_form_view.dart';
import 'package:tecnical_task/source/features/login/presentation/page/views/login_header_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<LoginBloc>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimensions.paddingOrMargin16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppDimensions.paddingOrMargin80),

                  /// Welcome Header
                  LoginHeaderView(),

                  const SizedBox(height: AppDimensions.paddingOrMargin48),

                  /// Login Form
                  LoginFormView(),

                  const SizedBox(height: AppDimensions.paddingOrMargin32),

                  /// Login Button
                  LoginButtonView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
