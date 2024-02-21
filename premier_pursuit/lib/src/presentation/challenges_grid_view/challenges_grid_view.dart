import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_images.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/blue_drawer.dart';

@RoutePage()
class ChallengesGridView extends StatefulWidget {
  const ChallengesGridView({super.key});

  @override
  State<ChallengesGridView> createState() => _ChallengesGridViewState();
}

class _ChallengesGridViewState extends State<ChallengesGridView> {
  int _currentIndex = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(children: [
      Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 40,
          color: _setColor(_currentIndex),
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
                    letterSpacing: 1.7,
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
                    letterSpacing: 1.7,
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            toolbarHeight: 120,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.blueFont,
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              30.0), // Adjust border radius as needed
                          color: Colors.white, // Set white background color
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: _setColor(_currentIndex),
                          ),
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index
                                      ? _setColor(_currentIndex)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: _setColor(_currentIndex),
                          ),
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _setIcon(_currentIndex),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            _setTitle(_currentIndex),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 37,
                                letterSpacing: 1.4),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 13.0),
                        child: Container(
                          width: 200,
                          height: 54,
                          decoration: BoxDecoration(
                            color: _setColor(_currentIndex),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'YOUR SCORE:',
                                style: AppTypography.textStyle(
                                    fontSize: 13, fontWeight: FontWeight.w200),
                              ),
                              Text(
                                ' 2500',
                                style: AppTypography.textStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.07,
                    ),
                    SizedBox(
                      width: screenWidth * 0.93,
                      //height: screenHeight * 0.8,
                      child: GridView.builder(
                        //shrinkWrap: true,
                        //physics: const NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                        ),
                        itemBuilder: (context, index) {
                          return GridTile(
                            child: SizedBox(
                              width: screenWidth * 0.1,
                              height: screenHeight * 0.1,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  AppImages.gridImage(index + 1),
                                  Container(
                                    color: index > 7
                                        ? const Color.fromRGBO(
                                            237, 16, 100, 0.7)
                                        : const Color.fromARGB(
                                            166, 255, 255, 255),
                                  ),
                                  Center(
                                    child: index > 7
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/trivia.svg',
                                                width: 55.69,
                                                height: 55.19,
                                                color: Colors.white,
                                              ),
                                              const Text(
                                                '100',
                                                style: TextStyle(
                                                    fontSize: 65,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w800,
                                                    letterSpacing: 1.3),
                                              ),
                                            ],
                                          )
                                        : const Text(
                                            '100',
                                            style: TextStyle(
                                                fontSize: 65,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.07,
                    ),
                    SizedBox(
                      width: screenWidth * 0.93,
                      child: GridView.builder(
                        itemCount: 15,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                        ),
                        itemBuilder: (context, index) {
                          return GridTile(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                AppImages.gridImage(index + 1),
                                Container(
                                  color: index > 7
                                      ? const Color.fromRGBO(0, 104, 56, 0.7)
                                      : const Color.fromARGB(
                                          166, 255, 255, 255),
                                ),
                                Center(
                                  child: index > 7
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/icons/camera.png',
                                                width: 55.69,
                                                height: 55.19,
                                                color: Colors.white),
                                            const Text(
                                              '200',
                                              style: TextStyle(
                                                  fontSize: 65,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 1.3),
                                            ),
                                          ],
                                        )
                                      : const Text(
                                          '200',
                                          style: TextStyle(
                                              fontSize: 65,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.07,
                    ),
                    SizedBox(
                      width: screenWidth * 0.93,
                      child: GridView.builder(
                        itemCount: 15,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                        ),
                        itemBuilder: (context, index) {
                          return GridTile(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                AppImages.gridImage(index + 1),
                                Container(
                                  color: index > 7
                                      ? const Color.fromRGBO(156, 42, 140, 0.7)
                                      : const Color.fromARGB(
                                          166, 255, 255, 255),
                                ),
                                Center(
                                  child: index > 7
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/icons/youtube.png',
                                                width: 55.69,
                                                height: 55.19,
                                                color: Colors.white),
                                            const Text(
                                              '300',
                                              style: TextStyle(
                                                  fontSize: 65,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 1.3),
                                            ),
                                          ],
                                        )
                                      : const Text(
                                          '300',
                                          style: TextStyle(
                                              fontSize: 65,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  itemCount: 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GridTile(
                      child: index == 0
                          ? Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset('assets/images/bonus.png',
                                    fit: BoxFit.cover),
                                Container(
                                  color:
                                      const Color.fromARGB(166, 255, 255, 255),
                                ),
                              ],
                            )
                          : Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  'assets/images/1.png',
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  color: const Color.fromRGBO(185, 133, 0, 0.7),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppIcons.giftWhite,
                                    const Text(
                                      '500',
                                      style: TextStyle(
                                          fontSize: 65,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1.3),
                                    ),
                                    const Text(
                                      'BONUS #2',
                                      style: TextStyle(
                                          fontSize: 37,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1.3),
                                    ),
                                  ],
                                )
                              ],
                            ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      BlueDrawer(screenWidth: screenWidth * 0.7, isMultiChallenge: true)
    ]);
  }

  Color _setColor(int index) {
    if (index == 0) {
      return Color.fromRGBO(237, 16, 100, 1);
    } else if (index == 1) {
      return AppColors.greenFont;
    } else if (index == 2) {
      return AppColors.purpleFont;
    } else {
      return AppColors.yellowFont;
    }
  }

  String _setTitle(int index) {
    if (index == 0) {
      return 'Trivia Challenges';
    } else if (index == 1) {
      return 'Photo Challenges';
    } else if (index == 2) {
      return 'Video Challenges';
    } else {
      return 'Bonus Challenges';
    }
  }

  Widget _setIcon(int index) {
    if (index == 0) {
      return SvgPicture.asset(
        'assets/icons/trivia.svg',
        width: 55.69,
        height: 55.19,
        color: Colors.white,
      );
    } else if (index == 1) {
      return Image.asset('assets/icons/camera.png',
          width: 55.69, height: 55.19, color: Colors.white);
    } else if (index == 2) {
      return Image.asset('assets/icons/youtube.png',
          width: 55.69, height: 55.19, color: Colors.white);
    } else {
      return AppIcons.giftWhite;
    }
  }
}
