import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AshtakavaragaScreen extends StatelessWidget {
  AshtakavaragaScreen({required this.list});

  List<List<int>> list = [];
  List<String> headers = [
    "rasi",
    "rv",
    "ch",
    "kj",
    "bd",
    "gr",
    "sk",
    "sn",
    "sarv"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: MetaColumnView(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MetaRowView(
                  children: headers.asMap().entries.map((e) {
                return Expanded(
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
                      child: MetaRowView(
                        children: list[i]
                            .map((e) => Expanded(
                                  child: Container(
                                    child: rowText(e.toString()),
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  })
            ]),
      ),
    );
  }

  Widget rowText(String e, {bool enabled = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
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
