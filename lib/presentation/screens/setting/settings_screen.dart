import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/screens/setting/settings_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_field.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: MetaColors.whiteColor,
          appBar: MetaAppBar(title: MetaFlavourConstants.appTitle),
          bottomNavigationBar: Container(
            // padding: EdgeInsets.symmetric(vertical: 20.h),
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x54000000),
                  spreadRadius: 4,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r)),
              child: Container(
                color: Colors.white,
                child: MetaColumnView(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MetaRowView(children: [
                      InkWell(
                          onTap: () {},
                          child: customButtons(AssetConstants.nowIcon, "now")),
                      InkWell(
                          onTap: () {},
                          child: customButtons(
                              AssetConstants.proceedIcon, "proceed")),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstants.savedHoroScopePath);
                          },
                          child: customButtons(
                              AssetConstants.historyIcon, "history")),
                    ])
                  ],
                ),
              ),
            ),
          ),
          resizeToAvoidBottomInset: true,
          body: Container(
            child: BlocProvider(
              create: (context) => SettingsFormBloc(),
              child: Builder(builder: (context) {
                SettingsFormBloc formBloc =
                    BlocProvider.of<SettingsFormBloc>(context);

                return FormBlocListener<SettingsFormBloc, String, String>(
                    onSubmissionFailed: (context, state) {
                      print("Error is.......$state");
                    },
                    onSuccess: (context, state) {
                      formBloc.clear();
                      // SignUpResponse? modelResponse = formBloc.dataModel.value;
                      //  Navigator.pop(context,(true,modelResponse!.email));
                    },
                    onFailure: (context, state) {
                      MetaAlert.showSnackbar(
                        error: true,
                        message: state.hasFailureResponse.toString(),
                      );
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.h),
                          Container(
                            padding: padding,
                            alignment: Alignment.center,
                            child: MetaTextView(
                              text: "settings",
                              textStyle: MetaStyle(
                                  fontSize: 20,
                                  fontColor: MetaColors().primaryColor,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaBlocTextField(
                              labelText: "language",
                              hintText: "choose_your_language",
                              textFieldBloc: formBloc.tfLanguage,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaBlocTextField(
                              labelText: "kundli_type",
                              hintText: "choose_kundli_type",
                              textFieldBloc: formBloc.tfKundliType,
                              inputType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaBlocTextField(
                              labelText: "sunrise_system",
                              hintText: "choose_sunrise_system",
                              textFieldBloc: formBloc.tfSunriseSytem,
                              inputType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          )),
    );
  }

  customButtons(String nowIcon, String text) {
    return Container(
      child: MetaColumnView(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            child: MetaSVGView(
                svgName: nowIcon, basePath: MetaFlavourConstants.flavorPath),
          ),
          Container(
            padding: padding,
            alignment: Alignment.centerLeft,
            child: MetaTextView(
              text: text,
              textStyle: const MetaStyle(
                  fontSize: 12,
                  fontColor: MetaColors.color3F3F3F,
                  fontWeight: FontWeight.w100),
            ),
          ),
        ],
      ),
    );
  }
}
