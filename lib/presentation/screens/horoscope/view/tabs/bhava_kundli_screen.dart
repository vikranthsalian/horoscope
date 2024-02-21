import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BhavaKundliScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 20.w);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child:
          MetaColumnView(mainAxisAlignment: MainAxisAlignment.start, children: [
        getView("name", "Satoro Gojo"),
        getView("date_of_birth", "11/Mar/1995"),
        getView("nakshatra", "Ashlesha"),
        SizedBox(height: 20.h),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(0.5.r),
              child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  childAspectRatio: 1.0,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 0.5.r,
                  crossAxisSpacing: 0.5.r,
                  children: <String>[
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10',
                    '11',
                    '12',
                    '13',
                    '14',
                    '15',
                    '16',
                  ].map((String url) {
                    return GridTile(child: Container(color: Colors.white));
                  }).toList()),
            ),
            Container(
              color: MetaColors.whiteColor,
              width: 150.w,
              height: 150.w,
              child: MetaSVGView(
                  svgName: AssetConstants.logoOnySVG,
                  basePath: MetaFlavourConstants.flavorPath),
            ),
          ],
        )
      ]),
    );
  }

  getView(title, text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 7.h),
        child: MetaRowView(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: padding,
                alignment: Alignment.centerLeft,
                child: MetaTextView(
                  text: title,
                  textStyle: MetaStyle(
                      fontSize: 12,
                      fontColor: MetaColors().primaryColor,
                      fontWeight: FontWeight.w100),
                ),
              ),
            ),
            Container(
              padding: padding,
              alignment: Alignment.centerLeft,
              child: MetaTextView(
                text: " : ",
                textStyle: MetaStyle(
                    fontSize: 12,
                    fontColor: MetaColors.color3F3F3F,
                    fontWeight: FontWeight.w100),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: padding,
                alignment: Alignment.centerLeft,
                child: MetaTextView(
                  text: text,
                  textStyle: MetaStyle(
                      fontSize: 12,
                      fontColor: MetaColors.color3F3F3F,
                      fontWeight: FontWeight.w100),
                ),
              ),
            ),
          ],
        ));
  }
}
