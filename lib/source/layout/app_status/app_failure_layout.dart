import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/themes/app_colors_theme.dart';
import 'package:tecnical_task/source/core/themes/app_fonts_theme.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';

class AppFailureLayout extends StatelessWidget {
  final String title;
  final dynamic Function() onPressed;

  const AppFailureLayout({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingOrMargin24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Icon error
            Icon(Icons.error_outline, size: 64, color: AppColorsTheme.error),

            /// Space
            const SizedBox(height: AppDimensions.paddingOrMargin16),

            /// Title error
            Text(
              AppStrings.errorLoadingContent,
              style: getSemiBoldStyle(
                fontSize: AppDimensions.fontSize18,
                color: AppColorsTheme.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            /// Space
            const SizedBox(height: AppDimensions.paddingOrMargin8),

            /// Message error
            Text(
              title,
              style: getRegularStyle(
                fontSize: AppDimensions.fontSize14,
                color: AppColorsTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),

            /// Space
            const SizedBox(height: AppDimensions.paddingOrMargin24),

            /// Button retry
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.refresh),
              label: const Text(AppStrings.retry),
            ),
          ],
        ),
      ),
    );
  }
}
