import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';
import 'package:tecnical_task/source/layout/app_card_shimmer_layout.dart';

class AppLoadingLayout extends StatelessWidget {
  const AppLoadingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.paddingOrMargin16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const AppCardShimmerLayout();
      },
    );
  }
}
