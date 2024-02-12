import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premier_pursuit/src/config/router/app_router.dart';
import 'package:premier_pursuit/src/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp.router(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
