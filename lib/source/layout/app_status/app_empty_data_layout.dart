import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/themes/app_colors_theme.dart';
import 'package:tecnical_task/source/core/themes/app_fonts_theme.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';

class AppEmptyDataLayout extends StatelessWidget {
  final String title;

  const AppEmptyDataLayout({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Icon
          Icon(Icons.hourglass_empty),

          /// Space
          SizedBox(height: AppDimensions.paddingOrMargin16),

          /// title
          Text(
            title,
            style: getRegularStyle(
              fontSize: AppDimensions.fontSize16,
              color: AppColorsTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
