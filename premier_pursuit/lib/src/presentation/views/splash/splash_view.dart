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
                                fontSize: 27,
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
                            const SizedBox(height: 20),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, top: 40),
                        child: Container(
                          width: 535,
                          height: 570,
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
                                      const EdgeInsets.symmetric(vertical: 40),
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
