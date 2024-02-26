import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/app_texts/app_texts.dart';
import 'package:premier_pursuit/src/presentation/widgets/blue_drawer.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';
import 'package:premier_pursuit/src/utils/show_dialog.dart';

@RoutePage()
class TriviaFillBlankView extends StatefulWidget {
  const TriviaFillBlankView({super.key});

  @override
  State<TriviaFillBlankView> createState() => _TriviaFillBlankViewState();
}

class _TriviaFillBlankViewState extends State<TriviaFillBlankView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  int _selectedOptionIndex = -1; // Initially no option is selected

  List<String> options = [
    'ANSWER 1 GOES RIGHT HERE',
    'ANSWER 2 GOES RIGHT HERE',
    'ANSWER 3 GOES RIGHT HERE',
    'ANSWER 4 GOES RIGHT HERE',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.blueFont),
    );
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
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
                                color: AppColors.pinkFont,
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            AppIcons.trivia,
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 5),
                                child: training(AppColors.pinkFont)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Trivia',
                          style: AppTypography.textStyle(
                            fontSize: 38,
                            color: AppColors.pinkFont,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 5),
                        child: Text(
                          'Choose the correct answer',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 5),
                        child: Row(
                          children: [
                            Text(
                              'below to',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              ' FILL IN THE BLANK:',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Container(
                          height: 2,
                          width: 140,
                          color: AppColors.pinkFont,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Question text goes right here',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.pinkFont,
                                    decorationColor: AppColors.pinkFont,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'for the',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 21,
                                        color: AppColors.pinkFont,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 11.0, left: 4, right: 4),
                                      child: Container(
                                        height: 2,
                                        width: 140,
                                        color: AppColors.pinkFont,
                                      ),
                                    ),
                                    const Text(
                                      'here.',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 21,
                                        color: AppColors.pinkFont,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 4,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: options
                              .asMap()
                              .entries
                              .map(
                                (question) => buildOption(
                                    question.key, question.value, screenWidth),
                              )
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomOutlinedButton(
                              width: screenWidth / 3,
                              borderColor: AppColors.pinkBackground,
                              backgroundColor: AppColors.pinkFont,
                              text: 'SUBMIT ANSWER',
                              onTap: () {
                                Navigator.of(context).pop();
                                _selectedOptionIndex == 2
                                    ? showAnswerDialog(context, isCorrect: true)
                                    : showAnswerDialog(context,
                                        isCorrect: false);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                    image: AssetImage('assets/images/question_marks.png'),
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
                            color: AppColors.pinkBackground,
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
                      //crossAxisAlignment: CrossAxisAlignment.end,
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

  Widget buildOption(
    int index,
    String option,
    double screenWidth,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOptionIndex = index;
        });
      },
      child: Row(
        children: [
          Container(
            width: screenWidth / 3.9,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: _selectedOptionIndex == index
                  ? const Color.fromARGB(156, 237, 16, 101)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 2,
                color: _selectedOptionIndex == index
                    ? AppColors.pinkBackground
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Text(
                  '${index + 1}. ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.015),
                ),
                Text(
                  option,
                  style: TextStyle(
                    fontSize: screenWidth * 0.013,
                    fontWeight: _selectedOptionIndex == index
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
