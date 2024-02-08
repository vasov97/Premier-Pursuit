import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_images.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';

@RoutePage()
class AdminEventsView extends StatefulWidget {
  const AdminEventsView({super.key});

  @override
  State<AdminEventsView> createState() => _AdminEventsViewState();
}

class _AdminEventsViewState extends State<AdminEventsView> {
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: isDrawerOpen ? const Icon(Icons.close) : const Icon(Icons.menu),
        //   onPressed: () {
        //     setState(() {
        //       isDrawerOpen = !isDrawerOpen;
        //     });
        //   },
        // ),
      ),
      drawer: Drawer(
        width: screenWidth * 0.6,
        backgroundColor: Colors.white.withOpacity(0.9),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Add your logic here
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Add your logic here
              },
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: AppIcons.magnifier,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Don\'t see your Event?',
                    style: AppTypography.textStyle(
                        fontSize: 17,
                        color: AppColors.blueFont,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 40),
                  child: Row(
                    children: [
                      AppIcons.wifi,
                      Text(
                        'WI-FI REQUIRED ',
                        style: AppTypography.textStyle(
                            fontSize: 10,
                            color: AppColors.blueFont,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomOutlinedButton(
                borderColor: AppColors.orangeOutline,
                backgroundColor: Colors.white,
                text: 'REFRESH EVENTS',
                textColor: AppColors.orangeOutline,
                onTap: () {})
            // Add more ListTile items as needed
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/background.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
