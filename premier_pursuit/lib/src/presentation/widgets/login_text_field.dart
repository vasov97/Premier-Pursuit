import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key, required this.text, required this.textColor});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: SizedBox(
        width: 440,
        height: 80,
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
                    color: textColor,
                  ),
                  hintText: text,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 10)),
            ),
          ),
        ),
      ),
    );
  }
}
