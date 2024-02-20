import 'package:auto_route/auto_route.dart';
import 'package:premier_pursuit/src/presentation/challenges_grid_view/challenges_grid_view.dart';
import 'package:premier_pursuit/src/presentation/collection_challenge/collection_challenge_view.dart';
import 'package:premier_pursuit/src/presentation/video_challenge_view/video_challenge_view.dart';
import 'package:premier_pursuit/src/presentation/views/admin/admin_events_view.dart';
import 'package:premier_pursuit/src/presentation/views/app_info_view.dart/app_info_view.dart';
import 'package:premier_pursuit/src/presentation/views/app_team_name/app_team_name_view.dart';
import 'package:premier_pursuit/src/presentation/views/bonus_challenge/bonus_challenge_view.dart';
import 'package:premier_pursuit/src/presentation/views/event/event_adventure_view.dart';
import 'package:premier_pursuit/src/presentation/views/hotspot_challenge/hotspot_challenge_view.dart';
import 'package:premier_pursuit/src/presentation/views/photo_challege/photo_challenge_view.dart';
import 'package:premier_pursuit/src/presentation/views/splash/splash_view.dart';

import 'package:premier_pursuit/src/presentation/views/training_view/training_true_false_view.dart';
import 'package:premier_pursuit/src/presentation/views/training_view/training_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/admin-events', page: AdminEventsRoute.page),
        AutoRoute(path: '/event-adventure', page: EventAdventureRoute.page),
        AutoRoute(path: '/app-info', page: AppInfoRoute.page),
        AutoRoute(path: '/app-team-name', page: AppTeamNameRoute.page),
        AutoRoute(path: '/training', page: TrainingRoute.page),
        AutoRoute(path: '/true-false', page: TrainingTrueFalseRoute.page),
        AutoRoute(path: '/photo-challenge', page: PhotoChallengeRoute.page),
        AutoRoute(path: '/video-challenge', page: VideoChallengeRoute.page),
        AutoRoute(path: '/hotspot-challenge', page: HotspotChallengeRoute.page),
        AutoRoute(
            path: '/collection-challenge', page: CollectionChallengeRoute.page),
        AutoRoute(path: '/bonus-challenge', page: BonusChallengeRoute.page),
        AutoRoute(path: '/grid-view-challenge', page: ChallengesGridRoute.page),
      ];
}

final appRouter = AppRouter();
