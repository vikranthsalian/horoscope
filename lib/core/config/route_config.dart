import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/print.dart';
import 'package:adithya_horoscope/presentation/screens/auth/login/login_screen.dart';
import 'package:adithya_horoscope/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class RouteConfig {
  bool showOverlay = false;

  Route generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        builder: (_) => OfflineBuilder(
              connectivityBuilder: (BuildContext context,
                  ConnectivityResult connectivityResult, Widget child) {
                final bool connected =
                    connectivityResult != ConnectivityResult.none;
                if (!connected) {
                  return getScreen(routeSettings, false);
                }
                return getScreen(routeSettings, true);
              },
              child: const SizedBox.shrink(),
            ),
        settings: routeSettings);
  }

  Widget getScreen(RouteSettings routeSettings, bool status) {
    MetaPrint.printWrapped("ROUTE : ===========>${routeSettings.name}");

    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteConstants.splashPath:
        return SplashScreen();

      case RouteConstants.loginPath:
        return LoginScreen();

      default:
        return SplashScreen();
    }
  }
}
