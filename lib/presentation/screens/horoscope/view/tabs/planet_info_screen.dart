import 'dart:ui';

import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/planet_model.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanetInfoScreen extends StatelessWidget {
  List<PlanetModel> list;
  HoroscopeModel model;
  bool isScreen;
  PlanetInfoScreen(
      {required this.list, required this.isScreen, required this.model});
  var padding = EdgeInsets.symmetric(horizontal: 8.w);

  List<String> headers = [
    "planet",
    "longitude",
    "nakshathra",
    "pada",
  ];

  @override
  Widget build(BuildContext context) {
    if (isScreen) {
      return SafeArea(
          child: Scaffold(
              appBar: MetaAppBar(
                  title: "planet_info",
                  action: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          RouteConstants.navamshaKundliPath,
                          arguments: {
                            "isScreen": true,
                            "model": model,
                          });
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      height: 40.w,
                      width: 100.w,
                      child: MetaTextView(
                        text: "navamasha_kundli",
                        textStyle: MetaStyle(
                            fontSize: 9,
                            fontColor: MetaColors().primaryColor,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                  )),
              body: Container(
                margin: EdgeInsets.only(top: 10.h),
                child: getBody(),
              )));
    }
    return getBody();
  }

  getBody() {
    return SingleChildScrollView(
      child:
          MetaColumnView(mainAxisAlignment: MainAxisAlignment.start, children: [
        MetaRowView(
            children: headers.asMap().entries.map((e) {
          return Expanded(
            flex: e.key == 3 ? 1 : 2,
            child: Container(
              child: MetaTextView(
                text: e.value,
                textStyle: MetaStyle(
                    fontSize: 12,
                    fontColor: MetaColors.color3F3F3F,
                    fontWeight: FontWeight.w400),
              ),
            ),
          );
        }).toList()),
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
                  Expanded(
                      flex: 2, child: rowText(list[i].planet!, enabled: true)),
                  Expanded(flex: 2, child: superScriptText(list[i].longitude!)),
                  Expanded(flex: 2, child: rowText(list[i].nakshathra!)),
                  Expanded(flex: 1, child: rowText(list[i].pada!)),
                ]),
              );
            })
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

  Widget superScriptText(String e, {bool enabled = false}) {
    List array = e.split("SS");

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: array[0],
            style: MetaStyle(
                    fontSize: 12,
                    fontColor: MetaColors.color3F3F3F,
                    fontWeight: FontWeight.w100)
                .getStyle(),
            children: <TextSpan>[
              TextSpan(
                text: " ",
                style: MetaStyle(
                        fontSize: 4,
                        fontFeatures: [FontFeature.superscripts()],
                        fontColor: MetaColors.color3F3F3F,
                        fontWeight: FontWeight.w100)
                    .getStyle(),
              ),
              TextSpan(
                text: "ˢ",
                style: MetaStyle(
                        fontSize: 15,
                        fontFeatures: [FontFeature.superscripts()],
                        fontColor: MetaColors.color3F3F3F,
                        fontWeight: FontWeight.w100)
                    .getStyle(),
              ),
              TextSpan(
                text: array[1],
                style: MetaStyle(
                        fontSize: 12,
                        fontColor: MetaColors.color3F3F3F,
                        fontWeight: FontWeight.w100)
                    .getStyle(),
              ),
            ],
          ),
        ),
      ],
    );
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
