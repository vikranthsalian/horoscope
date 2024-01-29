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

class MetaDialogCommonError extends StatelessWidget {
  final Function? onPress;
  final String label;
  final String buttonLabel;
  final bool showCheck;
  final bool showYesNo;
  final Function? onYes;
  const MetaDialogCommonError(
      {super.key,
      this.onYes,
      this.showCheck = true,
      this.showYesNo = false,
      this.onPress,
      required this.label,
      required this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return MetaDialog(
        child: MetaColumnView(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: MetaTextView(
            text: label,
            textAlign: TextAlign.center,
            textStyle: MetaStyle(
                fontSize: 14,
                fontColor: MetaColors.blackColor,
                fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(height: 10.h),
        if (showCheck)
          Container(
            height: 35.h,
            child: MetaButton(
                radius: 5.r,
                bgColor: MetaColors().primaryColor,
                textStyle: const MetaStyle(
                    fontColor: MetaColors.whiteColor, fontSize: 15),
                onTap: () {
                  if (onPress != null) {
                    onPress!();
                  }
                },
                text: buttonLabel),
          ),
        if (showYesNo) SizedBox(height: 20.h),
        if (showYesNo)
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
                    Navigator.pop(context);
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
