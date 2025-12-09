import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/themes/app_colors_theme.dart';
import 'package:tecnical_task/source/core/themes/app_fonts_theme.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';

class AppThemes {
  static ThemeData getAppTheme() {
    return lightTheme();
  }

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColorsTheme.primary,
      scaffoldBackgroundColor: AppColorsTheme.scaffoldBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColorsTheme.primary,
        secondary: AppColorsTheme.secondary,
        error: AppColorsTheme.error,
        surface: AppColorsTheme.surface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorsTheme.primary,
        foregroundColor: AppColorsTheme.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: getSemiBoldStyle(
          fontSize: AppDimensions.fontSize18,
          color: AppColorsTheme.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsTheme.primary,
          foregroundColor: AppColorsTheme.white,
          minimumSize: const Size(double.infinity, AppDimensions.height56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius12),
          ),
          textStyle: getSemiBoldStyle(
            fontSize: AppDimensions.fontSize16,
            color: AppColorsTheme.white,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorsTheme.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingOrMargin16,
          vertical: AppDimensions.paddingOrMargin16,
        ),
        hintStyle: getRegularStyle(
          fontSize: AppDimensions.fontSize14,
          color: AppColorsTheme.textHint,
        ),
        labelStyle: getRegularStyle(
          fontSize: AppDimensions.fontSize14,
          color: AppColorsTheme.textSecondary,
        ),
        errorStyle: getRegularStyle(
          fontSize: AppDimensions.fontSize12,
          color: AppColorsTheme.error,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
          borderSide: const BorderSide(
            color: AppColorsTheme.border,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
          borderSide: const BorderSide(
            color: AppColorsTheme.borderFocused,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
          borderSide: const BorderSide(color: AppColorsTheme.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
          borderSide: const BorderSide(color: AppColorsTheme.error, width: 2.0),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColorsTheme.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
        ),
      ),
    );
  }
}
