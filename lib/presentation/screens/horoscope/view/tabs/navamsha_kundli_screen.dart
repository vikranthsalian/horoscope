import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/kundli_model.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/components/kundli.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavamshaKundliScreen extends StatelessWidget {
  HoroscopeModel model;
  bool isScreen;
  NavamshaKundliScreen({required this.isScreen, required this.model});
  var paddingW = EdgeInsets.symmetric(horizontal: 20.w);
  List<KundliModel> listKundli = [
    KundliModel(id: 11, data: []),
    KundliModel(id: 0, data: []),
    KundliModel(id: 1, data: []),
    KundliModel(id: 2, data: []),
    KundliModel(id: 10, data: []),
    KundliModel(id: 99, data: []),
    KundliModel(id: 99, data: []),
    KundliModel(id: 3, data: []),
    KundliModel(id: 9, data: []),
    KundliModel(id: 99, data: []),
    KundliModel(id: 99, data: []),
    KundliModel(id: 4, data: []),
    KundliModel(id: 8, data: []),
    KundliModel(id: 7, data: []),
    KundliModel(id: 6, data: []),
    KundliModel(id: 5, data: []),
  ];

  @override
  Widget build(BuildContext context) {
    print("---------------------South Kundli---------------------------");
    for (var entry
        in HoroScopeUtils().getMetaNavamsaKundliValues(model).asMap().entries) {
      Map<String, dynamic> planetName = entry.value;

      print(planetName);

      String mapperID = planetName.values.first.toString();
      String mapperKey = planetName.keys.first.toString();

      int? index;
      for (var (i, e) in listKundli.indexed) {
        if (e.id.toString() == mapperID) {
          index = i;
        }
      }

      if (index != null) {
        listKundli[index].data!.add(mapperKey);
      }
    }

    if (isScreen) {
      return SafeArea(
          child: Scaffold(
              appBar: MetaAppBar(
                title: "navamsha_kundli",
              ),
              body: Container(
                margin: EdgeInsets.only(top: 10.h),
                child: getBody(),
              )));
    }
    return getBody();
  }

  getBody() {
    return Container(
      padding: paddingW,
      child:
          MetaColumnView(mainAxisAlignment: MainAxisAlignment.start, children: [
        Stack(
          alignment: Alignment.center,
          children: [
            KundliWidget(list: listKundli),
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
                padding: paddingW,
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
              padding: paddingW,
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
                padding: paddingW,
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
