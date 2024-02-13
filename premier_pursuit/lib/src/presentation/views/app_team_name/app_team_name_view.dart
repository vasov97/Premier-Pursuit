import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/router/app_router.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/blue_drawer.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';
import 'package:premier_pursuit/src/presentation/widgets/login_text_field.dart';

@RoutePage()
class AppTeamNameView extends StatefulWidget {
  const AppTeamNameView({super.key});

  @override
  State<AppTeamNameView> createState() => _AppTeamNameViewState();
}

class _AppTeamNameViewState extends State<AppTeamNameView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scaffoldKey.currentState!
          .openDrawer(); // Open the drawer after the frame has been rendered
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(17, 70, 132, 0.3),
        elevation: 0,
      ),
      drawer: Drawer(
        elevation: 0,
        width: screenWidth * 0.55,
        backgroundColor: AppColors.drawerWhiteBackground,
        child: Row(
          children: [
            BlueDrawer(screenWidth: screenWidth),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.37,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: IconButton(
                        icon: AppIcons.backButton,
                        onPressed: () => appRouter.popAndPush(
                          const AppInfoRoute(),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 30, top: 25),
                  child: Text(
                    'Choose Your\nTeam Name',
                    style: AppTypography.textStyle(
                      fontSize: 40,
                      color: AppColors.blueFont,
                      fontWeight: FontWeight.w400,
                    ),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: LoginTextField(
                    text: 'ENTER TEAM NAME HERE',
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
                  child: CustomOutlinedButton(
                    borderColor: AppColors.orangeOutline,
                    backgroundColor: AppColors.orangeBackground,
                    text: 'START TRAINING',
                    onTap: () => appRouter.push(const TrainingRoute()),
                  ),
                )
              ],
            ),
          ],
        ),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 64,
                            height: 54,
                            decoration: BoxDecoration(
                              color: AppColors.orangeBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppIcons.adminWhite,
                                Text(
                                  'ADMIN',
                                  style: AppTypography.textStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
