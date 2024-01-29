import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaSearchView extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color colors;
  final FontWeight fontWeight;
  final Function? onSearch;
  MetaSearchView({
    this.text = "Search Products",
    this.fontSize = 18,
    this.colors = MetaColors.lightGreyColor,
    this.fontWeight = FontWeight.w800,
    this.onSearch,
  });
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
      child: MetaRowView(
        children: <Widget>[
          Container(
            child: MetaIcon(
                icon: Icons.arrow_back_ios_new_outlined,
                onIconPressed: () {
                  Navigator.pop(context);
                },
                size: 15.r,
                color: MetaColors.blackColor),
          ),
          SizedBox(width: 10.w),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: colors.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: text,
                          hintStyle: const MetaStyle(
                                  fontSize: 10,
                                  fontColor: MetaColors.blackColor,
                                  fontWeight: FontWeight.w500)
                              .getStyle(),
                          prefixIcon:
                              Icon(Icons.search, color: Colors.black54))))),
          SizedBox(width: 5.w),
          _icon(Icons.search, context, colors: Colors.white),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, context,
      {Color colors = MetaColors.lightGreyColor}) {
    return Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: MetaColors.blackColor,
        ),
        child: MetaIcon(
            icon: icon,
            onIconPressed: () {
              onSearch!(controller.text);
            },
            size: 15.r,
            color: colors));
  }
}
