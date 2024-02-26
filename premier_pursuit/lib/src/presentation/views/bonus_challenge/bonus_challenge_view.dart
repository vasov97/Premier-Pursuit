import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premier_pursuit/src/config/router/app_router.dart';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/blue_drawer.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';

File? bonusVideoFile;

@RoutePage()
class BonusChallengeView extends StatefulWidget {
  const BonusChallengeView({super.key});

  @override
  State<BonusChallengeView> createState() => _BonusChallengeViewState();
}

class _BonusChallengeViewState extends State<BonusChallengeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;
  late CameraController cameraController;

  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    cameraController = CameraController(front, ResolutionPreset.max);
    await cameraController.initialize();
    _initializeControllerFuture = cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.blueFont),
    );
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      onDrawerChanged: (isOpened) {
        setState(() {
          _isDrawerOpen = isOpened;
        });
      },
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Drawer(
          elevation: 0,
          width: screenWidth * 0.55,
          backgroundColor: bonusVideoFile == null
              ? AppColors.drawerWhiteBackground
              : AppColors.yellowFont,
          child: Row(
            children: [
              BlueDrawer(screenWidth: screenWidth, isMultiChallenge: false),
              bonusVideoFile == null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.33,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                      color: AppColors.yellowFont,
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.only(left: 10),
                                      color: Colors.white,
                                      icon: const Icon(Icons.arrow_back_ios),
                                      onPressed: () => appRouter.push(
                                        const TriviaTrueFalseRoute(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  AppIcons.gift,
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                'Bonus\nChallenge',
                                style: AppTypography.textStyle(
                                  fontSize: 38,
                                  color: AppColors.yellowFont,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 5),
                              child: Text(
                                'Testimonial',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 6),
                              child: Container(
                                height: 1,
                                width: 140,
                                color: AppColors.yellowFont,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 5.0, top: 5),
                                        child: Text(
                                          'Shoot a video',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 10.0, top: 5),
                                        child: Text(
                                          'up to 15 seconds with',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.0, top: 5),
                                    child: Text(
                                      'your team describing their experience',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.0, top: 5),
                                    child: Text(
                                      'with today\'s event.',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.3,
                                  ),
                                  CustomOutlinedButton(
                                    borderColor: AppColors.yellowBorder,
                                    width: screenWidth * 0.36,
                                    backgroundColor: AppColors.yellowFont,
                                    text: 'SHOOT YOUR TEAM VIDEO',
                                    onTap: () => appRouter.push(
                                      VideoRoute(
                                          cameraController: cameraController),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  :
                  /////////////////////
                  Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.33,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: IconButton(
                                      padding: const EdgeInsets.only(left: 10),
                                      color: AppColors.yellowFont,
                                      icon: const Icon(Icons.arrow_back_ios),
                                      onPressed: () {}),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                AppIcons.giftWhite,
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Check Out',
                              style: AppTypography.textStyle(
                                fontSize: 38,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  'Your Photo!',
                                  style: AppTypography.textStyle(
                                    fontSize: 38,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 5),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor.',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 6),
                            child: Container(
                              height: 1,
                              width: 140,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 5.0, top: 5),
                                child: Text(
                                  'Re-shoot or submit your\n team\'s video below!',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: CustomOutlinedButton(
                                  textColor: AppColors.yellowFont,
                                  borderColor: AppColors.yellowBorder,
                                  backgroundColor: Colors.white,
                                  text: 'TRY AGAIN!',
                                  onTap: () =>
                                      appRouter.push(const AppTeamNameRoute()),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: CustomOutlinedButton(
                                  textColor: AppColors.yellowFont,
                                  borderColor: AppColors.yellowBorder,
                                  backgroundColor: Colors.white,
                                  text: 'SUBMIT PHOTO',
                                  onTap: () =>
                                      appRouter.push(const AppTeamNameRoute()),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              bonusVideoFile == null
                  ? Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bonus.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.lightYellow,
                    ),
              bonusVideoFile == null
                  ? Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColors.blueFont,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 150, horizontal: 75),
                          child: SizedBox(
                            height: screenHeight * 0.55,
                            width: screenWidth * 0.7,
                            child: FutureBuilder(
                                future: _initializeControllerFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      cameraController != null) {
                                    return AspectRatio(
                                      aspectRatio:
                                          cameraController!.value.aspectRatio ??
                                              0,
                                      child: CameraPreview(cameraController!),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, right: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AppIcons.triviaWhite,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'TRAINING',
                                  style: AppTypography.textStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 54,
                          decoration: BoxDecoration(
                            color: AppColors.yellowFont,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'YOUR SCORE:',
                                style: AppTypography.textStyle(
                                    fontSize: 10, fontWeight: FontWeight.w200),
                              ),
                              Text(
                                '2500',
                                style: AppTypography.textStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, right: 15),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: _isDrawerOpen
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'TEAM NAME HERE',
                            style: AppTypography.textStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: bonusVideoFile == null
                                  ? Colors.white
                                  : AppColors.yellowFont,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: bonusVideoFile == null
                                ? Colors.white
                                : AppColors.yellowFont,
                            height: 10,
                            width: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'PROGRAM NAME HERE',
                            style: AppTypography.textStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: bonusVideoFile == null
                                  ? Colors.white
                                  : AppColors.yellowFont,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
