import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/ext/expanded_ext.dart';
import 'package:adithya_horoscope/presentation/components/dialog/dialog.dart';
import 'package:adithya_horoscope/presentation/components/non_exp.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaDialogDelete extends StatelessWidget {
  final Function? onYes;
  final Function? onNo;
  final String header;
  final String info;
  MetaDialogDelete(
      {this.onYes, this.onNo, required this.header, required this.info});

  @override
  Widget build(BuildContext context) {
    return MetaDialog(
        child: MetaColumnView(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: MetaTextView(
            text: header,
            textAlign: TextAlign.center,
            textStyle: MetaStyle(
                fontSize: 16,
                fontColor: MetaColors.blackColor,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          child: MetaTextView(
            text: info,
            textAlign: TextAlign.center,
            textStyle: MetaStyle(
                fontSize: 12,
                fontColor: MetaColors.color848484,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          height: 35.h,
          child: MetaRowView(
              children: [
            Container(
              child: MetaButton(
                radius: 5.r,
                bgColor: MetaColors.whiteColor,
                borderSide: BorderSide(color: MetaColors.colord7d7d7),
                textStyle: const MetaStyle(
                    fontColor: MetaColors.color3c3c3c, fontSize: 15),
                onTap: () {
                  if (onNo != null) {
                    onNo!();
                  }
                },
                text: "no",
              ),
            ),
            NonExpWidget(widget: SizedBox(width: 10.w)),
            Container(
              child: MetaButton(
                radius: 5.r,
                bgColor: MetaColors().primaryColor,
                textStyle: const MetaStyle(
                    fontColor: MetaColors.whiteColor, fontSize: 15),
                onTap: () {
                  if (onYes != null) {
                    onYes!();
                  }
                },
                text: "yes",
              ),
            )
          ].expandedEqually().toList()),
        )
      ],
    ));
  }
}
