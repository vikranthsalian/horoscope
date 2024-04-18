import 'dart:async';

import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/config/loader_config.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final tfEmail = TextFieldBloc(
      validators: [emptyValidator, emailValidator], initialValue: "");
  final tfPassword =
      TextFieldBloc(validators: [emptyValidator], initialValue: "");

  final dataModel = SelectFieldBloc<UserData, String>();
  final submitted = BooleanFieldBloc<bool>();
  final keepLoggedIn = SelectFieldBloc<bool, String>(initialValue: false);
  final loggedIn = BooleanFieldBloc<bool>(initialValue: false);
  final toggle = BooleanFieldBloc<bool>(initialValue: false);

  LoginFormBloc() : super(autoValidate: true) {
    addFieldBlocs(fieldBlocs: [
      tfEmail,
      tfPassword,
    ]);
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

  static String? emptyValidator(dynamic value) {
    if (value.isEmpty) {
      return "field_cannot_be_empty".tr();
    }
    return null;
  }

  @override
  FutureOr<void> onSubmitting() async {
    MetaProgressHUD.showLoading(text: "logging_you_in.......");
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: tfEmail.value, password: tfPassword.value);
      User? user = FirebaseAuth.instance.currentUser;
      String uid = user!.uid;
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
      if (!user.emailVerified) {
        MetaAlert.showSuccessAlert(message: "email_verification_sent");
        await user.sendEmailVerification();
        emitFailure();
      } else {
        final sp = await ref.get();
        Map<dynamic, dynamic>? finalData = sp.value as Map<dynamic, dynamic>?;
        Map<String, dynamic> allData = finalData!.cast<String, dynamic>();

        print("allData");
        print(allData);

        if (allData['plan_id'] != null &&
            allData['plan_id'].toString().isNotEmpty &&
            allData['plan_details'] == "premium") {
          DatabaseReference pref = FirebaseDatabase.instance
              .ref("payment_details/${allData['plan_id']}");

          final snapshot = await pref.get();
          Map<dynamic, dynamic>? paymentData =
              snapshot.value as Map<dynamic, dynamic>?;

          DateTime cdateTime = DateTime.now();
          DateTime endDate =
              DateFormat("dd-MM-yyyy").parse(paymentData!['end_date']);

          var diff = endDate.difference(cdateTime).inDays;
          if (diff < 1) {
            await ref.update({
              "plan_details": "basic",
              "plan_id": "",
              "last_login": DateTime.now().toString(),
            }).then((_) {
              print(" Data saved successfully!");

              allData['plan_details'] = "basic";
              allData['plan_id'] = "";
              allData['last_login'] = DateTime.now().toString();
            }).catchError((error) {
              print(error);
            });
          }
          print("------------");
          print(diff);
        } else {
          //update user

          await ref.update({
            "last_login": DateTime.now().toString(),
          }).then((_) {
            print(" Data saved successfully!");
          }).catchError((error) {
            print(error);
          });
        }

        MetaHiveConfig().putHive(StringConstants.keepLoggedIn, true);
        MetaHiveConfig().putHive(StringConstants.userData, allData);
        UserData model = UserData.fromJson(allData);
        globalContext.read<LoginCubit>().setLoginResponse(model);
        Navigator.pushReplacementNamed(globalContext, RouteConstants.homePath);
      }
    } on FirebaseAuthException catch (e) {
      print(e);

      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        MetaAlert.showSuccessAlert(message: "no_user_found_for_that_email");
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        MetaAlert.showSuccessAlert(message: "wrong_password_provided_by_user");
      } else {
        MetaAlert.showSuccessAlert(message: "no_user_found_for_that_email");
      }
      emitFailure();
    } finally {
      MetaProgressHUD.dismiss();
    }
  }
}
