import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:premier_pursuit/src/config/const/strings.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.firstGradient,
              AppColors.secondGradient,
              AppColors.thirdGradient
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIcons.appLogo,
            const SizedBox(height: 20),
            const Text(
              appName,
              style: AppTypography.heading1,
            ),
            const SizedBox(height: 20),
            const CustomOutlinedButton(
              borderColor: AppColors.orangeOutline,
              backgroundColor: AppColors.orangeBackground,
              text: getStarted,
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: AppIcons.admin,
                        ),
                      ),
                      const Text(
                        admin,
                        style: AppTypography.heading5,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 28.0, right: 85),
                  child: Column(
                    children: [
                      Text(copyright, style: AppTypography.heading4),
                      SizedBox(
                        height: 9,
                      ),
                      Text(appNameR, style: AppTypography.heading4)
                    ],
                  ),
                ),
                const Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
