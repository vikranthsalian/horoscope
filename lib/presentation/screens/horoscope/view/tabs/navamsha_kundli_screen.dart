import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/data/cubits/kundliType/kundli_type_cubit.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/kundli_model.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/components/kundli.dart';
import 'package:adithya_horoscope/presentation/components/north_kundli.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/rashi_kundli_screen.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

class NavamshaKundliScreen extends StatelessWidget {
  HoroscopeModel model;
  bool isScreen;
  ScreenshotController? screenshotController;
  NavamshaKundliScreen(
      {required this.isScreen, required this.model, this.screenshotController});
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
  int kundliType = 0;

  NorthKundliModel kundli = NorthKundliModel(
      id1: (0, []),
      id2: (0, []),
      id3: (0, []),
      id4: (0, []),
      id5: (0, []),
      id6: (0, []),
      id7: (0, []),
      id8: (0, []),
      id9: (0, []),
      id10: (0, []),
      id11: (0, []),
      id0: (0, []));
  Map<String, List<NorthDataClass>>? catGroup;
  @override
  Widget build(BuildContext context) {
    kundliType = context.read<KundliTypeCubit>().getKundliType();
    print("---------------------South Kundli---------------------------");
    catGroup = grouper(HoroScopeUtils().getMetaNavamsaKundliValues(model));
    for (var entry
        in HoroScopeUtils().getMetaNavamsaKundliValues(model).asMap().entries) {
      Map<String, dynamic> planetName = entry.value;

      String mapperID = planetName.values.first.toString();
      String mapperKey = planetName.keys.first.toString();
      print(planetName);
      if (mapperKey == "Lg") {
        int maperID = planetName.values.first;
        kundli.id0 = ((maperID + 1), [mapperKey]);
        kundli.id1 = (getSlotMapper((maperID + 2) % 12), []);
        kundli.id2 = (getSlotMapper((maperID + 3) % 12), []);
        kundli.id3 = (getSlotMapper((maperID + 4) % 12), []);
        kundli.id4 = (getSlotMapper((maperID + 5) % 12), []);
        kundli.id5 = (getSlotMapper((maperID + 6) % 12), []);
        kundli.id6 = (getSlotMapper((maperID + 7) % 12), []);
        kundli.id7 = (getSlotMapper((maperID + 8) % 12), []);
        kundli.id8 = (getSlotMapper((maperID + 9) % 12), []);

        kundli.id9 = (getSlotMapper((maperID + 10) % 12), []);
        kundli.id10 = (getSlotMapper((maperID + 11) % 12), []);
        kundli.id11 = (getSlotMapper((maperID + 12) % 12), []);
      } else {
        //  northMapper(planetName);
      }

      if (mapperKey == "Lg") {
        mapperID = "1";
      }

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
      padding: !isScreen ? paddingW : EdgeInsets.symmetric(horizontal: 10),
      child:
          MetaColumnView(mainAxisAlignment: MainAxisAlignment.start, children: [
        if (screenshotController == null)
          Container(
            child: MetaColumnView(children: [
              if (screenshotController != null) getView("name", model.name),
              getView(
                  screenshotController == null
                      ? "current_date"
                      : "date_of_birth",
                  model.dob),
              getView("nakshatra",
                  HoroScopeUtils().getMetaNakshatra(model.chandraValue!)),
            ]),
          ),
        SizedBox(height: 10.h),
        screenshotController == null
            ? diagram()
            : Screenshot(
                controller: screenshotController!,
                child: diagram(),
              )
      ]),
    );
  }

  diagram() {
    return Stack(
      alignment: Alignment.center,
      children: [
        kundliType == 0
            ? KundliWidget(list: listKundli)
            : NorthNewKundliWidget(
                kundli: kundli,
                newData: catGroup!,
              ),
        if (kundliType == 0)
          Container(
            color: MetaColors.whiteColor,
            width: 150.w,
            height: 150.w,
            child: MetaSVGView(
                svgName: AssetConstants.logoOnySVG,
                basePath: MetaFlavourConstants.flavorPath),
          ),
      ],
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

  void northMapper(Map<String, dynamic> planetName) {
    int mapperID = planetName.values.first;
    String mapperKey = planetName.keys.first.toString();

    if (mapperID == 3) {
      kundli.id0!.$2.add(mapperKey);
    }

    if (mapperID == 2) {
      kundli.id11!.$2.add(mapperKey);
    }

    if (mapperID == 1) {
      kundli.id10!.$2.add(mapperKey);
    }

    if (mapperID == 0) {
      kundli.id9!.$2.add(mapperKey);
    }

    if (mapperID == 4) {
      kundli.id1!.$2.add(mapperKey);
    }

    if (mapperID == 5) {
      kundli.id2!.$2.add(mapperKey);
    }

    if (mapperID == 6) {
      kundli.id3!.$2.add(mapperKey);
    }

    if (mapperID == 7) {
      kundli.id4!.$2.add(mapperKey);
    }

    if (mapperID == 8) {
      kundli.id5!.$2.add(mapperKey);
    }

    if (mapperID == 9) {
      kundli.id6!.$2.add(mapperKey);
    }

    if (mapperID == 10) {
      kundli.id7!.$2.add(mapperKey);
    }

    if (mapperID == 11) {
      kundli.id8!.$2.add(mapperKey);
    }
  }

  getSlotMapper(int i) {
    if (i == 0) {
      return 12;
    }
    return i;
  }
}
