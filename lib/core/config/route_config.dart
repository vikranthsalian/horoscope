import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/print.dart';
import 'package:adithya_horoscope/presentation/screens/auth/login/login_screen.dart';
import 'package:adithya_horoscope/presentation/screens/auth/signup/signup_screen.dart';
import 'package:adithya_horoscope/presentation/screens/auth/welcome/welcome_screen.dart';
import 'package:adithya_horoscope/presentation/screens/home/home_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/add_horoscope_screen.dart';
import 'package:adithya_horoscope/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteConfig {
  bool showOverlay = false;

  Route generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        builder: (_) => getScreen(routeSettings, true),
        settings: routeSettings);
  }

  Widget getScreen(RouteSettings routeSettings, bool status) {
    MetaPrint.printWrapped("ROUTE : ===========>${routeSettings.name}");

    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteConstants.splashPath:
        return SplashScreen();

      case RouteConstants.welcomePath:
        return WelcomeScreen();

      case RouteConstants.loginPath:
        return LoginScreen();

      case RouteConstants.signUpPath:
        return SignUpScreen();

      case RouteConstants.homePath:
        return HomeScreen();

      case RouteConstants.addHoroScopePath:
        return AddHoroScopeScreen();

      default:
        return SplashScreen();
    }
  }
}
