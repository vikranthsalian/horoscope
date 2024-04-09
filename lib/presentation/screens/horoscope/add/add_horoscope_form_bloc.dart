import 'dart:async';

import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/core/ext/timeofday_ext.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/cities_model.dart';
import 'package:adithya_horoscope/domain/model/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:geolocator/geolocator.dart';

class AddHoroScopeFormBloc extends FormBloc<String, String> {
  final tfFName = TextFieldBloc(validators: [], initialValue: "");
  final tfDOB = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final tfBT = TextFieldBloc(validators: [emptyValidator], initialValue: "");

  final selectedCity = SelectFieldBloc<CitiesModel, String>(
      initialValue: CitiesModel(
          city: "udipi",
          latDeg: 13,
          latMin: 20,
          latDir: "N",
          longDeg: 74,
          longMin: 45,
          longDir: "E",
          tZoneHour: 5,
          tZoneMin: 30));
  final tfBLoc = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final tfBLocID =
      TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final timezone =
      SelectFieldBloc(validators: [emptyValidator], initialValue: "");
  final latitude =
      SelectFieldBloc(validators: [emptyValidator], initialValue: "");
  final longitude =
      SelectFieldBloc(validators: [emptyValidator], initialValue: "");

  final timezoneData = SelectFieldBloc<double, String>();
  final latitudeData = SelectFieldBloc<double, String>();
  final longitudeData = SelectFieldBloc<double, String>();
  final dataModel = SelectFieldBloc<MetaResponse, String>();
  final position = SelectFieldBloc<Position, String>();

  AddHoroScopeFormBloc() : super(autoValidate: true, isLoading: true) {
    addFieldBlocs(fieldBlocs: [
      tfFName,
      tfBT,
      tfDOB,
      tfBLoc,
    ]);
  }

  static String? emptyValidator(dynamic value) {
    if (value.isEmpty) {
      return "field_cannot_be_empty";
    }
    return null;
  }

  @override
  onLoading() async {
    print("onLoading");
    //  Position pos = await LocationUtils().determinePosition();
    // position.updateValue(pos);

    initialValues();
  }

  @override
  FutureOr<void> onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
  }

  initialValues() {
    Map<String, dynamic>? cityData = {};
    try {
      cityData = MetaHiveConfig().getHive(StringConstants.cityData);

      if (cityData != null) {
        selectedCity.updateValue(CitiesModel.fromJson(cityData));
      }
    } catch (e) {}

    tfBLoc.updateValue(selectedCity.value!.city!);
    timezone.updateValue(selectedCity.value!.timeZoneLiteral);
    latitude.updateValue(selectedCity.value!.latitudeLiteral);
    longitude.updateValue(selectedCity.value!.longitudeLiteral);

    CitiesModel model = selectedCity.value!;

    DateTime dateTime = DateTime.now();
    print("dateTime");

    String _date = DateFormat('dd-MM-yyyy').format(dateTime);
    TimeOfDay timeOfDay = TimeOfDay.now();

    tfDOB.updateValue(_date);
    tfBT.updateValue(timeOfDay.toStringFormat);

    double dt = double.parse((model.tZoneHour * 60).toString()) +
        double.parse(model.tZoneMin.toString());
    timezoneData.updateValue(dt);
    latitudeData.updateValue(HoroScopeUtils().getMetaDegreeToDecimal(
      double.parse(model.latDeg.toString()),
      double.parse(model.latMin.toString()),
      double.parse("00"),
    ));
    longitudeData.updateValue(HoroScopeUtils().getMetaDegreeToDecimal(
      double.parse(model.longDeg.toString()),
      double.parse(model.longMin.toString()),
      double.parse("00"),
    ));
    tfFName.updateValue("");
    emitLoaded();
  }
}
