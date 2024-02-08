import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/const/app_sizes.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key,
      required this.borderColor,
      required this.backgroundColor,
      required this.text,
      required this.onTap});

  final Color borderColor;
  final Color backgroundColor;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: outlineButtonHeight,
      width: outlineButtonWidth,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(outlineButtonRadius),
              side: BorderSide(color: borderColor, width: 3.34),
            ),
          ),
        ),
        child: Text(
          text,
          style: AppTypography.textStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
