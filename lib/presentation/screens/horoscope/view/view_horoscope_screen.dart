import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/domain/model/planet_model.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/basic_details_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/bhava_kundli_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/navamsha_kundli_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/planet_info_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/tabs/rashi_kundli_screen.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/view/view_horoscope_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewHoroScopeScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 8.w);
  int d = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: MetaColors.whiteColor,
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
              create: (context) => ViewHoroScopeFormBloc(),
              child: Builder(builder: (context) {
                ViewHoroScopeFormBloc formBloc =
                    BlocProvider.of<ViewHoroScopeFormBloc>(context);

                return FormBlocListener<ViewHoroScopeFormBloc, String, String>(
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
                      child: Column(
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
                                    itemCount: MetaFlavourConstants
                                        .featuresList.length,
                                    itemBuilder: (ctx, index) {
                                      String data = MetaFlavourConstants
                                          .featuresList[index];

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
                                            child: MetaTextView(
                                              text: data,
                                              textStyle: MetaStyle(
                                                  fontSize: 12,
                                                  fontColor: index == value
                                                      ? MetaColors.whiteColor
                                                      : MetaColors.blackColor,
                                                  fontWeight: FontWeight.w400),
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
                            child: Container(
                                child: BlocBuilder<SelectFieldBloc,
                                        SelectFieldBlocState>(
                                    bloc: formBloc.feature,
                                    builder: (context, state) {
                                      if (state.value == 0) {
                                        return BasicDetailsScreen();
                                      }
                                      if (state.value == 1) {
                                        return getPlanetInfoDetails(formBloc);
                                      }
                                      if (state.value == 2) {
                                        return getRashiKundliDetails();
                                      }
                                      if (state.value == 3) {
                                        return getNavamshaKundliDetails();
                                      }
                                      if (state.value == 4) {
                                        return getBhavaKundliDetails();
                                      }

                                      return Container(
                                        child: BasicDetailsScreen(),
                                      );
                                    })),
                          )
                        ],
                      ),
                    ));
              }),
            ),
          )),
    );
  }

  getPlanetInfoDetails(ViewHoroScopeFormBloc formBloc) {
    List<PlanetModel> list = [
      PlanetModel(
          planet: "Lagn",
          longitude: "13 24 N",
          nakshathra: "Bharani",
          pada: "2"),
      PlanetModel(
          planet: "Ravi",
          longitude: "13 24 N",
          nakshathra: "Shravana",
          pada: "2"),
      PlanetModel(
          planet: "Chan",
          longitude: "13 24 N",
          nakshathra: "Ashlesha",
          pada: "2"),
      PlanetModel(
          planet: "Kuja",
          longitude: "13 24 N",
          nakshathra: "P.Ashadha",
          pada: "2"),
      PlanetModel(
          planet: "Buda",
          longitude: "13 24 N",
          nakshathra: "Ashwini",
          pada: "2"),
      PlanetModel(
          planet: "Guru", longitude: "13 24 N", nakshathra: "Moola", pada: "2"),
      PlanetModel(
          planet: "Sukr",
          longitude: "13 24 N",
          nakshathra: "Shatabhisha",
          pada: "2"),
      PlanetModel(
          planet: "Sani",
          longitude: "13 24 N",
          nakshathra: "Revathi",
          pada: "2"),
      PlanetModel(
          planet: "Rahu",
          longitude: "13 24 N",
          nakshathra: "Revathi",
          pada: "2"),
      PlanetModel(
          planet: "Ketu",
          longitude: "13 24 N",
          nakshathra: "Chitra",
          pada: "2"),
      PlanetModel(
          planet: "Mand",
          longitude: "13 24 N",
          nakshathra: "Shatabhisha",
          pada: "2"),
    ];
    return PlanetInfoScreen(list: list);
  }

  getRashiKundliDetails() {
    return RashiKundliScreen();
  }

  getNavamshaKundliDetails() {
    return NavamshaKundliScreen();
  }

  getBhavaKundliDetails() {
    return BhavaKundliScreen();
  }
}
