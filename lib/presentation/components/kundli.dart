import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/ext/expanded_ext.dart';
import 'package:adithya_horoscope/domain/model/kundli_model.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KundliWidget extends StatelessWidget {
  List<KundliModel> list;
  KundliWidget({required this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      // padding: EdgeInsets.all(0.5.r),
      child: GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          childAspectRatio: 1.0,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 0.5.r,
          crossAxisSpacing: 0.75.r,
          children: list.map((KundliModel data) {
            return GridTile(
                child: Container(
                    alignment: Alignment.center,
                    color: MetaColors.whiteColor,
                    child:
                        // MetaTextView(
                        //   text: data.data!.join(","),
                        //   textStyle:
                        //   MetaStyle(
                        //       fontSize: 12,
                        //       fontColor: MetaColors().primaryColor,
                        //       fontWeight: FontWeight.w400),
                        // )

                        resetSlots(data)));
          }).toList()),
    );
  }

  resetSlots(KundliModel data) {
    List<String> list = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];

    for (int i = 0; i < data.data!.length; i++) {
      list[i] = data.data![i];
    }

    //TL,TR,BL,BR,CL,CR,CT,CB,C
    return MetaColumnView(
      children: [
        MetaRowView(
            children: [
          getTextView(list[0]),
          getTextView(list[6]),
          getTextView(list[1]),
        ].expandedEqually().toList()),
        MetaRowView(
            children: [
          getTextView(list[4]),
          getTextView(list[8]),
          getTextView(list[5]),
        ].expandedEqually().toList()),
        MetaRowView(
            children: [
          getTextView(list[2]),
          getTextView(list[7]),
          getTextView(list[3]),
        ].expandedEqually().toList()),
      ].expandedEqually().toList(),
    );
  }

  Widget getTextView(text) {
    return MetaTextView(
      text: text,
      textStyle: MetaStyle(
          fontSize: 12,
          fontColor: MetaColors().primaryColor,
          fontWeight: FontWeight.w400),
    );
  }
}
