import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 60.h,
                  ),
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
                            text: "welcome_to_title",
                            textStyle: MetaStyle(
                                fontSize: 22,
                                fontColor: MetaColors.color3F3F3F,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                        SizedBox(height: 20.h),
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
                              Navigator.of(context)
                                  .pushNamed(RouteConstants.loginPath);
                            },
                            text: "login",
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
                            bgColor: MetaColors().primaryColor,
                            textStyle: const MetaStyle(
                                fontColor: MetaColors.whiteColor,
                                fontWeight: FontWeight.w100,
                                fontSize: 20),
                            onTap: () async {
                              Navigator.of(context)
                                  .pushNamed(RouteConstants.signUpPath);
                            },
                            text: "signup",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
