import 'package:flutter/material.dart';
import 'package:premier_pursuit/src/config/router/app_router.dart';
import 'package:premier_pursuit/src/config/theme/app_icons.dart';
import 'package:premier_pursuit/src/config/theme/app_images.dart';

class SideDrawerIcons extends StatelessWidget {
  const SideDrawerIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => appRouter.push(const ChallengesGridRoute()),
            child: Container(
              height: 65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              width: 60,
              child: AppImages.helpCircle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(11),
            height: 65,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            width: 60,
            child: AppIcons.trivia,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => appRouter.push(const PhotoChallengeRoute()),
            child: Container(
              height: 65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              width: 60,
              child: AppIcons.camera,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => appRouter.push(const VideoChallengeRoute()),
            child: Container(
              height: 65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              width: 60,
              child: AppIcons.youtube,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => appRouter.push(const HotspotChallengeRoute()),
            child: Container(
              height: 65,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              width: 60,
              child: AppIcons.hotspot,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => appRouter.push(const CollectionChallengeRoute()),
            child: Container(
              height: 65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              width: 60,
              child: AppIcons.search,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => appRouter.push(const BonusChallengeRoute()),
            child: Container(
              height: 65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              width: 60,
              child: AppIcons.gift,
            ),
          ),
        ),
      ],
    );
  }
}
