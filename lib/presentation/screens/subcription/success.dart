import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFE58719),
                    Color(0xFF904E00),
                  ]),
            ),
          ),
          Scaffold(
              bottomNavigationBar: Container(
                height: 40.h,
                margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                child: Container(
                  child: MetaButton(
                    radius: 12,
                    bgColor: MetaColors.whiteColor,
                    textStyle: MetaStyle(
                        fontColor: MetaColors().primaryColor,
                        fontWeight: FontWeight.w100,
                        fontSize: 16),
                    onTap: () async {
                      Navigator.of(context).pushNamed(RouteConstants.homePath);
                    },
                    text: "continue",
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 70.h),
                    Container(
                      height: MediaQuery.sizeOf(context).width * 0.4,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      child: MetaSVGView(
                          svgName: AssetConstants.success,
                          //  activeColor: MetaColors.whiteColor,
                          basePath: MetaFlavourConstants.flavorPath),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: MetaTextView(
                        text: "payment_done",
                        textStyle: MetaStyle(
                            fontSize: 20,
                            fontColor: MetaColors.whiteColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: MetaTextView(
                        text: "congratulations",
                        textStyle: MetaStyle(
                            fontSize: 18,
                            fontColor: MetaColors.whiteColor,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: MetaTextView(
                        text: "premium_membership_activated",
                        textStyle: MetaStyle(
                            fontSize: 14,
                            fontColor: MetaColors.whiteColor,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: MetaTextView(
                        text: "locked_features_are_available_now",
                        textStyle: MetaStyle(
                            fontSize: 14,
                            fontColor: MetaColors.whiteColor,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        childAspectRatio: 8 / 2,
                        children:
                            MetaFlavourConstants.premiumPlansList.map((e) {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 7.h),
                            //  margin: EdgeInsets.symmetric(horizontal: 7.h),
                            child: Container(
                              child: MetaRowView(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 15.w,
                                    height: 15.w,
                                    child: MetaSVGView(
                                        activeColor: MetaColors.whiteColor,
                                        svgName: AssetConstants.premiumIcon,
                                        basePath:
                                            MetaFlavourConstants.flavorPath),
                                  ),
                                  SizedBox(width: 10.w),
                                  MetaTextView(
                                    text: e,
                                    textAlign: TextAlign.start,
                                    textStyle: MetaStyle(
                                        fontSize: 14,
                                        fontColor: MetaColors.whiteColor,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
