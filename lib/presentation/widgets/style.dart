import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaStyle {
  final double fontSize;
  final Color fontColor;
  final FontWeight? fontWeight;
  final TextDecoration textDecoration;
  final TextOverflow overflow;
  final String? fontFamily;
  final List<FontFeature>? fontFeatures;
  const MetaStyle({
    required this.fontSize,
    required this.fontColor,
    this.fontWeight = FontWeight.w100,
    this.textDecoration = TextDecoration.none,
    this.overflow = TextOverflow.visible,
    this.fontFamily = 'Poppins',
    this.fontFeatures = const [],
  });

  TextStyle getStyle() {
    return TextStyle(
        fontSize: fontSize.sp,
        color: fontColor,
        overflow: overflow,
        fontFeatures: fontFeatures,
        fontWeight: fontWeight,
        decoration: textDecoration,
        fontFamily: fontFamily);
  }
}
