import 'dart:async';

import 'package:adithya_horoscope/domain/model/response.dart';
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
    Map<String, dynamic> data = {
      "email": tfPassword.value,
      "password": tfPassword.value
    };
  }
}
