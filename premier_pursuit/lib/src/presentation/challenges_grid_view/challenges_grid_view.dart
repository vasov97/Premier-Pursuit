import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_images.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.blueFont,
          title: Row(
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
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
              SizedBox(width: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
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
              SizedBox(width: 16.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      30.0), // Adjust border radius as needed
                  color: Colors.white, // Set white background color
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: _setColor(_currentIndex),
                  ),
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
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
              GridView.builder(
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Stack(
                      children: [
                        AppImages.gridImage(index + 1),
                        Container(
                          color: const Color.fromARGB(166, 255, 255, 255),
                        ),
                        const Center(
                          child: Text(
                            '100',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              GridView.builder(
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemBuilder: (context, index) {
                  return GridTile(child: AppImages.gridImage(index + 1));
                },
              ),
              GridView.builder(
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemBuilder: (context, index) {
                  return GridTile(child: AppImages.gridImage(index + 1));
                },
              ),
              GridView.builder(
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemBuilder: (context, index) {
                  return GridTile(child: AppImages.gridImage(index + 1));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _setColor(int index) {
    if (index == 0) {
      return AppColors.redFont;
    } else if (index == 1) {
      return AppColors.blueFont;
    } else if (index == 2) {
      return AppColors.greenFont;
    } else {
      return AppColors.yellowFont;
    }
  }
}
