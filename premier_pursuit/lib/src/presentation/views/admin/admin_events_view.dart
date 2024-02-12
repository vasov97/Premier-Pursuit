import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:premier_pursuit/src/config/router/app_router.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_images.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/app_texts/app_texts.dart';
import 'package:premier_pursuit/src/presentation/widgets/blue_drawer.dart';
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
  bool isLoading = false;
  bool isDataLoaded = false;

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
            BlueDrawer(screenWidth: screenWidth),
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
                        child: admin45,
                      ),
                    ],
                  ),
                ),
                !isDataLoaded
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      wifiRequired,
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
                            padding: const EdgeInsets.only(
                                bottom: 90, left: 25, right: 25),
                            child: CustomOutlinedButton(
                                borderColor: AppColors.orangeOutline,
                                backgroundColor: AppColors.orangeBackground,
                                text: 'LOAD SELECTED EVENTS',
                                textColor: Colors.white,
                                onTap: () {
                                  setState(() {
                                    isLoading = true;
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      setState(() {
                                        isLoading = false;
                                        isDataLoaded = true;
                                      });
                                    });
                                  });
                                }),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: AppIcons.magnifier,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: eventText,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 90),
                                child: Row(
                                  children: [
                                    AppIcons.wifi,
                                    wifiRequired,
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
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                AppIcons.calendar,
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: currentEvent,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'DeckerDevs Bicycle\nTeam Building',
                              style: AppTypography.textStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: AppColors.orangeBackground,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 5,
                            ),
                            child: companyName,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: cityStateDate),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 12,
                            ),
                            child: Container(
                              width: 380,
                              height: 2,
                              color: const Color.fromRGBO(1, 44, 82, 0.11),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 5,
                            ),
                            child: Text(
                              'Team Name',
                              style: AppTypography.textStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueFont,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      questionsAnswered,
                                      Row(
                                        children: [
                                          Text(
                                            '115',
                                            style: AppTypography.textStyle(
                                              fontSize: 19,
                                              color: AppColors.orangeBackground,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            '/118',
                                            style: AppTypography.textStyle(
                                              fontSize: 19,
                                              color: AppColors.orangeBackground,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      teamScore,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '6800',
                                            style: AppTypography.textStyle(
                                              fontSize: 19,
                                              color: AppColors.orangeBackground,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            '/8000',
                                            style: AppTypography.textStyle(
                                              fontSize: 19,
                                              color: AppColors.orangeBackground,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 170.0,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppIcons.wifi,
                                wifiRequired,
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: CustomOutlinedButton(
                              borderColor: AppColors.orangeOutline,
                              backgroundColor: AppColors.orangeOutline,
                              text: 'COMPLETE EVENT',
                              onTap: () => appRouter.push(
                                const EventAdventureRoute(),
                              ),
                            ),
                          )
                        ],
                      ),
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
            ],
          ),
          isLoading
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 75),
                            child: SizedBox(
                              height: 240,
                              width: 240,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const LoadingIndicator(
                                    strokeWidth: 4,
                                    indicatorType: Indicator.lineSpinFadeLoader,
                                    colors: [
                                      Color.fromARGB(220, 255, 255, 255)
                                    ],
                                  ),
                                  loading,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [AppImages.loadingText],
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
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
                              color: const Color.fromRGBO(255, 255, 255, 1),
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
