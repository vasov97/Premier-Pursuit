import 'package:flutter/material.dart';

class AppTypography {
  static TextStyle textStyle({
    required double fontSize,
    Color? color,
    double? letterSpacing,
    String fontFamily = 'Montserrat',
    required FontWeight fontWeight,
  }) {
    return TextStyle(
        fontSize: fontSize,
        color: color ?? Colors.white,
        letterSpacing: letterSpacing ?? 1,
        fontFamily: fontFamily,
        fontWeight: fontWeight);
  }
}
