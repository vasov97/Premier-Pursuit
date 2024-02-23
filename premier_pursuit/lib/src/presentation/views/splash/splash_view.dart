import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:premier_pursuit/src/config/const/strings.dart';
import 'package:premier_pursuit/src/config/router/app_router.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';
import 'package:premier_pursuit/src/presentation/widgets/login_text_field.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool _showAdmin = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                !_showAdmin
                    ? Padding(
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
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomOutlinedButton(
                                borderColor: AppColors.orangeOutline,
                                backgroundColor: AppColors.orangeBackground,
                                text: getStarted,
                                onTap: () {
                                  setState(() {
                                    _showAdmin = true;
                                  });
                                }),
                            // CustomOutlinedButton(
                            //     borderColor: AppColors.orangeOutline,
                            //     backgroundColor: AppColors.orangeBackground,
                            //     text: 'End score',
                            //     onTap: () {
                            //       //appRouter.push(const EndScoreRoute());
                            //       appRouter.push(const VideoChallengeRoute());
                            //     }),
                            // CustomOutlinedButton(
                            //     borderColor: AppColors.orangeOutline,
                            //     backgroundColor: AppColors.orangeBackground,
                            //     text: 'End',
                            //     onTap: () {
                            //       appRouter.push(const EndRoute());
                            //     }),

                            const SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 98.0, top: 55),
                        child: Container(
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _showAdmin = false;
                                      });
                                    },
                                    icon: AppIcons.close,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Admin Login',
                                    style: AppTypography.textStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blueFont,
                                    ),
                                  ),
                                ),
                                const LoginTextField(
                                  textColor: AppColors.orangeBackground,
                                  text: adminPasswordHint,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: CustomOutlinedButton(
                                    borderColor: AppColors.orangeOutline,
                                    backgroundColor: AppColors.orangeBackground,
                                    text: 'LOGIN',
                                    onTap: () => appRouter.push(
                                      const AdminEventsRoute(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        ),
                      ),
                // const SizedBox(
                //   height: 80,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                    //bottom: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 4.0,
                              ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
