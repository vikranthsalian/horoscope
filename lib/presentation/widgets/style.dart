import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaStyle {
  final double fontSize;
  final Color fontColor;
  final FontWeight? fontWeight;
  final TextDecoration textDecoration;
  final TextOverflow overflow;
  final String? fontFamily;
  const MetaStyle({
    required this.fontSize,
    required this.fontColor,
    this.fontWeight = FontWeight.w500,
    this.textDecoration = TextDecoration.none,
    this.overflow = TextOverflow.visible,
    this.fontFamily = 'Poppins',
  });

  TextStyle getStyle() {
    return TextStyle(
        fontSize: fontSize.sp,
        color: fontColor,
        overflow: overflow,
        fontWeight: fontWeight,
        decoration: textDecoration,
        fontFamily: fontFamily);
  }
}
