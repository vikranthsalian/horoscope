import 'dart:math';

import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/core/utils/date_time.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/domain/model/cities_model.dart';
import 'package:adithya_horoscope/domain/model/user.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/components/dialog/city_list_dialog.dart';
import 'package:adithya_horoscope/presentation/screens/horoscope/add/add_horoscope_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/column_view.dart';
import 'package:adithya_horoscope/presentation/widgets/icon.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_field.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddHoroScopeScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);
  AddHoroScopeFormBloc? formBloc;
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
                          onTap: () {
                            formBloc!.submit();
                          },
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
              create: (context) => AddHoroScopeFormBloc(),
              child: Builder(builder: (context) {
                formBloc = BlocProvider.of<AddHoroScopeFormBloc>(context);

                return FormBlocListener<AddHoroScopeFormBloc, String, String>(
                    onSubmissionFailed: (context, state) {
                      print("Error is.......$state");
                    },
                    onSuccess: (context, state) {
                      Navigator.pushNamed(
                          context, RouteConstants.viewHoroScopePath,
                          arguments: {
                            "user": User(
                                uniqueID: generateRandom(),
                                name: formBloc!.tfFName.value,
                                place: formBloc!.tfBLoc.value,
                                latitude: formBloc!.latitudeData.value,
                                longitude: formBloc!.longitudeData.value,
                                time: formBloc!.tfBT.value,
                                timezone: formBloc!.timezoneData.value! / 60,
                                createdData: DateTime.now().toString(),
                                date: formBloc!.tfDOB.value)
                          });
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
                              text: "new_horoscope",
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
                              text: "enter_details",
                              textStyle: MetaStyle(
                                  fontSize: 15,
                                  fontColor: MetaColors.color3F3F3F,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: padding,
                            child: MetaBlocTextField(
                              labelText: "full_name",
                              hintText: "enter_full_name",
                              textFieldBloc: formBloc!.tfFName,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                MetaDateTime().setDateTime(onSelected: (date) {
                                  if (date != null) {
                                    formBloc!.tfDOB.updateValue(date);
                                  }
                                });
                              },
                              child: MetaBlocTextField(
                                enabled: false,
                                labelText: "date_of_birth",
                                hintText: "choose_date_of_birth",
                                textFieldBloc: formBloc!.tfDOB,
                                inputType: TextInputType.text,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: padding,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                MetaDateTime().showTTimePicker(
                                    onSelected: (time) {
                                  if (time != null) {
                                    formBloc!.tfBT.updateValue(time);
                                  }
                                });
                              },
                              child: MetaBlocTextField(
                                enabled: false,
                                labelText: "birth_time",
                                hintText: "choose_birth_time",
                                textFieldBloc: formBloc!.tfBT,
                                inputType: TextInputType.text,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => MetaCityDialogList(
                                        selected: formBloc!.tfBLocID.value,
                                        onSelected: (CitiesModel value) {
                                          formBloc!.tfBLoc
                                              .updateValue(value.city!);
                                          formBloc!.tfBLocID.updateValue(
                                              value.city.toString());

                                          formBloc!.timezone.updateValue("+" +
                                              value.tZoneHour.toString() +
                                              "\u00B0 " +
                                              value.tZoneMin.toString() +
                                              "' ");

                                          formBloc!.longitudeData.updateValue(
                                              HoroScopeUtils()
                                                  .getMetaDegreeToDecimal(
                                            double.parse(
                                                value.longDeg.toString()),
                                            double.parse(
                                                value.longMin.toString()),
                                            double.parse("00"),
                                          ));

                                          formBloc!.longitude.updateValue(
                                              value.longDeg.toString() +
                                                  "\u00B0 " +
                                                  value.longMin.toString() +
                                                  "' " +
                                                  value.longDir.toString()
                                              // + '00" '
                                              );
                                          double dt = double.parse(
                                                  value.tZoneHour * 60) +
                                              double.parse(value.tZoneMin);
                                          formBloc!.timezoneData
                                              .updateValue(dt);
                                          formBloc!.latitudeData.updateValue(
                                              HoroScopeUtils()
                                                  .getMetaDegreeToDecimal(
                                            double.parse(
                                                value.latDeg.toString()),
                                            double.parse(
                                                value.latMin.toString()),
                                            double.parse("00"),
                                          ));

                                          formBloc!.latitude.updateValue(
                                              value.latDeg.toString() +
                                                  "\u00B0 " +
                                                  value.latMin.toString() +
                                                  "' " +
                                                  value.latDir.toString()
                                              // + '00" '
                                              );
                                        },
                                      ));
                            },
                            child: Container(
                              padding: padding,
                              child: MetaBlocTextField(
                                enabled: false,
                                labelText: "birth_location",
                                hintText: "enter_birth_location",
                                textFieldBloc: formBloc!.tfBLoc,
                                inputType: TextInputType.text,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          BlocBuilder<SelectFieldBloc, SelectFieldBlocState>(
                              bloc: formBloc!.timezone,
                              builder: (ctx, state) {
                                return Container(
                                    child: MetaRowView(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: padding,
                                        alignment: Alignment.centerLeft,
                                        child: MetaTextView(
                                          text: "time_zone",
                                          textStyle: MetaStyle(
                                              fontSize: 12,
                                              fontColor: MetaColors.color3F3F3F,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: padding,
                                      alignment: Alignment.centerLeft,
                                      child: MetaTextView(
                                        text: " : ",
                                        textStyle: MetaStyle(
                                            fontSize: 12,
                                            fontColor: MetaColors.color3F3F3F,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding: padding,
                                        alignment: Alignment.centerLeft,
                                        child: MetaTextView(
                                          text: state.value,
                                          textStyle: MetaStyle(
                                              fontSize: 12,
                                              fontColor:
                                                  MetaColors().primaryColor,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                          BlocBuilder<SelectFieldBloc, SelectFieldBlocState>(
                              bloc: formBloc!.latitude,
                              builder: (ctx, state) {
                                return Container(
                                    child: MetaRowView(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: padding,
                                        alignment: Alignment.centerLeft,
                                        child: MetaTextView(
                                          text: "latitude",
                                          textStyle: MetaStyle(
                                              fontSize: 12,
                                              fontColor: MetaColors.color3F3F3F,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: padding,
                                      alignment: Alignment.centerLeft,
                                      child: MetaTextView(
                                        text: " : ",
                                        textStyle: MetaStyle(
                                            fontSize: 12,
                                            fontColor: MetaColors.color3F3F3F,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding: padding,
                                        alignment: Alignment.centerLeft,
                                        child: MetaTextView(
                                          text: state.value,
                                          textStyle: MetaStyle(
                                              fontSize: 12,
                                              fontColor:
                                                  MetaColors().primaryColor,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                          BlocBuilder<SelectFieldBloc, SelectFieldBlocState>(
                              bloc: formBloc!.longitude,
                              builder: (ctx, state) {
                                return Container(
                                    child: MetaRowView(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: padding,
                                        alignment: Alignment.centerLeft,
                                        child: MetaTextView(
                                          text: "longitude",
                                          textStyle: MetaStyle(
                                              fontSize: 12,
                                              fontColor: MetaColors.color3F3F3F,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: padding,
                                      alignment: Alignment.centerLeft,
                                      child: MetaTextView(
                                        text: " : ",
                                        textStyle: MetaStyle(
                                            fontSize: 12,
                                            fontColor: MetaColors.color3F3F3F,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding: padding,
                                        alignment: Alignment.centerLeft,
                                        child: MetaTextView(
                                          text: state.value,
                                          textStyle: MetaStyle(
                                              fontSize: 12,
                                              fontColor:
                                                  MetaColors().primaryColor,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                              }),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          )),
    );
  }

  generateRandom() {
    Random random = Random();
    String number = '';
    for (int i = 0; i < 10; i++) {
      number = number + random.nextInt(9).toString();
    }
    return number;
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
