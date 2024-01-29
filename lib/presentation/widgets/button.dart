import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Alignment alignment;
  final MetaStyle textStyle;
  final Color bgColor;
  final String buttonType;
  final double radius;
  final double elevation;
  final BorderSide? borderSide;
  const MetaButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.textStyle,
    this.bgColor = Colors.red,
    this.alignment = Alignment.center,
    this.buttonType = "normal",
    this.radius = 0,
    this.elevation = 0,
    this.borderSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: borderSide,
              elevation: elevation,
              alignment: alignment,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius.r), // <-- Radius
              ),
              minimumSize: Size(double.infinity, 40.h),
              backgroundColor: bgColor),
          onPressed: () {
            onTap();
          },
          child: MetaTextView(text: text, textStyle: textStyle)),
    );
  }
}
