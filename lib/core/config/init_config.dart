import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/config/route_config.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/constants/theme_constants.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class InitConfig extends StatefulWidget {
  @override
  State<InitConfig> createState() => _InitConfigState();
}

class _InitConfigState extends State<InitConfig> {
  static const fetchBackground = "fetchBackground";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
        ],
        child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          return MaterialApp(
            locale: _locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            builder: EasyLoading.init(),
            navigatorKey: appNavigatorKey,
            debugShowCheckedModeBanner: false,
            title: MetaFlavourConstants.appTitle,
            onGenerateRoute: RouteConfig().generateRoute,
            initialRoute: RouteConstants.splashPath,
            themeMode: ThemeMode.system,
            theme: GlobalTheme().globalTheme,
          );
        }));
  }

  Locale? _locale;
  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
}
