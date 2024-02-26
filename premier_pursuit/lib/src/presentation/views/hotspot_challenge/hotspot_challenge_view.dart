import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/blue_drawer.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';
import 'package:premier_pursuit/src/utils/show_password_dialog.dart';

@RoutePage()
class HotspotChallengeView extends StatefulWidget {
  const HotspotChallengeView({super.key});

  @override
  State<HotspotChallengeView> createState() => _HotspotChallengeViewState();
}

class _HotspotChallengeViewState extends State<HotspotChallengeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.blueFont),
    );
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      onDrawerChanged: (isOpened) {
        setState(() {
          _isDrawerOpen = isOpened;
        });
      },
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Drawer(
          elevation: 0,
          width: screenWidth * 0.55,
          backgroundColor: AppColors.drawerWhiteBackground,
          child: Row(
            children: [
              BlueDrawer(screenWidth: screenWidth, isMultiChallenge: true),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.33,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              color: AppColors.lightBlue,
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.only(left: 10),
                              color: Colors.white,
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () => Navigator.pop,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Hot Spot\nChallenge',
                        style: AppTypography.textStyle(
                          fontSize: 38,
                          color: AppColors.lightBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5),
                      child: Text(
                        'YMCA',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 6),
                      child: Container(
                        height: 1,
                        width: 140,
                        color: AppColors.lightBlue,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0, top: 5),
                          child: Text(
                            '\“YMCA\” is a beloved party dance song. ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 5),
                          child: Text(
                            'Let’s swap out the letters for numbers\nat today\’s \“hot spot\” . . . found at a\nparty venue across from a fountain.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 30),
                          child: Text(
                            'Your facilitator is waiting for you there.\n'
                            'Find the hot spot and complete in the\nchallenge posed to earn additional points.',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 17,
                              height: 1.3,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 30),
                          child: Text(
                            'The “Hot Spot” is only open\nfrom 3:00pm to 4:00pm.\n\nTo collect your points... Add an additional\nline here about needing to enter the\npassword next.',
                            softWrap: true,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 17,
                              height: 1.3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: CustomOutlinedButton(
                            width: screenWidth / 3,
                            borderColor: AppColors.blueFont,
                            backgroundColor: AppColors.lightBlue,
                            text: 'SUBMIT ANSWER',
                            onTap: () {
                              Navigator.of(context).pop();

                              showPasswordDialog(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hotspot_back.png'),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AppIcons.triviaWhite,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'TRAINING',
                                  style: AppTypography.textStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 54,
                          decoration: BoxDecoration(
                            color: AppColors.lightBlue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'YOUR SCORE:',
                                style: AppTypography.textStyle(
                                    fontSize: 10, fontWeight: FontWeight.w200),
                              ),
                              Text(
                                '2500',
                                style: AppTypography.textStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
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
                      mainAxisAlignment: _isDrawerOpen
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'TEAM NAME HERE',
                            style: AppTypography.textStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
