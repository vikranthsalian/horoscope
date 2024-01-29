import 'dart:async';

import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/core/injector/injector.dart';
import 'package:adithya_horoscope/core/service/common_service.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/usecase/auth_usecase.dart';
import 'package:adithya_horoscope/presentation/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

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
        String userId =
            MetaHiveConfig().getHive(StringConstants.userId).toString();
        Map<String, dynamic> mapData = {"userId": userId.toString()};
        UserModel? response =
            await Injector.resolve<AuthUseCase>().getProfile(mapData);
        UserData userData = response.data!;
        globalContext.read<LoginCubit>().setLoginResponse(userData);

        await CommonService().getConfigData({});

        Navigator.of(context).pushReplacementNamed(RouteConstants.navPath);
      } else {
        Navigator.of(context).pushReplacementNamed(RouteConstants.loginPath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {},
        child: Container(
            color: MetaColors.beigeColor,
            child: MetaImageView(
                imageName: AssetConstants.splash3,
                basePath: MetaFlavourConstants.flavorPath)),
      ),
    );
  }
}
