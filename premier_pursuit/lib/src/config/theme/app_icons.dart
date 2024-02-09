import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';

class AppIcons {
  static final SvgPicture appLogo = SvgPicture.asset(
    'assets/icons/Logo.svg',
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
  static final SvgPicture questionOutlined = SvgPicture.asset(
    'assets/icons/Group 802.svg',
    width: 35,
    height: 35,
  );
  static final SvgPicture backButton = SvgPicture.asset(
    'assets/icons/Group 835.svg',
    width: 41.4,
    height: 46,
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
  static final Image adminOrange = Image.asset(
    'assets/icons/admin_icon.png',
    height: 60.34,
    width: 60.34,
    color: AppColors.orangeOutline,
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
}
