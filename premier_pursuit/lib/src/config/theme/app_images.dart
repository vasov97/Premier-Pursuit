import 'package:flutter/material.dart';

class AppImages {
  static Image backgroundImage = Image.asset('assets/images/background.png');
  static Image helpCircle = Image.asset(
    'assets/images/help.png',
    width: 35,
    height: 35,
  );
  static Image loadingText = Image.asset('assets/images/loading_text.png');

  static Image collectionBackground =
      Image.asset('assets/images/collection.png');

  static Image ruleOne = Image.asset(
    'assets/images/rule_one.png',
    width: 300,
  );

  static Image photoChalenge = Image.asset(
    'assets/images/photo_challenge.png',
  );

  static Image bonusChalenge = Image.asset(
    'assets/images/bonus.png',
  );

  static Image hotspotBackground = Image.asset(
    'assets/images/hotspot_back.png',
  );

  static Image ruleTwo = Image.asset(
    'assets/images/rule_two.png',
    width: 300,
  );

  static Image questionMarks = Image.asset(
    'assets/images/question_marks.png',
  );

  static Image ruleThree = Image.asset(
    'assets/images/rule_three.png',
    width: 250,
    height: 45,
  );

  static Image ruleFour = Image.asset(
    'assets/images/rule_four.png',
    width: 300,
  );

  static Image ruleFive = Image.asset(
    'assets/images/rule_five.png',
    width: 300,
  );

  static Image ruleSix = Image.asset(
    'assets/images/rule_six.png',
    width: 300,
  );

  static Image gridImage(int i) => Image.asset(
        'assets/images/$i.png',
        fit: BoxFit.fill,
      );
}
