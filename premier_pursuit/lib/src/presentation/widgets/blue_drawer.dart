import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_images.dart';
import 'package:premier_pursuit/src/presentation/widgets/side_drawer.dart';

class BlueDrawer extends StatelessWidget {
  const BlueDrawer({
    super.key,
    required this.screenWidth,
    required this.isMultiChallenge,
  });

  final double screenWidth;
  final bool isMultiChallenge;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Material(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0),
            ),
            elevation: 6,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
              ),
              child: Container(
                color: AppColors.blueFont,
                width: screenWidth * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isMultiChallenge
                        ? const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: SideDrawerIcons(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              width: 66.8,
                              child: AppImages.helpCircle,
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 65,
                        width: 60,
                        child: AppIcons.appLogo,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
