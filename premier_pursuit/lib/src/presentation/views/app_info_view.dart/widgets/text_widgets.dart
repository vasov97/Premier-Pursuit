import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';

import '../../../../config/theme/app_colors.dart';

Widget numberWidget(String number) => Center(
      child: Text(
        number,
        style: AppTypography.textStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.blueFont,
        ),
      ),
    );
