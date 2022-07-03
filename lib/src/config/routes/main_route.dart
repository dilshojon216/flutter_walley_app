import 'package:flutter/material.dart';
import 'package:flutter_walley_app/src/presentation/pages/main_page/main_page.dart';

import '../../presentation/pages/home_page/home_page.dart';
import '../../presentation/pages/splash_page/splash_page.dart';

abstract class MainNavigationRouteNames {
  static const mainScreen = "/mainScreen";
  static const splashScreen = '/splash';
  static const homeScreen = '/home';
}

class MainNavigationRoute {
  MainNavigationRoute._();
  static final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.splashScreen: (context) => const SplashPage(),
    MainNavigationRouteNames.homeScreen: (context) => HomePage(),
    MainNavigationRouteNames.mainScreen: (context) => MainPage(),
  };
}
