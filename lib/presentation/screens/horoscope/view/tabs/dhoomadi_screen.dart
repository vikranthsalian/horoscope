import 'dart:ui';

import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DhoomadiScreen extends StatelessWidget {
  DhoomadiScreen({required this.list});

  List<(String, String)> list = [];
  var padding = EdgeInsets.symmetric(horizontal: 8.w);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (ctx, i) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: MetaRowView(children: [
                  Expanded(
                      child:
                          Container(child: rowText(list[i].$1, enabled: true))),
                  Expanded(
                      child: Container(child: superScriptText(list[i].$2))),
                ]),
              );
            }));
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

  Widget rowText(String e, {bool enabled = false}) {
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
