import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/domain/model/profile_model.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/image_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaProfileComponent extends StatelessWidget {
  ProfileModel? profileModel;
  Color? color;
  MetaProfileComponent({this.profileModel, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: MetaRowView(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 30.w,
                  height: 30.w,
                  child: MetaImageNetwork(
                      path: profileModel!.pic ?? "", shape: BoxShape.circle)),
              SizedBox(width: 5.w),
              Expanded(
                child: MetaColumnView(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MetaTextView(
                        text: profileModel!.name ?? "",
                        textAlign: TextAlign.start,
                        textStyle: MetaStyle(
                            fontSize: 10,
                            fontColor: color ?? MetaColors().primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 2.h),
                      MetaRowView(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MetaTextView(
                            text: profileModel!.date ?? "",
                            textAlign: TextAlign.start,
                            textStyle: MetaStyle(
                                fontSize: 8,
                                fontColor: color ?? MetaColors.color848484,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(width: 10.w),
                          if (profileModel!.data != null)
                            MetaTextView(
                              text: profileModel!.data ?? "",
                              textAlign: TextAlign.start,
                              textStyle: MetaStyle(
                                  fontSize: 10,
                                  fontColor: MetaColors().primaryColor,
                                  fontWeight: FontWeight.normal),
                            ),
                        ],
                      ),
                    ]),
              ),
              if (profileModel!.widgets != null)
                Container(
                  alignment: Alignment.centerRight,
                  child: profileModel!.widgets!,
                )
            ]));
  }
}
