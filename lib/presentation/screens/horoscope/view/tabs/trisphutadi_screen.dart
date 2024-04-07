import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrisphutadiScreen extends StatelessWidget {
  TrisphutadiScreen({required this.list});

  List<(String, String)> list = [];
  var padding = EdgeInsets.symmetric(horizontal: 40.w);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
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
                  Container(child: superScriptText(list[i].$2)),
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
            children: [
              TextSpan(
                text: " ",
                style: MetaStyle(
                        fontSize: 4,
                        fontColor: MetaColors.color3F3F3F,
                        fontWeight: FontWeight.w100)
                    .getStyle(),
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.top,
                  child: Container(
                    child: MetaTextView(
                      text: 's',
                      textStyle: MetaStyle(
                          fontSize: 8,
                          fontColor: enabled
                              ? MetaColors().primaryColor
                              : MetaColors.color3F3F3F,
                          fontWeight: FontWeight.w100),
                    ),
                  )),
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
        textAlign: TextAlign.start,
        textStyle: MetaStyle(
            fontSize: 12,
            fontColor:
                enabled ? MetaColors().primaryColor : MetaColors.color3F3F3F,
            fontWeight: FontWeight.w100),
      ),
    );
  }
}
