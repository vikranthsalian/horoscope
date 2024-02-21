import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicDetailsScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 8.w);
  @override
  Widget build(BuildContext context) {
    return MetaColumnView(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getView("name", "Satoro Gojo"),
          getView("date_of_birth", "11/Mar/1995"),
          getView("time", "09:00 AM"),
          getView("birth_place", "Mangalore"),
          getView("time_zone", "+05:30"),
          getView("latitude", "+05:30"),
          getView("longitude", "+05:30"),
          getView("kalidina", "+05:30"),
          getView("sunrise", "+05:30"),
          getView("sunset", "+05:30"),
          getView("udayadi", "+05:30"),
        ]);
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
                      fontWeight: FontWeight.w100),
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
                  text: text,
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
