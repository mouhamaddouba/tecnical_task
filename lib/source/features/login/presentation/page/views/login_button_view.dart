import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';

class LoginButtonView extends StatelessWidget {
  const LoginButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(AppStrings.loginButton),
      onPressed: () {},
    );
  }
}
