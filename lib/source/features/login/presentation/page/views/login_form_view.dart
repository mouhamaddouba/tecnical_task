import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';
import 'package:tecnical_task/source/features/login/presentation/bloc/login_bloc.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.usernameError != current.usernameError ||
          previous.passwordError != current.passwordError,
      builder: (context, state) {
        return Column(
          spacing: 16,
          children: [
            /// Username Field
            TextFormField(
              controller: state.usernameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: AppStrings.usernameLabel,
                hintText: AppStrings.usernameHint,
                prefixIcon: const Icon(Icons.person_outline),
                errorText: state.usernameError,
              ),
              onChanged: (value) {},
            ),

            /// Password Field
            TextFormField(
              controller: state.passwordController,
              obscureText: state.obscurePassword,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: AppStrings.passwordLabel,
                hintText: AppStrings.passwordHint,
                prefixIcon: const Icon(Icons.lock_outline),
                errorText: state.passwordError,
                suffixIcon: IconButton(
                  icon: Icon(
                    state.obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {},
                ),
              ),
              onChanged: (value) {},
              onFieldSubmitted: (_) {},
            ),
          ],
        );
      },
    );
  }
}
