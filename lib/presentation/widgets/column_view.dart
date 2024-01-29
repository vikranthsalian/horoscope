import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaColumnView extends StatelessWidget {
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;
  MainAxisSize mainAxisSize;
  List<Widget> children;
  MetaColumnView(
      {
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.mainAxisAlignment = MainAxisAlignment.center,
        this.mainAxisSize = MainAxisSize.max,
        required this.children
      });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: children,
    );

  }

}