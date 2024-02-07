import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/const/app_sizes.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.borderColor,
    required this.backgroundColor,
    required this.text,
  });

  final Color borderColor;
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: outlineButtonHeight,
      width: outlineButtonWidth,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(outlineButtonRadius),
              side: BorderSide(color: borderColor),
            ),
          ),
        ),
        child: Text(
          text,
          style: AppTypography.heading2,
        ),
      ),
    );
  }
}
