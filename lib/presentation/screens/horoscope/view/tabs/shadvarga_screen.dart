import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/domain/model/shadvarga_model.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShadvargaScreen extends StatelessWidget {
  ShadvargaScreen({required this.list});

  List<ShadVargaModel> list = [];
  List<String> headers = ["graha", "dre", "hor", "nav", "tri", "dwa", "ksh"];
  var padding = EdgeInsets.symmetric(horizontal: 8.w);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: MetaColumnView(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MetaRowView(
                  children: headers.asMap().entries.map((e) {
                return Expanded(
                  child: Container(
                    child: MetaTextView(
                      text: e.value,
                      textStyle: MetaStyle(
                          fontSize: 12,
                          fontColor: MetaColors.color3F3F3F,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              }).toList()),
              SizedBox(
                height: 10.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: MetaRowView(children: [
                        Expanded(
                            child: rowText(list[i].graha!.toString(),
                                enabled: true)),
                        Expanded(
                            child: Container(child: rowText(list[i].dre!))),
                        Expanded(
                            child: Container(child: rowText(list[i].hor!))),
                        Expanded(
                            child: Container(child: rowText(list[i].nav!))),
                        Expanded(
                            child: Container(child: rowText(list[i].tri!))),
                        Expanded(
                            child: Container(child: rowText(list[i].dwa!))),
                        Expanded(
                            child: Container(child: rowText(list[i].ksh!))),
                      ]),
                    );
                  })
            ]),
      ),
    );
  }

  Widget superScriptText(String e, {bool enabled = false}) {
    List array = e.split("SS");

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: array[0],
            style: MetaStyle(
                    fontSize: 12,
                    fontColor: MetaColors.color3F3F3F,
                    fontWeight: FontWeight.w100)
                .getStyle(),
            children: [
              TextSpan(
                text: " ",
                style: MetaStyle(
                        fontSize: 4,
                        fontColor: MetaColors.color3F3F3F,
                        fontWeight: FontWeight.w100)
                    .getStyle(),
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.top,
                  child: Container(
                    child: MetaTextView(
                      text: 's',
                      textStyle: MetaStyle(
                          fontSize: 8,
                          fontColor: enabled
                              ? MetaColors().primaryColor
                              : MetaColors.color3F3F3F,
                          fontWeight: FontWeight.w100),
                    ),
                  )),
              TextSpan(
                text: array[1],
                style: MetaStyle(
                        fontSize: 12,
                        fontColor: MetaColors.color3F3F3F,
                        fontWeight: FontWeight.w100)
                    .getStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget rowText(String e, {bool enabled = false}) {
    return Container(
      child: MetaTextView(
        text: e,
        textStyle: MetaStyle(
            fontSize: 12,
            fontColor:
                enabled ? MetaColors().primaryColor : MetaColors.color3F3F3F,
            fontWeight: FontWeight.w100),
      ),
    );
  }
}
