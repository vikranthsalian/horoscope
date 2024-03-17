import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanchangaScreen extends StatelessWidget {
  PanchangaScreen({required this.list});

  List<(String, String)> list = [];
  var padding = EdgeInsets.symmetric(horizontal: 26.w);
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
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: MetaRowView(children: [
                  Expanded(
                      child:
                          Container(child: rowText(list[i].$1, enabled: true))),
                  Expanded(child: Container(child: rowText(list[i].$2))),
                ]),
              );
            }));
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
