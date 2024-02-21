import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/const/strings.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';

@RoutePage()
class EndView extends StatelessWidget {
  const EndView({super.key});

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: screenHeight,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                  ),
                  child: Column(
                    children: [
                      AppIcons.appLogo,
                      const SizedBox(height: 20),
                      Text(
                        appName,
                        style: AppTypography.textStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'THANKS FOR PLAYING!',
                        style: AppTypography.textStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
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
                          Text(
                            admin,
                            style: AppTypography.textStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 28.0, right: 85),
                      child: Column(
                        children: [
                          Text(
                            copyright,
                            style: AppTypography.textStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            appNameR,
                            style: AppTypography.textStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
