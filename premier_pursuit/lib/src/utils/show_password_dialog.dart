import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';
import 'package:premier_pursuit/src/presentation/widgets/login_text_field.dart';

showPasswordDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        return AlertDialog(
            backgroundColor: Color.fromARGB(179, 255, 255, 255),
            contentPadding: const EdgeInsets.only(top: 30),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  15.0), // Customize border radius as needed
            ),
            //title: Center(child: const Text('Your team\'s answer is...')),
            content: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight / 1.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CONGRATS,',
                          style: AppTypography.textStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        Text(
                          'TEAM NAME HERE',
                          style: AppTypography.textStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightBlue,
                          ),
                        ),
                        const Text('!'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'KEEP THE MOMENTUM.',
                          style: AppTypography.textStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'YOU\'VE COMPLETED THIS',
                          style: AppTypography.textStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Text(
                      'HOT SPOT CHALLENGE',
                      style: AppTypography.textStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+1000 POINTS',
                          style: AppTypography.textStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightBlue),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: LoginTextField(
                        text: 'ENTER HOTSPOT PASSWORD',
                        textColor: AppColors.lightBlue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: CustomOutlinedButton(
                        borderColor: AppColors.blueFont,
                        backgroundColor: AppColors.lightBlue,
                        text: 'SUBMIT PASSWORD',
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
