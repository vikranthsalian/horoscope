import 'dart:async';

import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/data/cubits/kundliType/kundli_type_cubit.dart';
import 'package:adithya_horoscope/data/cubits/sunriseSystem/sunrise_system_cubit.dart';
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

  SettingsFormBloc() : super(autoValidate: true, isLoading: true) {
    addFieldBlocs(fieldBlocs: [tfLanguage, tfSunriseSystem, tfKundliType]);
  }

  static String? emptyValidator(dynamic value) {
    if (value.isEmpty) {
      return "field_cannot_be_empty";
    }
    return null;
  }

  @override
  FutureOr<void> onLoading() async {
    try {
      int? kundliType = globalContext.read<KundliTypeCubit>().getKundliType();
      if (kundliType != null) {
        if (kundliType == 0) {
          kundliID.updateValue("0");
          tfKundliType.updateValue("south_kundli");
        } else if (kundliType == 1) {
          kundliID.updateValue("1");
          tfKundliType.updateValue("north_kundli");
        }
      }

      print(tfKundliType.value);
    } catch (e) {
      print(e);
    }

    try {
      int? sunrise =
          globalContext.read<SunsriseSystemCubit>().getSunsriseSystem();
      print(sunrise);
      if (sunrise != null) {
        if (sunrise == 0) {
          systemId.updateValue("0");
          tfSunriseSystem.updateValue("center_limb");
        } else if (sunrise == 1) {
          systemId.updateValue("1");
          tfSunriseSystem.updateValue("upper_limb");
        }
      }
      print(tfSunriseSystem.value);
    } catch (e) {
      print(e);
    }

    emitLoaded();
  }

  @override
  FutureOr<void> onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
  }
}
