import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaIcon extends StatelessWidget {
  Function()? onIconPressed;
  double size;
  Color color;
  IconData icon;

  MetaIcon({
    super.key,
    this.onIconPressed,
    required this.icon,
    this.color = MetaColors.whiteColor,
    this.size = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onIconPressed!();
      },
      child: Icon(icon, color: color, size: size.r),
    );
  }
}
