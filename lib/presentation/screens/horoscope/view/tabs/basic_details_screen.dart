import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicDetailsScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 8.w);
  HoroscopeModel horoscopeModel;
  BasicDetailsScreen({required this.horoscopeModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child:
          MetaColumnView(mainAxisAlignment: MainAxisAlignment.start, children: [
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
      ]),
    );
  }

  getView(title, text) {
    return Container(
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
}
