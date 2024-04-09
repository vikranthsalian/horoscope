import 'dart:async';

import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/user.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PrashnaFormBloc extends FormBloc<String, String> {
  final feature = SelectFieldBloc(initialValue: 0);

  final showLoading = BooleanFieldBloc<bool>(initialValue: true);
  final dataModel = SelectFieldBloc<HoroscopeModel, String>();
  final inputModel = SelectFieldBloc<User, String>();

  PrashnaFormBloc() : super(autoValidate: true, isLoading: true) {
    addFieldBlocs(fieldBlocs: [feature]);
  }

  @override
  FutureOr<void> onLoading() async {
    showLoading.updateValue(true);

    HoroscopeModel model = await HoroScopeUtils().calculate(inputModel.value!);

    dataModel.updateValue(model);
    showLoading.updateValue(false);
    emitLoaded();
  }

  @override
  FutureOr<void> onSubmitting() async {}
}
