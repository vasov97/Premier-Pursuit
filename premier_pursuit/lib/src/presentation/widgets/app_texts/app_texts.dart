import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';

final welcomeToAdventure = Text(
  'Welcome to today' '\'s adventure!',
  style: AppTypography.textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.blueFont,
  ),
);

final variety = Text(
  'A variety of challenges lie ahead of you:',
  style: AppTypography.textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.blueFont,
  ),
);

final admin45 = Text(
  'Admin',
  style: AppTypography.textStyle(
    fontSize: 45,
    fontWeight: FontWeight.w500,
    color: AppColors.blueFont,
  ),
);

final cityStateDate = Text(
  'CITY, STATE • MM/DD/YY',
  style: AppTypography.textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.blueFont,
  ),
);

final companyName = Text(
  'Company Name',
  style: AppTypography.textStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.blueFont,
  ),
);

training(Color color) => Text(
      'TRAINING',
      style: AppTypography.textStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );

final eventAdventureTitle = Text(
  'DeckerDevs Bicycle Team Building',
  style: AppTypography.textStyle(
    fontSize: 35,
    fontWeight: FontWeight.w400,
    color: AppColors.orangeBackground,
  ),
  softWrap: true,
  textAlign: TextAlign.left,
);

final challenge = Text(
  'Challenge',
  style: AppTypography.textStyle(
    fontSize: 35,
    color: AppColors.pinkFont,
    fontWeight: FontWeight.w500,
  ),
);

const followTheRulesText = Padding(
  padding: EdgeInsets.all(10.0),
  child: Text(
    'Follow  the  rules.   Work  together.   Have  fun!',
    style: TextStyle(
      fontStyle: FontStyle.italic,
      color: AppColors.orangeBackground,
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
  ),
);

final wifiRequired = Text(
  'WI-FI REQUIRED ',
  style: AppTypography.textStyle(
    fontSize: 10,
    color: AppColors.blueFont,
    fontWeight: FontWeight.w200,
  ),
);

final eventText = Text(
  'Don\'t see your Event?',
  style: AppTypography.textStyle(
    fontSize: 17,
    color: AppColors.blueFont,
    fontWeight: FontWeight.w300,
  ),
);

final currentEvent = Text(
  'Current Event',
  style: AppTypography.textStyle(
    fontSize: 27,
    fontWeight: FontWeight.w500,
    color: AppColors.blueFont,
  ),
);

final questionsAnswered = Text(
  'QUESTION ANSWERED:',
  style: AppTypography.textStyle(
    fontSize: 15,
    color: AppColors.blueFont,
    fontWeight: FontWeight.w300,
  ),
);

final teamScore = Text(
  'TEAM SCORE:',
  style: AppTypography.textStyle(
    fontSize: 15,
    color: AppColors.blueFont,
    fontWeight: FontWeight.w300,
  ),
);

final loading = Text(
  'LOADING...',
  style: AppTypography.textStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
  ),
);

final signOutMsg = Text(
  'BE SURE TO SIGN OUT ONCE\nADMIN TASKS ARE COMPLETED',
  style: AppTypography.textStyle(
    fontSize: 8,
    fontWeight: FontWeight.w100,
    color: const Color.fromRGBO(255, 255, 255, 1),
  ),
);

final adminSignOut = Text(
  'ADMIN SIGN-OUT',
  style: AppTypography.textStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.orangeBackground),
);

final phoneNumberPlaceholder = Text(
  '(XXX) XXX-XXXX',
  style: AppTypography.textStyle(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: AppColors.blueFont,
  ),
);

final facilitatorName = Text(
  'FACILITATOR NAME',
  style: AppTypography.textStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.blueFont,
  ),
);

final eventFacilitator = Text(
  'Your Event Facilitator',
  style: AppTypography.textStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: AppColors.orangeBackground,
  ),
);

Text information(double font) => Text(
      'Information',
      style: AppTypography.textStyle(
        fontSize: font,
        fontWeight: FontWeight.w500,
        color: AppColors.blueFont,
      ),
    );

final eventRules = Text(
  'Event Rules',
  style: AppTypography.textStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColors.blueFont,
  ),
);

final teamName = Text(
  'Team Name',
  style: AppTypography.textStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.blueFont,
  ),
);

final dockerDevsTeam = Text(
  'DeckerDevs Bicycle\nTeam Building',
  style: AppTypography.textStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AppColors.orangeBackground,
  ),
);

Text buildNumber(String number) => Text(
      '$number.',
      style: AppTypography.textStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.blueFont,
      ),
    );
