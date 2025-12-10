import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';

class AppLoadingLayout extends StatelessWidget {
  const AppLoadingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: AppDimensions.paddingOrMargin16),
          Text(AppStrings.loadingContent),
        ],
      ),
    );
  }
}
