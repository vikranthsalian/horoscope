import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/ext/expanded_ext.dart';
import 'package:adithya_horoscope/domain/model/planet_model.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanetInfoScreen extends StatelessWidget {
  List<PlanetModel> list;
  PlanetInfoScreen({required this.list});
  var padding = EdgeInsets.symmetric(horizontal: 8.w);

  List<String> headers = [
    "planet",
    "longitude",
    "nakshathra",
    "pada",
  ];

  @override
  Widget build(BuildContext context) {
    return MetaColumnView(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MetaRowView(
              children: headers
                  .map((e) {
                    return Container(
                      child: MetaTextView(
                        text: e,
                        textStyle: MetaStyle(
                            fontSize: 12,
                            fontColor: MetaColors.color3F3F3F,
                            fontWeight: FontWeight.w400),
                      ),
                    );
                  })
                  .expandedEqually()
                  .toList()),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (ctx, i) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: MetaRowView(children: [
                    Expanded(child: rowText(list[i].planet!, enabled: true)),
                    Expanded(child: rowText(list[i].longitude!)),
                    Expanded(child: rowText(list[i].nakshathra!)),
                    Expanded(child: rowText(list[i].pada!)),
                  ]),
                );
              })
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

  rowText(String e, {bool enabled = false}) {
    return Container(
      child: MetaTextView(
        text: e,
        textStyle: MetaStyle(
            fontSize: 12,
            fontColor:
                enabled ? MetaColors().primaryColor : MetaColors.color3F3F3F,
            fontWeight: FontWeight.w100),
      ),
    );
  }
}
