import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/domain/model/sort_model.dart';
import 'package:adithya_horoscope/presentation/components/dialog/dialog.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaDialogList extends StatelessWidget {
  Function? onSelected;
  String header;
  int? selected;
  List<DialogListModel> list;
  MetaDialogList(
      {this.onSelected,
      required this.header,
      this.selected,
      required this.list});

  @override
  Widget build(BuildContext context) {
    return MetaDialog(
        child: Container(
      height: 250.h,
      child: MetaColumnView(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              color: MetaColors.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: MetaTextView(
                      textAlign: TextAlign.start,
                      text: header,
                      textStyle: MetaStyle(
                          fontSize: 14,
                          fontColor: MetaColors.blackColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Container(
              color: MetaColors.whiteColor,
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: list.length,
                itemBuilder: (context, i) {
                  return InkWell(
                      onTap: () {
                        onSelected!(list[i]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 6.h),
                        child: MetaTextView(
                          textAlign: TextAlign.center,
                          text: list[i].name ?? "",
                          textStyle: MetaStyle(
                              fontSize: 12,
                              fontColor: selected == list[i].id
                                  ? MetaColors().primaryColor
                                  : MetaColors.greyColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ),
          Container(
            height: 35.h,
            child: MetaButton(
              radius: 12.r,
              bgColor: MetaColors().primaryColor,
              textStyle: const MetaStyle(
                  fontColor: MetaColors.whiteColor, fontSize: 14),
              onTap: () async {
                Navigator.pop(context);
              },
              text: "close",
            ),
          ),
        ],
      ),
    ));
  }
}
