import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/config/init_config.dart';
import 'package:adithya_horoscope/core/config/json_config.dart';
import 'package:adithya_horoscope/core/config/localization_config.dart';
import 'package:adithya_horoscope/core/dio/dio_client.dart';
import 'package:adithya_horoscope/core/injector/injector_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MetaLocalizationConfig().ensureInitialized();
  await configureFlavour();

  runApp(MetaLocalizationConfig()
      .addLocalization(MyApp(), assetPath: 'assets/translations'));
}

bool isNfcAvalible = false;
configureFlavour() async {
  InjectorConfig.setup();
  await MetaHiveConfig().initConfig();

  await MetaJsonConfig().initFlavor(jsonPath: "assets/master-flavor.json");

  MetaDio().setDio();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.setLocale(MetaLocalizationConfig().korean);

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return InitConfig();
      },
    );
  }
}
