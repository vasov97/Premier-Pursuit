import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/blue_drawer.dart';

@RoutePage()
class EndScoreView extends StatefulWidget {
  const EndScoreView({super.key});

  @override
  State<EndScoreView> createState() => _EndScoreViewState();
}

class _EndScoreViewState extends State<EndScoreView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.blueFont),
    );
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 10,
            backgroundColor: const Color.fromARGB(90, 2, 65, 120),
            elevation: 0,
          ),
          body: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.blueFont,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0, right: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 200,
                              height: 64,
                              decoration: BoxDecoration(
                                color: AppColors.orangeBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'YOUR SCORE: ',
                                    style: AppTypography.textStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    '2500',
                                    style: AppTypography.textStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0, right: 15),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'TEAM NAME HERE',
                                style: AppTypography.textStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.white,
                                height: 10,
                                width: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'PROGRAM NAME HERE',
                                style: AppTypography.textStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8)),
                      width: screenWidth / 3.5,
                      height: screenHeight / 2.5,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: [
                            Text(
                              'CONGRATULATIONS,',
                              style: AppTypography.textStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blueFont),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Team ',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.orangeBackground,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '__________!',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: AppColors.orangeBackground,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '  YOU HAVE COMPLETED\nALL OF THE CHALLENGES!',
                                  style: AppTypography.textStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'YOUR TEAM\'S FINAL SCORE IS:',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.5),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '2500 ',
                              style: TextStyle(
                                fontSize: 50,
                                color: AppColors.orangeBackground,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: BlueDrawer(
              screenWidth: screenWidth * 0.7, isMultiChallenge: true),
        ),
      ],
    );
  }
}
