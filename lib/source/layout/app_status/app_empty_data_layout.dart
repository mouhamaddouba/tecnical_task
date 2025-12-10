import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tecnical_task/source/core/themes/app_colors_theme.dart';
import 'package:tecnical_task/source/core/themes/app_fonts_theme.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';

class AppEmptyDataLayout extends StatelessWidget {
  final String image;
  final String title;
  final bool withButton;
  final String textButton;
  final dynamic Function()? addData;

  const AppEmptyDataLayout({
    super.key,
    required this.image,
    required this.title,
    this.withButton = false,
    this.textButton = AppStrings.noContentAvailable,
    this.addData,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Image
          Image.asset(image),

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
