import 'dart:async';
import 'dart:convert';

import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/model/cities_model.dart';
import 'package:adithya_horoscope/domain/model/response.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ProfileFormBloc extends FormBloc<String, String> {
  final tfFName = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final tfDOB = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final tfPhNo = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final location =
      TextFieldBloc(validators: [emptyValidator], initialValue: "udipi");

  final dataModel = SelectFieldBloc<MetaResponse, String>();
  final user = SelectFieldBloc<UserData, String>();
  final days = SelectFieldBloc<String, String>();
  final isLoading = BooleanFieldBloc(initialValue: false);

  ProfileFormBloc() : super(autoValidate: true, isLoading: true) {
    addFieldBlocs(fieldBlocs: [
      tfFName,
      tfPhNo,
      tfDOB,
      location,
      days,
    ]);
  }

  static String? emptyValidator(dynamic value) {
    if (value.isEmpty) {
      return "field_cannot_be_empty";
    }
    return null;
  }

  static String? mobileValidator(dynamic value) {
    if (value.isEmpty || value.length < 10) {
      return 'invalid_phone_number';
    }
    return null;
  }

  static String? emailValidator(dynamic value) {
    if (value == null ||
        value.isEmpty ||
        !value.contains('@') ||
        !value.contains('.')) {
      return 'invalid_email_address';
    }
    return null;
  }

  @override
  FutureOr<void> onLoading() async {
    print(user.value!.planDetails);
    print(user.value!.planID);

    try {
      Map<String,dynamic>? cityData = MetaHiveConfig().getHive(StringConstants.cityData);
      print(cityData);
      if (cityData != null) {
        CitiesModel model = CitiesModel.fromJson(cityData);

        location.updateValue(model.city!);
      }
    }catch(e){
      print(e);
    }

    if (user.value!.planDetails == "premium") {
      DatabaseReference pref = FirebaseDatabase.instance
          .ref("payment_details/${user.value!.planID}");

      final snapshot = await pref.get();
      Map<dynamic, dynamic>? paymentData =
          snapshot.value as Map<dynamic, dynamic>?;

      DateTime cdateTime = DateTime.now();
      DateTime endDate =
          DateFormat("dd-MM-yyyy").parse(paymentData!['end_date']);

      var diff = endDate.difference(cdateTime).inDays;
      if (diff < 1) {
        DatabaseReference ref =
            FirebaseDatabase.instance.ref("users/${user.value!.id}");
        await ref.update({
          "plan_details": "basic",
          "plan_id": "",
        }).then((_) {
          print(" Data saved successfully!");
        }).catchError((error) {
          print(error);
        });

        final sp = await ref.get();
        Map<dynamic, dynamic>? finalData = sp.value as Map<dynamic, dynamic>?;
        Map<String, dynamic> allData = finalData!.cast<String, dynamic>();

        print("allData");
        print(allData);

        MetaHiveConfig().putHive(StringConstants.userData, allData);
      } else {
        print("plan actice");
        isLoading.updateValue(true);
        days.updateValue(diff.toString());
        isLoading.updateValue(false);
      }
    }
    emitLoaded();
  }

  @override
  FutureOr<void> onSubmitting() async {}
}
