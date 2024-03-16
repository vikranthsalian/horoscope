import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/config/init_config.dart';
import 'package:adithya_horoscope/core/config/json_config.dart';
import 'package:adithya_horoscope/core/config/localization_config.dart';
import 'package:adithya_horoscope/core/dio/dio_client.dart';
import 'package:adithya_horoscope/core/injector/injector_config.dart';
import 'package:adithya_horoscope/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await MetaLocalizationConfig().ensureInitialized();
  await configureFlavour();

  runApp(MetaLocalizationConfig()
      .addLocalization(MyApp(), assetPath: 'assets/translations'));
}

configureFlavour() async {
  InjectorConfig.setup();
  await MetaHiveConfig().initConfig();

  await MetaJsonConfig().initFlavor(jsonPath: "assets/master-flavor.json");
  // 13.3318078,74.7264917
  MetaDio().setDio();
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.setLocale(MetaLocalizationConfig().english);

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return InitConfig();
      },
    );
  }
}
