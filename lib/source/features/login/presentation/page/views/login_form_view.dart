import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        /// Username Field
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AppStrings.usernameLabel,
            hintText: AppStrings.usernameHint,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          onChanged: (value) {},
        ),

        /// Password Field
        TextFormField(
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: AppStrings.passwordLabel,
            hintText: AppStrings.passwordHint,
            prefixIcon: const Icon(Icons.lock_outline),
          ),
          onChanged: (value) {},
          onFieldSubmitted: (_) {},
        ),
      ],
    );
  }
}
