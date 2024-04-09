import 'dart:math';

import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/core/ext/timeofday_ext.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/cities_model.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/user.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MetaColors.whiteColor,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child:
                      MetaColumnView(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    MetaRowView(children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteConstants.profilePath);
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          child: MetaSVGView(
                              svgName: AssetConstants.profileIcon,
                              basePath: MetaFlavourConstants.flavorPath),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: MetaColumnView(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: MetaTextView(
                                    text: "AMPWORK",
                                    textStyle: MetaStyle(
                                        fontSize: 16,
                                        fontColor: MetaColors.color3F3F3F,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: MetaTextView(
                                    text: "We AMPlify You",
                                    textStyle: MetaStyle(
                                        fontSize: 10,
                                        fontColor: MetaColors.color3F3F3F,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ]),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      child: MetaSVGView(
                          svgName: AssetConstants.logoSVG,
                          basePath: MetaFlavourConstants.flavorPath),
                    ),
                    SizedBox(
                      height: 20.h,
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
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x54000000),
                        spreadRadius: 4,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r)),
                    child: Container(
                      color: Colors.white,
                      child: MetaColumnView(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: MetaTextView(
                              text: "choose_option_to_continue",
                              textStyle: MetaStyle(
                                  fontSize: 16,
                                  fontColor: MetaColors().primaryColor,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            height: 40.h,
                            padding: padding,
                            child: MetaButton(
                              radius: 12,
                              bgColor: MetaColors().primaryColor,
                              textStyle: const MetaStyle(
                                  fontColor: MetaColors.whiteColor,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 20),
                              onTap: () async {
                                Navigator.of(context)
                                    .pushNamed(RouteConstants.addHoroScopePath);
                              },
                              text: "horoscope",
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            height: 40.h,
                            padding: padding,
                            child: MetaButton(
                              radius: 12,
                              borderSide:
                                  BorderSide(color: MetaColors().primaryColor),
                              bgColor: MetaColors.whiteColor,
                              textStyle: const MetaStyle(
                                  fontColor: MetaColors.blackColor,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 20),
                              onTap: () async {
                                DateTime dateTime = DateTime.now();
                                print("dateTime");

                                String _date =
                                    DateFormat('dd-MM-yyyy').format(dateTime);
                                TimeOfDay timeOfDay = TimeOfDay.now();
                                Map<String, dynamic>? cityData;
                                try {
                                  cityData = MetaHiveConfig()
                                      .getHive(StringConstants.cityData);
                                } catch (e) {}
                                CitiesModel cityModel = CitiesModel();
                                if (cityData == null || cityData.isEmpty) {
                                  cityModel = CitiesModel(
                                      city: "udipi",
                                      latDeg: 13,
                                      latMin: 20,
                                      latDir: "N",
                                      longDeg: 74,
                                      longMin: 45,
                                      longDir: "E",
                                      tZoneHour: 5,
                                      tZoneMin: 30);
                                } else {
                                  cityModel = CitiesModel.fromJson(cityData);
                                }
                                print("cityModel.city");
                                print(cityModel.city);
                                double lat =
                                    HoroScopeUtils().getMetaDegreeToDecimal(
                                  double.parse(cityModel.latDeg.toString()),
                                  double.parse(cityModel.latMin.toString()),
                                  double.parse("00"),
                                );
                                double long =
                                    HoroScopeUtils().getMetaDegreeToDecimal(
                                  double.parse(cityModel.longDeg.toString()),
                                  double.parse(cityModel.longMin.toString()),
                                  double.parse("00"),
                                );
                                double tm = double.parse(
                                        (cityModel.tZoneHour * 60).toString()) +
                                    double.parse(cityModel.tZoneMin.toString());

                                HoroscopeModel model = await HoroScopeUtils()
                                    .calculate(User(
                                        uniqueID: generateRandom(),
                                        name: "",
                                        place: cityModel.city,
                                        latitude: lat,
                                        longitude: long,
                                        timezone: tm / 60,
                                        time: timeOfDay.toStringFormat,
                                        createdData: DateTime.now().toString(),
                                        date: _date));
                                //
                                // print(model.rasiKundliValues);
                                //
                                // Navigator.of(context).pushNamed(
                                //     RouteConstants.rashiKundliPath,
                                //     arguments: {
                                //       "isScreen": true,
                                //       "model": model,
                                //     });

                                Navigator.pushNamed(
                                    context, RouteConstants.prashnaPath,
                                    arguments: {
                                      "user": User(
                                          uniqueID: generateRandom(),
                                          name: "",
                                          place: cityModel.city,
                                          latitude: lat,
                                          longitude: long,
                                          timezone: tm / 60,
                                          time: timeOfDay.toStringFormat,
                                          createdData:
                                              DateTime.now().toString(),
                                          date: _date)
                                    });
                              },
                              text: "prashna",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  generateRandom() {
    Random random = Random();
    String number = '';
    for (int i = 0; i < 10; i++) {
      number = number + random.nextInt(9).toString();
    }
    return number;
  }
}
