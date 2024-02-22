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
import 'package:premier_pursuit/src/presentation/widgets/challenge_widget.dart';
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
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Drawer(
          width: _currentPage > 2 ? screenWidth : screenWidth * 0.53,
          backgroundColor: Colors.white.withOpacity(0.9),
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
              debugPrint(_currentPage.toString());
            },
            children: [
              //page1
              Row(
                children: <Widget>[
                  BlueDrawer(
                    screenWidth: screenWidth,
                    isMultiChallenge: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 15),
                    child: Column(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
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
                                          //isDataLoaded = true;
                                          _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
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
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 90),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: CustomOutlinedButton(
                                  borderColor: AppColors.orangeOutline,
                                  backgroundColor: Colors.white,
                                  text: 'REFRESH EVENTS',
                                  textColor: AppColors.orangeOutline,
                                  onTap: () {}),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              //page2
              Row(
                children: [
                  BlueDrawer(
                    screenWidth: screenWidth,
                    isMultiChallenge: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: AppIcons.backButton,
                                onPressed: () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
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
                          child: dockerDevsTeam,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5,
                          ),
                          child: companyName,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
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
                            child: teamName),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: CustomOutlinedButton(
                            borderColor: AppColors.orangeOutline,
                            backgroundColor: AppColors.orangeOutline,
                            text: 'COMPLETE EVENT',
                            onTap: () {
                              return _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //page3
              Row(
                children: [
                  BlueDrawer(
                    screenWidth: screenWidth,
                    isMultiChallenge: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            child: eventAdventureTitle,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            child: companyName,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            child: cityStateDate,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            child: Container(
                              width: 380,
                              height: 2,
                              color: const Color.fromRGBO(1, 44, 82, 0.11),
                            ),
                          ),
                          welcomeToAdventure,
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: variety,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 15,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ChallengeWidget(
                                      icon: AppIcons.trivia,
                                      text: 'TRIVIA',
                                    ),
                                    ChallengeWidget(
                                      icon: AppIcons.camera,
                                      text: 'PHOTO',
                                    ),
                                    ChallengeWidget(
                                      icon: AppIcons.youtube,
                                      text: 'VIDEO',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ChallengeWidget(
                                      icon: AppIcons.hotspot,
                                      text: 'HOT SPOT',
                                    ),
                                    ChallengeWidget(
                                      icon: AppIcons.search,
                                      text: 'COLLECT',
                                    ),
                                    ChallengeWidget(
                                      icon: AppIcons.gift,
                                      text: 'BONUS',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          followTheRulesText,
                          CustomOutlinedButton(
                            borderColor: AppColors.orangeOutline,
                            backgroundColor: AppColors.orangeBackground,
                            text: 'GET STARTED',
                            onTap: () => appRouter.push(const AppInfoRoute()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //page4
              Row(
                children: [
                  BlueDrawer(
                    screenWidth: screenWidth,
                    isMultiChallenge: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: AppIcons.backButton,
                          onPressed: () => Navigator.pop,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AppIcons.help,
                                    ),
                                    information(34),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                      ),
                                      child: AppIcons.loading,
                                    ),
                                    eventRules
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 83.12,
                                        height: 95,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Center(child: buildNumber('1')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AppImages.ruleOne,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 83.12,
                                        height: 95,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Center(child: buildNumber('2')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AppImages.ruleTwo,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 83.12,
                                        height: 95,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Center(child: buildNumber('3')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AppImages.ruleFive,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50.0),
                                        child: Container(
                                          height: 63,
                                          width: 2,
                                          color: const Color.fromARGB(
                                            111,
                                            2,
                                            65,
                                            120,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            eventFacilitator,
                                            facilitatorName,
                                            phoneNumberPlaceholder
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 110,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Container(
                                            width: 83.12,
                                            height: 95,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child:
                                                Center(child: buildNumber('4')),
                                          ),
                                        ),
                                        AppImages.ruleFour,
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Container(
                                            width: 83.12,
                                            height: 95,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child:
                                                Center(child: buildNumber('5')),
                                          ),
                                        ),
                                        AppImages.ruleThree,
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Container(
                                            width: 83.12,
                                            height: 95,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Center(
                                              child: buildNumber('6'),
                                            ),
                                          ),
                                        ),
                                        AppImages.ruleSix,
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: CustomOutlinedButton(
                                        borderColor: AppColors.orangeOutline,
                                        backgroundColor:
                                            AppColors.orangeBackground,
                                        text: 'CONTINUE',
                                        onTap: () => _pageController.nextPage(
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeInOut,
                                            )),
                                  ),
                                ],
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
          _currentPage <= 1
              ? Column(
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
                                child: adminSignOut,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: signOutMsg),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
