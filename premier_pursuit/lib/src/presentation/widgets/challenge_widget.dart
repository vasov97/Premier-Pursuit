import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';

class ChallengeWidget extends StatelessWidget {
  const ChallengeWidget({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 105.12,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
            borderRadius:
                BorderRadius.circular(20.0), // BorderRadius for rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                text,
                style: AppTypography.textStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blueFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
