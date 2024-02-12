import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_images.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/app_texts/app_texts.dart';
import 'package:premier_pursuit/src/presentation/widgets/challenge_widget.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';

@RoutePage()
class EventAdventureView extends StatefulWidget {
  const EventAdventureView({super.key});

  @override
  State<EventAdventureView> createState() => _EventAdventureViewState();
}

class _EventAdventureViewState extends State<EventAdventureView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(17, 70, 132, 0.3),
        elevation: 0,
      ),
      drawer: Drawer(
        width: screenWidth * 0.6,
        backgroundColor: Colors.white.withOpacity(0.9),
        child: Row(
          children: [
            Column(
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
                            Padding(
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
                                height: 73,
                                width: 73,
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
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: eventAdventureTitle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: companyName,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: cityStateDate,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Container(
                      width: 380,
                      height: 2,
                      color: const Color.fromRGBO(1, 44, 82, 0.11),
                    ),
                  ),
                  welcomeToAdventure,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: variety,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 25,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ChallengeWidget(
                              icon: AppIcons.trivia,
                              text: 'TRIVIA',
                            ),
                            ChallengeWidget(
                              icon: AppIcons.camera,
                              text: 'PHOTO',
                            ),
                            ChallengeWidget(
                              icon: AppIcons.youtube,
                              text: 'VIDEO',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ChallengeWidget(
                              icon: AppIcons.hotspot,
                              text: 'HOT SPOT',
                            ),
                            ChallengeWidget(
                              icon: AppIcons.search,
                              text: 'COLLECT',
                            ),
                            ChallengeWidget(
                              icon: AppIcons.gift,
                              text: 'BONUS',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  followTheRulesText,
                  CustomOutlinedButton(
                    borderColor: AppColors.orangeOutline,
                    backgroundColor: AppColors.orangeBackground,
                    text: 'GET STARTED',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Stack(
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
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.blueFont,
                      Colors
                          .transparent, // Optional: add more colors if desired
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
