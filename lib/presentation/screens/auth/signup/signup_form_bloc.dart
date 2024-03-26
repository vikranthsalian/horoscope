import 'dart:async';

import 'package:adithya_horoscope/core/config/loader_config.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/domain/model/response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SignupFormBloc extends FormBloc<String, String> {
  final tfFName =
      TextFieldBloc(validators: [emptyValidator], initialValue: "vikkysalian");
  final tfEmail = TextFieldBloc(
      validators: [emptyValidator, emailValidator],
      initialValue: "vikkysalian@gmail.com");
  final tfPassword =
      TextFieldBloc(validators: [emptyValidator], initialValue: "12345678");
  // final tfDOB = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final dataModel = SelectFieldBloc<MetaResponse, String>();

  SignupFormBloc() : super(autoValidate: true) {
    addFieldBlocs(fieldBlocs: [
      tfFName,
      tfEmail,
      tfPassword,
      //  tfDOB,
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
  FutureOr<void> onSubmitting() async {
    MetaProgressHUD.showLoading(text: "creating_account.......");
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: tfEmail.value, password: tfPassword.value);
      print(userCredential);
      await addUser();
      MetaAlert.showSuccessAlert(
          message: "registration_successful_login_to_continue");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("Password Provided is too Weak");
        MetaAlert.showSuccessAlert(message: "password_entered_is_too_weak");
      } else if (e.code == 'email-already-in-use') {
        print("Account Already exists");
        MetaAlert.showSuccessAlert(message: "email_account_already_exists");
        // ScaffoldMessenger.of(context).showSnackBar(
      }
    } finally {
      MetaProgressHUD.dismiss();
    }
  }

  addUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");

    Map<String, dynamic> data = {
      "id": uid,
      "name": tfFName.value,
      "email": tfEmail.value,
      "mobile": "",
      "photoUrl": "",
      "last_login": DateTime.now().toString(),
    };

    data['status'] = 1;
    data['plan_details'] = "basic";
    data['reg_date'] = DateTime.now().toString();

    await ref.set(data).then((_) {
      print(" Data saved successfully!");
    }).catchError((error) {
      print(error);
    });

    return;
  }
}
