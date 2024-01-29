import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/components/dialog/dialog.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaDialogServerError extends StatelessWidget {
  final Function? onPress;
  MetaDialogServerError({this.onPress});

  @override
  Widget build(BuildContext context) {
    return MetaDialog(
      child: MetaColumnView(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: MetaTextView(
              text: "serverConnectionError",
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
              text: "serverConnectionErrorMessage",
              textAlign: TextAlign.center,
              textStyle: MetaStyle(
                  fontSize: 12,
                  fontColor: MetaColors.color848484,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 10.h),
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
              text: "check",
            ),
          )
        ],
      ),
    );
  }
}
