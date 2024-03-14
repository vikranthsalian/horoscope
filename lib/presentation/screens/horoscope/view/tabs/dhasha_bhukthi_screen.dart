import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DhashaBhukthiScreen extends StatelessWidget {
  DhashaBhukthiScreen({required this.list});

  List<(String, String)> list = [];
  var padding = EdgeInsets.symmetric(horizontal: 8.w);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (ctx, i) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: MetaRowView(children: [
            Expanded(
                child: Container(child: rowText(list[i].$1, enabled: true))),
            Expanded(child: Container(child: rowText(list[i].$2))),
          ]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: MetaColors.color848484.withOpacity(0.2));
      },
    ));
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
