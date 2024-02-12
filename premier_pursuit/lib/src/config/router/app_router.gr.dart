// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AdminEventsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminEventsView(),
      );
    },
    EventAdventureRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EventAdventureView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
}

/// generated route for
/// [AdminEventsView]
class AdminEventsRoute extends PageRouteInfo<void> {
  const AdminEventsRoute({List<PageRouteInfo>? children})
      : super(
          AdminEventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminEventsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EventAdventureView]
class EventAdventureRoute extends PageRouteInfo<void> {
  const EventAdventureRoute({List<PageRouteInfo>? children})
      : super(
          EventAdventureRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventAdventureRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
