import 'package:flutter/material.dart';

abstract class AppColorsTheme {
  /// Primary colors
  static const Color primary = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFF42A5F5);
  static const Color primaryDark = Color(0xFF1565C0);

  /// Secondary colors
  static const Color secondary = Color(0xFF26A69A);
  static const Color secondaryLight = Color(0xFF4DB6AC);
  static const Color secondaryDark = Color(0xFF00897B);

  /// Background colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFF5F5F5);

  /// Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);

  /// Status colors
  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);

  /// Border colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderFocused = Color(0xFF1976D2);

  /// Other colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFEEEEEE);
}
