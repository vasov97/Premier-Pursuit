import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';

class AppIcons {
  static final Image appLogo = Image.asset(
    'assets/icons/Logo.png',
    width: 262,
    height: 262,
  );
  static final SvgPicture close = SvgPicture.asset(
    'assets/icons/Vector.svg',
    width: 37,
    height: 37,
  );
  static final SvgPicture magnifier = SvgPicture.asset(
    'assets/icons/Group 867.svg',
    width: 30,
    height: 30,
  );
  static final Image questionOutlined = Image.asset(
    'assets/icons/Group 802.png',
    width: 35,
    height: 35,
  );
  static final Image backButton = Image.asset(
    'assets/icons/orange_back.png',
    width: 41.4,
    height: 46,
  );
  static final Image backButtonPink = Image.asset(
    'assets/icons/pink_back.png',
    width: 41.4,
    height: 46,
    color: Colors.pink,
  );
  static final SvgPicture calendar = SvgPicture.asset(
    'assets/icons/Group.svg',
    width: 39,
    height: 39,
  );
  static final Image wifi = Image.asset(
    'assets/icons/wifi.png',
    width: 18.47,
    height: 18.47,
  );
  static final Image admin = Image.asset(
    'assets/icons/admin_icon.png',
    height: 60.34,
    width: 60.34,
  );
  static final Image adminWhite = Image.asset(
    'assets/icons/admin_icon.png',
    height: 30.34,
    width: 30.34,
    color: Colors.white,
  );
  static final Image adminOrange = Image.asset(
    'assets/icons/admin_icon.png',
    height: 60.34,
    width: 60.34,
    color: AppColors.orangeOutline,
  );
  static Image camera = Image.asset(
    'assets/icons/camera.png',
    width: 36.69,
    height: 35.19,
  );
  static final Image purpleYt = Image.asset(
    'assets/icons/purple_yt.png',
    width: 100.69,
    height: 100.19,
  );

  static Image purpleCamera = Image.asset(
    'assets/icons/camera.png',
    width: 36.69,
    height: 35.19,
    color: AppColors.purpleFont,
  );
  static final Image greenCamera = Image.asset(
    'assets/icons/green_camera.png',
    width: 100.69,
    height: 100.19,
  );
  static final Image gift = Image.asset(
    'assets/icons/gift.png',
    width: 36.69,
    height: 35.19,
  );
  static final Image giftWhite = Image.asset(
    'assets/icons/gift.png',
    width: 36.69,
    height: 35.19,
    color: Colors.white,
  );
  static final Image fwd = Image.asset(
    'assets/icons/fwd.png',
    width: 48,
    height: 48,
  );
  static final Image search = Image.asset(
    'assets/icons/search.png',
    width: 36.69,
    height: 35.19,
  );
  static final Image youtube = Image.asset(
    'assets/icons/youtube.png',
    width: 36.69,
    height: 35.19,
  );

  static final Image help = Image.asset(
    'assets/icons/help.png',
    // width: 36.69,
    // height: 35.19,
  );

  static final Image adminLogout = Image.asset(
    'assets/icons/Group 849.png',
    height: 65,
    width: 73,
    //color: AppColors.orangeOutline,
  );
  static final SvgPicture loading = SvgPicture.asset(
    'assets/icons/loading.svg',
    width: 37,
    height: 36,
  );
  static final SvgPicture trivia = SvgPicture.asset(
    'assets/icons/trivia.svg',
    width: 36.69,
    height: 35.19,
  );
  static final Image triviaWhite = Image.asset(
    'assets/icons/trivia_white.png',
    width: 36.69,
    height: 35.19,
  );
  static final Image hotspot = Image.asset(
    'assets/icons/hotspot.png',
    width: 30.69,
    height: 30.19,
    fit: BoxFit.contain,
  );
}
