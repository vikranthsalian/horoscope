import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/config/loader_config.dart';
import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/core/utils/pdf.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/user.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicDetailsScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 8.w);
  HoroscopeModel horoscopeModel;
  User userModel;
  Map controllers;
  BasicDetailsScreen(
      {required this.horoscopeModel,
      required this.userModel,
      required this.controllers});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MetaColumnView(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          getView("name", horoscopeModel.name),
          getView("date_of_birth", horoscopeModel.dob),
          getView("time", horoscopeModel.tob),
          getView("birth_place", horoscopeModel.place),
          getView("time_zone", horoscopeModel.getTimezone),
          getView("latitude", horoscopeModel.getLatitude),
          getView("longitude", horoscopeModel.getLongitude),
          getView("kalidina", horoscopeModel.kalidin),
          getView(
            "sunrise",
            horoscopeModel.getSunrise,
          ),
          getView("sunset", horoscopeModel.getSunset),
          getView(
              "udayadi",
              HoroScopeUtils().getMetaUdayadi(
                  HoroScopeUtils().getMetaTimeOfBirth(horoscopeModel.tob),
                  horoscopeModel.sunriseValue)),
          Expanded(
            child: MetaColumnView(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r)),
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
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r)),
                    child: Container(
                      color: Colors.white,
                      child: MetaColumnView(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MetaRowView(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          RouteConstants.homePath,
                                          (route) => false);
                                    },
                                    child: customButtons(
                                        AssetConstants.nowIcon, "home")),
                                InkWell(
                                    onTap: () {
                                      saveData();
                                    },
                                    child: customButtons(
                                        AssetConstants.proceedIcon, "save")),
                                InkWell(
                                    onTap: () {
                                      //_saveNetworkImage();
                                      MetaPdf()
                                          .write(horoscopeModel, controllers);
                                    },
                                    child: customButtons(
                                        AssetConstants.historyIcon,
                                        "downloas")),
                              ])
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

  getView(title, text) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        margin: EdgeInsets.symmetric(vertical: 7.h),
        child: MetaRowView(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: padding,
                alignment: Alignment.centerLeft,
                child: MetaTextView(
                  text: title,
                  textStyle: MetaStyle(
                      fontSize: 12,
                      fontColor: MetaColors().primaryColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              padding: padding,
              alignment: Alignment.centerLeft,
              child: MetaTextView(
                text: " : ",
                textStyle: MetaStyle(
                    fontSize: 12,
                    fontColor: MetaColors.color3F3F3F,
                    fontWeight: FontWeight.w100),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: padding,
                alignment: Alignment.centerLeft,
                child: MetaTextView(
                  text: text.toString(),
                  textStyle: MetaStyle(
                      fontSize: 12,
                      fontColor: MetaColors.color3F3F3F,
                      fontWeight: FontWeight.w100),
                ),
              ),
            ),
          ],
        ));
  }

  customButtons(String nowIcon, String text) {
    return Container(
      child: MetaColumnView(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            child: MetaSVGView(
                svgName: nowIcon, basePath: MetaFlavourConstants.flavorPath),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            padding: padding,
            alignment: Alignment.centerLeft,
            child: MetaTextView(
              text: text,
              textStyle: const MetaStyle(
                  fontSize: 12,
                  fontColor: MetaColors.color3F3F3F,
                  fontWeight: FontWeight.w100),
            ),
          ),
        ],
      ),
    );
  }

  saveData() async {
    MetaProgressHUD.showLoading(text: "saving");
    UserData userData = globalContext.read<LoginCubit>().getLoginResponse();

    DatabaseReference ref = FirebaseDatabase.instance
        .ref("horoscope_details/${userModel.uniqueID}");

    userModel.userID = userData.id;
    print(userModel.toJson());

    await ref.set(userModel.toJson()).then((_) {
      MetaProgressHUD.dismiss();
      MetaAlert.showSuccessAlert(
          message: "horoscope_details_saved_successfully");
      print("Data saved successfully!");
    }).catchError((error) {
      print(error);
    });
  }
}
