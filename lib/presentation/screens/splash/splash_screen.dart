import 'dart:async';

import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      if (MetaHiveConfig().getHive(StringConstants.keepLoggedIn) ?? false) {
        print(MetaHiveConfig().getHive(StringConstants.userData));

        Map<String, dynamic> data = Map<String, dynamic>.from(
            MetaHiveConfig().getHive(StringConstants.userData));
        UserData userData = UserData.fromJson(data);
        globalContext.read<LoginCubit>().setLoginResponse(userData);
        Navigator.of(globalContext)
            .pushReplacementNamed(RouteConstants.homePath);
      } else {
        Navigator.of(globalContext)
            .pushReplacementNamed(RouteConstants.welcomePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: MetaColors.beigeColor,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: MetaColumnView(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  child: MetaSVGView(
                      svgName: AssetConstants.logoSVG,
                      basePath: MetaFlavourConstants.flavorPath),
                ),
                Container(
                  alignment: Alignment.center,
                  child: MetaTextView(
                    text: "Aditya",
                    textStyle: MetaStyle(
                        fontSize: 28,
                        fontColor: MetaColors().primaryColor,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: MetaTextView(
                    text: "AMPWORK",
                    textStyle: MetaStyle(
                        fontSize: 16,
                        fontColor: MetaColors.color3F3F3F,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: MetaTextView(
                    text: "We AMPlify You",
                    textStyle: MetaStyle(
                        fontSize: 10,
                        fontColor: MetaColors.color3F3F3F,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              ],
            )));
  }
}
