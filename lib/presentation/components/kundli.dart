import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/domain/model/kundli_model.dart';
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
              child: MetaTextView(
                text: data.data!.join(","),
                textStyle: MetaStyle(
                    fontSize: 12,
                    fontColor: MetaColors().primaryColor,
                    fontWeight: FontWeight.w400),
              ),
            ));
          }).toList()),
    );
  }
}
