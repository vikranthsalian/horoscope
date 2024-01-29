import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaRowView extends StatelessWidget {
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;
  List<Widget> children;
  MetaRowView(
      {
        this.crossAxisAlignment=CrossAxisAlignment.center,
        this.mainAxisAlignment=MainAxisAlignment.center,
        required this.children
      });

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );

  }

}