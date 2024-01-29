import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MetaSVGView extends StatelessWidget {
  final String svgName;
  final String type;
  final String basePath;
  final BoxFit? boxFit;
  final Color? activeColor;
  const MetaSVGView(
      {super.key,
      required this.svgName,
      required this.basePath,
      this.boxFit,
      this.activeColor,
      this.type = AssetConstants.imagesPath});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.asset(basePath + type + svgName,
            color: activeColor != null ? activeColor : null,
            width: double.infinity,
            height: double.infinity,
            //theme: activeColor!=null ? SvgTheme(currentColor: activeColor!) : SvgTheme(currentColor: MetaColors.activeColor),
            fit: boxFit ?? BoxFit.contain));
  }
}
