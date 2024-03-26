import 'dart:async';

import 'package:adithya_horoscope/domain/model/response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SignupFormBloc extends FormBloc<String, String> {
  final tfFName = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final tfMobile = TextFieldBloc(
      validators: [emptyValidator, mobileValidator], initialValue: "");
  final tfPassword =
      TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final tfDOB = TextFieldBloc(validators: [emptyValidator], initialValue: "");
  final dataModel = SelectFieldBloc<MetaResponse, String>();

  SignupFormBloc() : super(autoValidate: true) {
    addFieldBlocs(fieldBlocs: [
      tfFName,
      tfMobile,
      tfPassword,
      tfDOB,
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
    // Map<String, dynamic> data = {
    //   "email": tfPassword.value,
    //   "password": tfPassword.value
    // };

    var acs = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
        url: 'https://www.example.com/finishSignUp?cartId=1234',
        // This must be true
        handleCodeInApp: true,
        iOSBundleId: 'com.example.ios',
        androidPackageName: 'creative.thief.adithya_horoscope',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '12');

    var emailAuth = 'vikkysalian@gmail.com';
    FirebaseAuth.instance
        .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs)
        .catchError(
            (onError) => print('Error sending email verification $onError'))
        .then((value) => print('Successfully sent email verification'));
  }
}
