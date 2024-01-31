import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_field.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool showClose;
  final Function? leadingAction;
  final Widget action;
  final String title;
  const MetaAppBar(
      {required this.title,
      this.height = 40,
      this.showClose = false,
      this.leadingAction,
      this.action = const SizedBox()});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      alignment: Alignment.bottomLeft,
      color: MetaColors.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                child: MetaIcon(
                    icon: showClose
                        ? Icons.close
                        : Icons.arrow_back_ios_new_outlined,
                    onIconPressed: () {
                      if (leadingAction != null) {
                        leadingAction!();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    size: 15.r,
                    color: MetaColors.blackColor)),
          ),
          SizedBox(width: 10.w),
          Container(
            child: MetaTextView(
              text: title,
              textAlign: TextAlign.center,
              textStyle: MetaStyle(
                  fontSize: 18,
                  fontColor: MetaColors.blackColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            child: action,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}

getMainAppBar(TextEditingController controller) {
  return AppBar(
    toolbarHeight: 40.h,
    elevation: 0,
    backgroundColor: MetaColors.whiteColor,
    title: Container(
      width: 100.w,
      height: 40.h,
      child: MetaSVGView(
          svgName: AssetConstants.logoName,
          basePath: MetaFlavourConstants.flavorPath),
    ),
    actions: [
      InkWell(
        onTap: () {
          Navigator.pushNamed(globalContext, RouteConstants.searchPath);
        },
        child: Container(
          width: 20.w,
          height: 20.w,
          child: MetaSVGView(
              svgName: AssetConstants.searchIcon,
              basePath: MetaFlavourConstants.flavorPath),
        ),
      ),
      SizedBox(width: 20.w),
      InkWell(
        onTap: () {
          Navigator.pushNamed(globalContext, RouteConstants.notificationPath);
        },
        child: Container(
          width: 20.w,
          height: 20.w,
          child: MetaSVGView(
              svgName: AssetConstants.notificationIcon,
              basePath: MetaFlavourConstants.flavorPath),
        ),
      ),
      SizedBox(width: 20.w)
    ],
    bottom: PreferredSize(
      preferredSize: Size(MediaQuery.sizeOf(globalContext).width, 60.h),
      child: Container(
        color: MetaColors.whiteColor,
        child: MetaColumnView(
          children: [
            SizedBox(height: 5.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: MetaTextField(
                labelText: "",
                showTopLabel: false,
                controller: TextEditingController(text: controller.text),
                suffixIcon: Container(
                    child: MetaIcon(
                        icon: Icons.chevron_right_sharp,
                        size: 20,
                        color: MetaColors.color3c3c3c)),
                prefixIcon: Container(
                    child: MetaIcon(
                        icon: Icons.location_on_sharp,
                        size: 20,
                        color: MetaColors().primaryColor)),
              ),
            ),
            SizedBox(height: 10.h),
            Container(color: MetaColors.colorf7f7f7, height: 10.h),
          ],
        ),
      ),
    ),
    automaticallyImplyLeading: false,
  );
}
