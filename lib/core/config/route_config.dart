import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/print.dart';
import 'package:adithya_horoscope/presentation/components/google_map.dart';
import 'package:adithya_horoscope/presentation/screens/auth/login/login_screen.dart';
import 'package:adithya_horoscope/presentation/screens/auth/signup/signup_screen.dart';
import 'package:adithya_horoscope/presentation/screens/auth/welcome/welcome_screen.dart';
import 'package:adithya_horoscope/presentation/screens/home/home_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/add/add_horoscope_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/saved/saved_horoscope_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/dhasha_bhukthi_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/navamsha_kundli_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/planet_info_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/rashi_kundli_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/view_horoscope_screen.dart';
import 'package:adithya_horoscope/presentation/screens/profile/profile_screen.dart';
import 'package:adithya_horoscope/presentation/screens/setting/settings_screen.dart';
import 'package:adithya_horoscope/presentation/screens/splash/splash_screen.dart';
import 'package:adithya_horoscope/presentation/screens/subcription/premium_plan.dart';
import 'package:adithya_horoscope/presentation/screens/subcription/success.dart';
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

      case RouteConstants.savedHoroScopePath:
        return SavedHoroScopeScreen();

      case RouteConstants.settingsPath:
        return SettingsScreen();

      case RouteConstants.profilePath:
        return ProfileScreen();

      case RouteConstants.premiumPlanPath:
        return PremiumPlanScreen();

      case RouteConstants.successPath:
        return SuccessScreen();

      case RouteConstants.locationPickerPath:
        return MetaLocationPicker();

      case RouteConstants.rashiKundliPath:
        args as Map<String, dynamic>;
        return RashiKundliScreen(
            isScreen: args['isScreen'] ?? false, model: args['model']);

      case RouteConstants.navamshaKundliPath:
        args as Map<String, dynamic>;
        return NavamshaKundliScreen(
            isScreen: args['isScreen'] ?? false, model: args['model']);

      case RouteConstants.planetInfoPath:
        args as Map<String, dynamic>;
        return PlanetInfoScreen(
            model: args['model'],
            isScreen: args['isScreen'] ?? false,
            list: args['list']);

      case RouteConstants.viewHoroScopePath:
        args as Map<String, dynamic>;
        return ViewHoroScopeScreen(data: args);

      case RouteConstants.dashaBhukthiOtherPath:
        args as Map<String, dynamic>;
        return DhashaBhukthiOtherScreen(
            list: args['list'], title: args['title']);

      default:
        return SplashScreen();
    }
  }
}
