import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/const/strings.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: SizedBox(
        width: 450,
        height: 85,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintStyle: AppTypography.textStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    color: AppColors.orangeBackground,
                  ),
                  hintText: text,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 30)),
            ),
          ),
        ),
      ),
    );
  }
}
