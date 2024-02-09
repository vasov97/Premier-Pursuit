import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData get appTheme => ThemeData(
        checkboxTheme: CheckboxThemeData(
          checkColor:
              MaterialStateProperty.all<Color>(AppColors.orangeBackground),
          fillColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      );
}
