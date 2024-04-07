import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DhashaBhukthiScreen extends StatelessWidget {
  DhashaBhukthiScreen({required this.list, required this.model});

  List<(String, String)> list = [];
  HoroscopeModel model;
  var padding = EdgeInsets.symmetric(horizontal: 8.w);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (ctx, i) {
        return InkWell(
          onTap: () {
            List<(String, String)> dataList =
                HoroScopeUtils().getMetaADasaBhuktiValues(i, model);

            Navigator.pushNamed(context, RouteConstants.dashaBhukthiOtherPath,
                arguments: {
                  'title': "${list[i].$1.tr()} ${"dasha_bhukti".tr()}",
                  'list': dataList
                });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: MetaRowView(children: [
              Expanded(
                  child: Container(child: rowText(list[i].$1, enabled: true))),
              Expanded(child: Container(child: rowText(list[i].$2))),
            ]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: MetaColors.color848484.withOpacity(0.2));
      },
    ));
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

class DhashaBhukthiOtherScreen extends StatelessWidget {
  DhashaBhukthiOtherScreen({required this.list, required this.title});

  List<(String, String)> list = [];
  String title;
  var padding = EdgeInsets.symmetric(horizontal: 8.w);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: MetaAppBar(
            title: title,
            action: Container(
              alignment: Alignment.topCenter,
              height: 40.w,
              width: 20.w,
            )),
        body: Container(
            child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: MetaRowView(children: [
                  Expanded(
                      child:
                          Container(child: rowText(list[i].$1, enabled: true))),
                  Expanded(child: Container(child: rowText(list[i].$2))),
                ]),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: MetaColors.color848484.withOpacity(0.2));
          },
        )),
      ),
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
