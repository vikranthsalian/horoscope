import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
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
    this.colors = MetaColors.whiteColor,
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
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: colors,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          enabledBorder: _renderBorder(
                              MetaColors.color3F3F3F.withOpacity(0.2)),
                          hintText: text,
                          focusedBorder:
                              _renderBorder(MetaColors().primaryColor),
                          hintStyle: MetaStyle(
                                  fontSize: 10,
                                  fontColor: MetaColors.color3F3F3F,
                                  fontWeight: FontWeight.w100)
                              .getStyle(),
                          suffixIcon: Container(
                            height: 10,
                            width: 10,
                            padding: EdgeInsets.all(10),
                            // color: Colors.red,
                            child: MetaSVGView(
                                svgName: AssetConstants.searchIcon,
                                basePath: MetaFlavourConstants.flavorPath),
                          )
                          // prefixIcon: MetaIcon(icon:Icons.search,onIconPressed: (){
                          //
                          //     }, color: Colors.black54)
                          )))),
        ],
      ),
    );
  }

  OutlineInputBorder _renderBorder(color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: color!),
      );

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
