import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_images.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';

@RoutePage()
class AdminEventsView extends StatefulWidget {
  const AdminEventsView({super.key});

  @override
  State<AdminEventsView> createState() => _AdminEventsViewState();
}

class _AdminEventsViewState extends State<AdminEventsView> {
  bool isCheckedTeam = false;
  bool isCheckedCompany = false;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        width: screenWidth * 0.6,
        backgroundColor: Colors.white.withOpacity(0.9),
        child: Row(
          children: <Widget>[
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Material(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                    ),
                    elevation: 6,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20.0),
                      ),
                      child: Container(
                        color: AppColors.blueFont,
                        width: screenWidth * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 70,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                width: 66.8,
                                child: AppImages.helpCircle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                  height: 73,
                                  width: 73,
                                  child: AppIcons.appLogo),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: AppIcons.backButton,
                        onPressed: () {
                          Navigator.pop(context);
                          // setState(() {
                          //   isDrawerOpen = !isDrawerOpen;
                          // });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      AppIcons.adminOrange,
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Admin',
                          style: AppTypography.textStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blueFont,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      AppIcons.loading,
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Load Event',
                          style: AppTypography.textStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blueFont,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: Row(
                          children: [
                            AppIcons.wifi,
                            Text(
                              'WI-FI REQUIRED ',
                              style: AppTypography.textStyle(
                                  fontSize: 10,
                                  color: AppColors.blueFont,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isCheckedTeam,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedTeam = value!;
                          });
                        },
                      ),
                      Text(
                        'DECKERDEVS BICYCLE TEAM BUILDING',
                        style: AppTypography.textStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: isCheckedTeam
                              ? AppColors.orangeBackground
                              : AppColors.blueFont,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isCheckedCompany,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedCompany = value!;
                          });
                        },
                      ),
                      Text(
                        'COMPANY NAME TEAM BUILDING EVENT',
                        style: AppTypography.textStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: isCheckedCompany
                              ? AppColors.orangeBackground
                              : AppColors.blueFont,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 90, left: 25, right: 25),
                  child: CustomOutlinedButton(
                      borderColor: AppColors.orangeOutline,
                      backgroundColor: AppColors.orangeBackground,
                      text: 'LOAD SELECTED EVENTS',
                      textColor: Colors.white,
                      onTap: () {}),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: AppIcons.magnifier,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Don\'t see your Event?',
                        style: AppTypography.textStyle(
                            fontSize: 17,
                            color: AppColors.blueFont,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 90),
                      child: Row(
                        children: [
                          AppIcons.wifi,
                          Text(
                            'WI-FI REQUIRED ',
                            style: AppTypography.textStyle(
                                fontSize: 10,
                                color: AppColors.blueFont,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: CustomOutlinedButton(
                      borderColor: AppColors.orangeOutline,
                      backgroundColor: Colors.white,
                      text: 'REFRESH EVENTS',
                      textColor: AppColors.orangeOutline,
                      onTap: () {}),
                ),
              ],
            )
            // Add more ListTile items as needed
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
                    image: AssetImage(
                        'assets/images/background.png'), // Background image
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
                      Colors
                          .transparent, // Optional: add more colors if desired
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                  right: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        AppIcons.adminLogout,
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'ADMIN SIGN-OUT',
                            style: AppTypography.textStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.orangeBackground),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'BE SURE TO SIGN OUT ONCE\nADMIN TASKS ARE COMPLETED',
                            style: AppTypography.textStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w100,
                              color: Color.fromRGBO(255, 255, 255, 1),
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
