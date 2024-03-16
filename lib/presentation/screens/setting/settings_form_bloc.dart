import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SettingsFormBloc extends FormBloc<String, String> {
  final tfLanguage =
      TextFieldBloc(validators: [emptyValidator], initialValue: "english");
  final tfKundliType =
      TextFieldBloc(validators: [emptyValidator], initialValue: "south_kundli");
  final tfSunriseSystem =
      TextFieldBloc(validators: [emptyValidator], initialValue: "center_limb");
  final languageID = TextFieldBloc(initialValue: "0");
  final kundliID = TextFieldBloc(initialValue: "0");
  final systemId = TextFieldBloc(initialValue: "0");

  SettingsFormBloc() : super(autoValidate: true) {
    addFieldBlocs(fieldBlocs: [tfLanguage, tfSunriseSystem, tfKundliType]);
  }

  static String? emptyValidator(dynamic value) {
    if (value.isEmpty) {
      return "field_cannot_be_empty";
    }
    return null;
  }

  @override
  FutureOr<void> onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
  }
}
