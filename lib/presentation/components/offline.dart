import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class OfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDialog(context: context, builder: (_) => Container());
    });

    return Container(
      color: MetaColors.transparentColor,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
    );
  }
}
