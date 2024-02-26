import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:premier_pursuit/src/config/router/app_router.dart';
import 'dart:io';
import 'package:premier_pursuit/src/config/theme/app_colors.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_typography.dart';
import 'package:premier_pursuit/src/presentation/widgets/app_texts/app_texts.dart';
import 'package:premier_pursuit/src/presentation/widgets/blue_drawer.dart';
import 'package:premier_pursuit/src/presentation/widgets/custom_outlined_button.dart';

@RoutePage()
class PhotoChallengeView extends StatefulWidget {
  const PhotoChallengeView({super.key});

  @override
  State<PhotoChallengeView> createState() => _PhotoChallengeViewState();
}

class _PhotoChallengeViewState extends State<PhotoChallengeView> {
  File? _pickedImageFile;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

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
          backgroundColor: _pickedImageFile == null
              ? AppColors.drawerWhiteBackground
              : AppColors.greenFont,
          child: Row(
            children: [
              BlueDrawer(screenWidth: screenWidth, isMultiChallenge: false),
              _pickedImageFile == null
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
                                    color: AppColors.greenFont,
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
                                AppIcons.camera,
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 5),
                                    child: training(AppColors.greenFont)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Photo\nChallenge',
                              style: AppTypography.textStyle(
                                fontSize: 38,
                                color: AppColors.greenFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 5),
                            child: Text(
                              '\"Mommy\'s Time Out\"',
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
                              color: AppColors.greenFont,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 5.0, top: 5),
                                child: Text(
                                  '\"Mommy\'s Time Out\"',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0, top: 5),
                                child: Text(
                                  'is a brand of wine 🍷',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0, top: 30),
                                child: Text(
                                  'Capture a photo of your team\ntaking time out from today\'s\nchallenges and enjoying a glass!',
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
                                  'TAP TO TAKE YOUR TEAM PHOTO:',
                                  style: AppTypography.textStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.greenFont),
                                ),
                              ),
                              IconButton(
                                onPressed: () => _pickImage(),
                                icon: AppIcons.greenCamera,
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
                                      color: AppColors.greenFont,
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
                                AppIcons.camera,
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 5),
                                    child: training(Colors.white)),
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
                                IconButton(
                                  icon: AppIcons.fwd,
                                  onPressed: () {},
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
                              Padding(
                                padding: EdgeInsets.only(left: 5.0, top: 5),
                                child: Text(
                                  'Re-shoot or submit your\n team\'s photo below!',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: CustomOutlinedButton(
                                  textColor: AppColors.greenFont,
                                  borderColor: AppColors.greenFont,
                                  backgroundColor: Colors.white,
                                  text: 'TRY AGAIN!',
                                  onTap: () =>
                                      appRouter.push(const AppTeamNameRoute()),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: CustomOutlinedButton(
                                  textColor: AppColors.greenFont,
                                  borderColor: AppColors.greenFont,
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
              _pickedImageFile == null
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
                      color: AppColors.lightGreen,
                    ),
              _pickedImageFile == null
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
                          child: Container(
                            height: screenHeight * 0.55,
                            width: screenWidth * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: FileImage(_pickedImageFile!),
                                fit: BoxFit.cover,
                              ),
                            ),
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
                            color: AppColors.greenFont,
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
                              color: _pickedImageFile == null
                                  ? Colors.white
                                  : AppColors.greenFont,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: _pickedImageFile == null
                                ? Colors.white
                                : AppColors.greenFont,
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
                              color: _pickedImageFile == null
                                  ? Colors.white
                                  : AppColors.greenFont,
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

  Future _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      _pickedImageFile = File(image.path);
    });
  }
}
