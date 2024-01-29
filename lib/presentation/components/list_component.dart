import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaOutOfStockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      color: MetaColors.errorColor,
      child: MetaTextView(
        text: "Out of Stock".toUpperCase(),
        textStyle: MetaStyle(
            fontSize: 9,
            fontColor: MetaColors.whiteColor,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
