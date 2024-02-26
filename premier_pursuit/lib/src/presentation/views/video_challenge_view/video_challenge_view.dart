import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premier_pursuit/src/config/router/app_router.dart';
import 'dart:io';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:camera/camera.dart';
import 'package:premier_pursuit/src/presentation/widgets/app_texts/app_texts.dart';
import 'package:premier_pursuit/src/presentation/widgets/blue_drawer.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';

File? pickedVideoFile;

@RoutePage()
class VideoChallengeView extends StatefulWidget {
  const VideoChallengeView({super.key});

  @override
  State<VideoChallengeView> createState() => _VideoChallengeViewState();
}

class _VideoChallengeViewState extends State<VideoChallengeView> {
  late CameraController cameraController;

  late Future<void> _initializeControllerFuture;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

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
          backgroundColor: pickedVideoFile == null
              ? AppColors.drawerWhiteBackground
              : AppColors.purpleFont,
          child: Row(
            children: [
              BlueDrawer(screenWidth: screenWidth, isMultiChallenge: true),
              pickedVideoFile == null
                  ? Padding(
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
                                    color: AppColors.purpleFont,
                                  ),
                                  child: IconButton(
                                    padding: const EdgeInsets.only(left: 10),
                                    color: Colors.white,
                                    icon: const Icon(Icons.arrow_back_ios),
                                    onPressed: () => Navigator.pop,
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
                                AppIcons.purpleCamera,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20.0, top: 5),
                                  child: training(AppColors.purpleFont),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Video\nChallenge',
                              style: AppTypography.textStyle(
                                fontSize: 38,
                                color: AppColors.purpleFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 5),
                            child: Text(
                              'Hotel California',
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
                              color: AppColors.purpleFont,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 5.0, top: 5),
                                child: Text(
                                  '\“So I called up the Captain,\nPlease bring me my wine.\n’He said, \‘We haven\'t had that\nspirit here since nineteen sixty nine.\’\" ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0, top: 30),
                                child: Text(
                                  'Shoot a 10-15 second video of your\nteam performing the Eagles hit,',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 17,
                                    height: 1.3,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\“Hotel California.\”',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 17,
                                        height: 1.3,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Be sure to include',
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 17,
                                        height: 1.3,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                ),
                                child: Text(
                                  'some fun choreography!',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 17,
                                    height: 1.3,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 30),
                                child: Text(
                                  'TAP TO TAKE YOUR TEAM VIDEO:',
                                  style: AppTypography.textStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.purpleFont),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  appRouter.push(VideoRoute(
                                      cameraController: cameraController));
                                },
                                icon: AppIcons.purpleYt,
                              ),
                            ],
                          ),
                        ],
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
                                      color: AppColors.purpleFont,
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
                              'Check Out\nYour Video!',
                              style: AppTypography.textStyle(
                                fontSize: 38,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
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
                                  textColor: AppColors.purpleFont,
                                  borderColor: AppColors.lightPurple,
                                  backgroundColor: Colors.white,
                                  text: 'TRY AGAIN!',
                                  onTap: () => appRouter.push(VideoRoute(
                                      cameraController: cameraController)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: CustomOutlinedButton(
                                  textColor: AppColors.purpleFont,
                                  borderColor: AppColors.lightPurple,
                                  backgroundColor: Colors.white,
                                  text: 'SUBMIT VIDEO',
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
              pickedVideoFile == null
                  ? Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/photo_challenge.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.lightPurple,
                    ),
              pickedVideoFile == null
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
                              vertical: 120, horizontal: 75),
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
                                          cameraController.value.aspectRatio ??
                                              0,
                                      child: CameraPreview(cameraController),
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
                            color: AppColors.purpleFont,
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
                              color: pickedVideoFile == null
                                  ? Colors.white
                                  : AppColors.purpleFont,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: pickedVideoFile == null
                                ? Colors.white
                                : AppColors.purpleFont,
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
                              color: pickedVideoFile == null
                                  ? Colors.white
                                  : AppColors.purpleFont,
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
