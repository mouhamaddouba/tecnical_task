import 'package:flutter/material.dart';

abstract class AppFonts {
  static const String fontFamily = 'Roboto';
}

TextStyle getLightStyle({double fontSize = 14.0, Color color = Colors.black}) {
  return TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: fontSize,
    fontWeight: FontWeight.w300,
    color: color,
  );
}

TextStyle getRegularStyle({
  double fontSize = 14.0,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle getMediumStyle({double fontSize = 14.0, Color color = Colors.black}) {
  return TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: fontSize,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

TextStyle getSemiBoldStyle({
  double fontSize = 14.0,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    color: color,
  );
}

TextStyle getBoldStyle({double fontSize = 14.0, Color color = Colors.black}) {
  return TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    color: color,
  );
}
