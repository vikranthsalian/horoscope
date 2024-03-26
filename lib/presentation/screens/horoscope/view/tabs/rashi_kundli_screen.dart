import 'dart:io';
import 'dart:typed_data';

import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/data/cubits/kundliType/kundli_type_cubit.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/kundli_model.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/components/kundli.dart';
import 'package:adithya_horoscope/presentation/components/north_kundli.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class RashiKundliScreen extends StatelessWidget {
  HoroscopeModel model;
  ScreenshotController? screenshotController;
  bool isScreen;
  RashiKundliScreen(
      {this.isScreen = false, required this.model, this.screenshotController});

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
      id1: [],
      id2: [],
      id3: [],
      id4: [],
      id5: [],
      id6: [],
      id7: [],
      id8: [],
      id9: [],
      id10: [],
      id11: [],
      id12: []);

  @override
  Widget build(BuildContext context) {
    kundliType = context.read<KundliTypeCubit>().getKundliType();
    print("---------------------South Kundli---------------------------");
    //print(kundliType);
    for (var entry in model.rasiKundliValues!.asMap().entries) {
      Map<String, dynamic> planetName = entry.value;
      print(planetName);
      northMapper(planetName);
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
    print(listKundli);

    if (isScreen) {
      return SafeArea(
          child: Scaffold(
              appBar: MetaAppBar(
                  title: "rashi_kundli",
                  action: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteConstants.planetInfoPath, arguments: {
                        "isScreen": true,
                        "model": model,
                        "list": model.grahaSputhaValues,
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      height: 40.w,
                      width: 80.w,
                      child: MetaTextView(
                        text: "planet_info",
                        textStyle: MetaStyle(
                            fontSize: 9,
                            fontColor: MetaColors().primaryColor,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                  )),
              body: getBody()));
    }
    return getBody();
  }

  getBody() {
    return Container(
      child:
          MetaColumnView(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          padding: paddingW,
          child: MetaColumnView(children: [
            getView("name", model.name),
            getView("date_of_birth", model.dob),
            getView("nakshatra",
                HoroScopeUtils().getMetaNakshatra(model.chandraValue!)),
          ]),
        ),
        SizedBox(height: 10.h),
        isScreen
            ? diagram()
            : Screenshot(
                controller: screenshotController!,
                child: diagram(),
              )
      ]),
    );
  }

  diagram() {
    return Container(
      padding: !isScreen ? paddingW : EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          kundliType == 0
              ? KundliWidget(list: listKundli)
              : NorthKundliWidget(kundli: kundli),
          if (kundliType == 0)
            InkWell(
              onTap: () async {
                await screenshotController!
                    .capture(delay: const Duration(milliseconds: 10))
                    .then((Uint8List? image) async {
                  print("screenshotController");
                  print(image);
                  if (image != null) {
                    String fileName =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    final directory = await getApplicationDocumentsDirectory();
                    File file = await File('${directory.path}/${fileName}.png');
                    await file.writeAsBytes(image);
                    return file;
                  }
                });
              },
              child: Container(
                color: MetaColors.whiteColor,
                width: 150.w,
                height: 150.w,
                child: MetaSVGView(
                    svgName: AssetConstants.logoOnySVG,
                    basePath: MetaFlavourConstants.flavorPath),
              ),
            ),
        ],
      ),
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
                //   padding: paddingW,
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
              // padding: paddingW,
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
    String mapperID = planetName.values.first.toString();
    String mapperKey = planetName.keys.first.toString();

    if (mapperID == "1") {
      kundli.id7!.add(mapperKey);
    }
    if (mapperID == "2") {
      kundli.id8!.add(mapperKey);
    }
    if (mapperID == "3") {
      kundli.id9!.add(mapperKey);
    }
    if (mapperID == "4") {
      kundli.id10!.add(mapperKey);
    }
    if (mapperID == "5") {
      kundli.id11!.add(mapperKey);
    }
    if (mapperID == "6") {
      if (mapperKey != "Lg") {
        kundli.id12!.add(mapperKey);
      }
    }
    if (mapperID == "7") {
      kundli.id1!.add(mapperKey);
    }
    if (mapperID == "8") {
      kundli.id2!.add(mapperKey);
    }
    if (mapperID == "9") {
      kundli.id3!.add(mapperKey);
    }
    if (mapperID == "10") {
      kundli.id4!.add(mapperKey);
    }
    if (mapperID == "11") {
      kundli.id5!.add(mapperKey);
    }
    if (mapperID == "12") {
      kundli.id6!.add(mapperKey);
    }

    if (mapperID == "0") {
      kundli.id6!.add(mapperKey);
    }
  }
}
