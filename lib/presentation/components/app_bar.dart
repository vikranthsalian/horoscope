import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: action,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
