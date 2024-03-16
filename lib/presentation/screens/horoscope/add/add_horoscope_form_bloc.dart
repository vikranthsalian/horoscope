import 'dart:async';

import 'package:adithya_horoscope/core/ext/timeofday_ext.dart';
import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/core/utils/location.dart';
import 'package:adithya_horoscope/domain/model/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:geolocator/geolocator.dart';

class AddHoroScopeFormBloc extends FormBloc<String, String> {
  final tfFName = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final tfDOB = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final tfBT = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final tfBLoc = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final timezone =
      SelectFieldBloc(validators: [emptyValidator], initialValue: "0.00");
  final latitude =
      SelectFieldBloc(validators: [emptyValidator], initialValue: "0° 0 N");
  final longitude =
      SelectFieldBloc(validators: [emptyValidator], initialValue: "0° 0 N");

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
    Position pos = await LocationUtils().determinePosition();
    position.updateValue(pos);

    DateTime dateTime = DateTime.now();
    print("dateTime");

    String _date = DateFormat('dd-MM-yyyy').format(dateTime);
    TimeOfDay timeOfDay = TimeOfDay.now();

    tfDOB.updateValue(_date);
    tfBT.updateValue(timeOfDay.toStringFormat);
    timezone.updateValue(
        "+${HoroScopeUtils().getMetaDecimalToDegree(dateTime.timeZoneOffset.inMinutes / 60)}");
    if (pos.latitude != null && pos.longitude != null) {
      longitude
          .updateValue(HoroScopeUtils().getMetaDecimalToDegree(pos.longitude));
      latitude
          .updateValue(HoroScopeUtils().getMetaDecimalToDegree(pos.latitude));
    }

    emitLoaded();
  }

  @override
  FutureOr<void> onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
  }
}
