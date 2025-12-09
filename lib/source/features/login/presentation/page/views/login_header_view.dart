import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/themes/app_colors_theme.dart';
import 'package:tecnical_task/source/core/themes/app_fonts_theme.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';

class LoginHeaderView extends StatelessWidget {
  const LoginHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Icon lock
        Icon(
          Icons.lock_outline_rounded,
          size: AppDimensions.iconSize80,
          color: AppColorsTheme.primary,
        ),

        /// Title welcome
        Text(
          AppStrings.welcomeTitle,
          style: getBoldStyle(
            fontSize: AppDimensions.fontSize28,
            color: AppColorsTheme.textPrimary,
          ),
        ),

        /// description welcome
        Text(
          AppStrings.welcomeSubtitle,
          style: getRegularStyle(
            fontSize: AppDimensions.fontSize16,
            color: AppColorsTheme.textSecondary,
          ),
        ),
      ],
    );
  }
}
