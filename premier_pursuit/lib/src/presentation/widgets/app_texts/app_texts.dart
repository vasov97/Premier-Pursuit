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

final eventAdventureTitle = Text(
  'DeckerDevs Bicycle Team Building',
  style: AppTypography.textStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    color: AppColors.orangeBackground,
  ),
  softWrap: true,
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
