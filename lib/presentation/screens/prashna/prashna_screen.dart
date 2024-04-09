import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/navamsha_kundli_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/planet_info_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/rashi_kundli_screen.dart';
import 'package:adithya_horoscope/presentation/screens/prashna/prashna_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrashnaScreen extends StatelessWidget {
  Map<String, dynamic> data;
  PrashnaScreen({required this.data});
  var padding = EdgeInsets.symmetric(horizontal: 8.w);

  UserData? userData;
  @override
  Widget build(BuildContext context) {
    userData = context.read<LoginCubit>().getLoginResponse();

    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: MetaColors().primaryColor.withOpacity(0.2),
          appBar: MetaAppBar(
              title: MetaFlavourConstants.appTitle,
              action: Container(
                alignment: Alignment.topCenter,
                height: 40.w,
                width: 20.w,
                child: MetaIcon(
                    icon: Icons.settings,
                    onIconPressed: () {
                      Navigator.pushNamed(context, RouteConstants.settingsPath);
                    },
                    size: 15,
                    color: MetaColors.color3F3F3F),
              )),
          body: Container(
            child: BlocProvider(
              create: (context) => PrashnaFormBloc(),
              child: Builder(builder: (context) {
                PrashnaFormBloc formBloc =
                    BlocProvider.of<PrashnaFormBloc>(context);

                formBloc.inputModel.updateValue(data['user']);

                return FormBlocListener<PrashnaFormBloc, String, String>(
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
                    child: Container(
                      child: MetaColumnView(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Container(
                            height: 40,
                            child: BlocBuilder<SelectFieldBloc,
                                    SelectFieldBlocState>(
                                bloc: formBloc.feature,
                                builder: (context, state) {
                                  int value = state.value;

                                  return Container(
                                      child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.zero,
                                    itemCount:
                                        MetaFlavourConstants.prashnaList.length,
                                    itemBuilder: (ctx, index) {
                                      String data = MetaFlavourConstants
                                          .prashnaList[index];

                                      return Container(
                                        child: InkWell(
                                          onTap: () {
                                            formBloc.feature.updateValue(index);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(
                                                left: 5.w, right: 5.w),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            //   width: 140.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: index == value
                                                    ? MetaColors().primaryColor
                                                    : MetaColors.whiteColor,
                                                border: Border.all(
                                                    color: index == value
                                                        ? MetaColors()
                                                            .primaryColor
                                                        : MetaColors
                                                            .colord7d7d7)),
                                            child: MetaRowView(
                                              children: [
                                                MetaTextView(
                                                  text: data,
                                                  textStyle: MetaStyle(
                                                      fontSize: 12,
                                                      fontColor: index == value
                                                          ? MetaColors
                                                              .whiteColor
                                                          : MetaColors
                                                              .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ));
                                }),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Expanded(
                            child: BlocBuilder<BooleanFieldBloc,
                                    BooleanFieldBlocState>(
                                bloc: formBloc.showLoading,
                                builder: (context, state) {
                                  if (state.value) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }

                                  return Container(
                                      child: BlocBuilder<SelectFieldBloc,
                                              SelectFieldBlocState>(
                                          bloc: formBloc.feature,
                                          builder: (context, state) {
                                            if (state.value == 0) {
                                              return PlanetInfoScreen(
                                                  model:
                                                      formBloc.dataModel.value!,
                                                  isScreen: false,
                                                  list: formBloc
                                                          .dataModel
                                                          .value!
                                                          .grahaSputhaValues ??
                                                      []);
                                            }
                                            if (state.value == 1) {
                                              return RashiKundliScreen(
                                                  screenshotController: null,
                                                  model: formBloc
                                                      .dataModel.value!);
                                            }
                                            if (state.value == 2) {
                                              return NavamshaKundliScreen(
                                                  isScreen: false,
                                                  screenshotController: null,
                                                  model: formBloc
                                                      .dataModel.value!);
                                            }

                                            return getUserBlockedView();
                                          }));
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

  getUserBlockedView() {
    return Container(
      child: MetaColumnView(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(globalContext).height * 0.35,
            child: MetaSVGView(
                svgName: AssetConstants.logoGrey,
                basePath: MetaFlavourConstants.flavorPath),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            alignment: Alignment.center,
            child: MetaTextView(
              text: MetaFlavourConstants.appTitle,
              textStyle: MetaStyle(
                  fontSize: 22,
                  fontColor: MetaColors().primaryColor,
                  fontWeight: FontWeight.w100),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            alignment: Alignment.center,
            child: MetaTextView(
              text: "premium_membership_only",
              textStyle: MetaStyle(
                  fontSize: 16,
                  fontColor: MetaColors.color3c3c3c,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            alignment: Alignment.center,
            child: MetaTextView(
              text: '''Above option has been locked.
Subscribe to Aditya premium for more 
view option''',
              textStyle: MetaStyle(
                  fontSize: 14,
                  fontColor: MetaColors.color3c3c3c,
                  fontWeight: FontWeight.w100),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 40.w),
            child: MetaButton(
              radius: 12,
              bgColor: MetaColors().primaryColor,
              textStyle: const MetaStyle(
                  fontColor: MetaColors.whiteColor,
                  fontWeight: FontWeight.w100,
                  fontSize: 20),
              onTap: () async {
                Navigator.pushNamed(
                    globalContext, RouteConstants.premiumPlanPath);
              },
              text: "subscribe",
            ),
          ),
        ],
      ),
    );
  }
}
