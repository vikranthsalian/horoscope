import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/components/search_view.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/saved/saved_horoscope_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedHoroScopeScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: MetaColors.whiteColor,
          appBar: MetaAppBar(title: MetaFlavourConstants.appTitle),
          body: Container(
            child: BlocProvider(
              create: (context) => SavedHoroScopeFormBloc(),
              child: Builder(builder: (context) {
                SavedHoroScopeFormBloc formBloc =
                    BlocProvider.of<SavedHoroScopeFormBloc>(context);

                return FormBlocListener<SavedHoroScopeFormBloc, String, String>(
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
                              text: "saved_horoscope",
                              textStyle: MetaStyle(
                                  fontSize: 20,
                                  fontColor: MetaColors().primaryColor,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            padding: padding,
                            child: MetaSearchView(
                                text: "search_horoscope_by_name"),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            alignment: Alignment.centerLeft,
                            child: MetaTextView(
                              text: "recent_horoscope",
                              textStyle: MetaStyle(
                                  fontSize: 15,
                                  fontColor: MetaColors.color3F3F3F,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: 10,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: MetaColors.color3F3F3F
                                                .withOpacity(0.3))),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 10.w),
                                    child: ListTile(
                                      //   isThreeLine: true,
                                      leading: Container(
                                        height: 40.w,
                                        width: 40.w,
                                        child: MetaSVGView(
                                            svgName: AssetConstants.logoSVG,
                                            basePath: MetaFlavourConstants
                                                .flavorPath),
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      trailing: Container(
                                        alignment: Alignment.topCenter,
                                        height: 40.w,
                                        width: 20.w,
                                        child: MetaIcon(
                                            icon: Icons.more_vert,
                                            size: 15,
                                            color: MetaColors.color3F3F3F),
                                      ),
                                      title: MetaTextView(
                                        text: "Dynamic Name",
                                        textAlign: TextAlign.start,
                                        textStyle: MetaStyle(
                                            fontSize: 12,
                                            fontColor: MetaColors.color3F3F3F,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      subtitle: MetaTextView(
                                        text: "Dynamic Date\nDynamic City",
                                        textAlign: TextAlign.start,
                                        textStyle: MetaStyle(
                                            fontSize: 10,
                                            fontColor: MetaColors.color3F3F3F,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ),
                                  );
                                }),
                          )
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
