import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/screens/profile/profile_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumPlanScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);
  double amount = 499;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MetaColors.whiteColor,
          appBar: MetaAppBar(title: MetaFlavourConstants.appTitle),
          bottomNavigationBar: Container(
            height: 40.h,
            padding: padding,
            child: MetaButton(
              radius: 12,
              bgColor: MetaColors().primaryColor,
              textStyle: const MetaStyle(
                  fontColor: MetaColors.whiteColor,
                  fontWeight: FontWeight.w100,
                  fontSize: 16),
              onTap: () async {
                Navigator.of(context).pushNamed(RouteConstants.successPath);
              },
              text: "annual" + " " + amount.toString() + " / " + "year".tr(),
            ),
          ),
          body: Container(
            child: BlocProvider(
              create: (context) => ProfileFormBloc(),
              child: Builder(builder: (context) {
                ProfileFormBloc formBloc =
                    BlocProvider.of<ProfileFormBloc>(context);

                return FormBlocListener<ProfileFormBloc, String, String>(
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
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.1,
                          child: Container(
                            height: MediaQuery.sizeOf(context).height,
                            child: MetaSVGView(
                                svgName: AssetConstants.logoSVG,
                                basePath: MetaFlavourConstants.flavorPath),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.h),
                              Container(
                                padding: padding,
                                alignment: Alignment.center,
                                child: MetaTextView(
                                  text: "premium_plan",
                                  textStyle: MetaStyle(
                                      fontSize: 20,
                                      fontColor: MetaColors().primaryColor,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                padding: padding,
                                alignment: Alignment.centerLeft,
                                child: MetaTextView(
                                  text:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                                  textAlign: TextAlign.start,
                                  textStyle: MetaStyle(
                                      fontSize: 12,
                                      fontColor: MetaColors.color3F3F3F,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                padding: padding,
                                alignment: Alignment.centerLeft,
                                child: MetaTextView(
                                  text: "whats_included",
                                  textStyle: MetaStyle(
                                      fontSize: 14,
                                      fontColor: MetaColors().primaryColor,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              ListView(
                                padding: padding,
                                shrinkWrap: true,
                                children: getListPlans().map((String e) {
                                  return Container(
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: MetaTextView(
                                      text: "● " + e.tr(),
                                      textStyle: MetaStyle(
                                          fontSize: 14,
                                          fontColor: MetaColors.color3F3F3F,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              }),
            ),
          )),
    );
  }

  List<String> getListPlans() {
    return [
      "pachanga",
      "dasha-bhukti",
      "shadvarga",
      "ashtakavarga",
      "trisphutadi",
      "dhoomadi",
    ];
  }
}
