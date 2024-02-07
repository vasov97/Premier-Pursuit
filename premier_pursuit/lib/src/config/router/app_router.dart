import 'package:auto_route/auto_route.dart';
import 'package:premier_pursuit/src/presentation/views/splash/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
      ];
}

final appRouter = AppRouter();
