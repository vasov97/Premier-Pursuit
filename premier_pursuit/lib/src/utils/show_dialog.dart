import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/router/app_router.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';

showAnswerDialog(BuildContext context, {required isCorrect}) => showDialog(
      context: context,
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        return AlertDialog(
          contentPadding: const EdgeInsets.only(top: 40),
          elevation: 2,
          //title: Center(child: const Text('Your team\'s answer is...')),
          content: isCorrect
              ? SizedBox(
                  width: screenWidth / 3.5,
                  height: screenHeight / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Your team\'s answer is...'),
                      const Text(
                        'CORRECT!',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('CONGRATS,'),
                          Text(
                            'TEAM NAME HERE',
                            style: AppTypography.textStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.pinkFont),
                          ),
                          const Text('!'),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('KEEP THE MOMENTUM.')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+200 POINTS!',
                            style: AppTypography.textStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.pinkFont),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: CustomOutlinedButton(
                          borderColor: AppColors.pinkBackground,
                          backgroundColor: AppColors.pinkFont,
                          text: 'CONTINUE',
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(
                  width: screenWidth / 3.5,
                  height: screenHeight / 2.5,
                  child: Column(
                    children: [
                      const Text('Your team\'s answer is...'),
                      const Text(
                        'INCORRECT',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(214, 23, 23, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('SORRY,'),
                          Text(
                            'TEAM NAME HERE',
                            style: AppTypography.textStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.pinkFont),
                          ),
                          const Text('!'),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('THE CORRECT ANSWER WAS')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'CORRECT ANSWER',
                            style: AppTypography.textStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.pinkFont),
                          ),
                          const Text('.'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: CustomOutlinedButton(
                          borderColor: AppColors.pinkBackground,
                          backgroundColor: AppColors.pinkFont,
                          text: 'CONTINUE',
                          onTap: () {
                            Navigator.of(context).pop();
                            appRouter.push(
                              const TrainingTrueFalseRoute(),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
