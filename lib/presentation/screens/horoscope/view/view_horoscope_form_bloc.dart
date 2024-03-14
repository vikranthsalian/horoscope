import 'dart:async';

import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/kundli_model.dart';
import 'package:adithya_horoscope/domain/model/user.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ViewHoroScopeFormBloc extends FormBloc<String, String> {
  final feature = SelectFieldBloc(initialValue: 0);
  List<KundliModel> kundliList = [
    KundliModel(id: 11, data: []),
    KundliModel(id: 0, data: []),
    KundliModel(id: 1, data: []),
    KundliModel(id: 2, data: []),
    KundliModel(id: 10, data: []),
    KundliModel(id: 99, data: []),
    KundliModel(id: 99, data: []),
    KundliModel(id: 3, data: []),
    KundliModel(id: 9, data: []),
    KundliModel(id: 99, data: []),
    KundliModel(id: 99, data: []),
    KundliModel(id: 4, data: []),
    KundliModel(id: 8, data: []),
    KundliModel(id: 7, data: []),
    KundliModel(id: 6, data: []),
    KundliModel(id: 5, data: []),
  ];

  final showLoading = BooleanFieldBloc<bool>(initialValue: true);
  final dataModel = SelectFieldBloc<HoroscopeModel, String>();

  ViewHoroScopeFormBloc() : super(autoValidate: true, isLoading: true) {
    addFieldBlocs(fieldBlocs: [feature]);
  }

  @override
  FutureOr<void> onLoading() async {
    showLoading.updateValue(true);
    User user = User(
        name: "Vikranth",
        place: "Mangalore",
        // latitude: 12.8666667,
        // longitude: 74.88333333333334,
        latitude: 13.33333611,
        longitude: 74.75000278,
        time: "12:45",
        date: "11-03-1995");
    HoroscopeModel model = await HoroScopeUtils().calculate(user);
    print("bak");
    dataModel.updateValue(model);
    showLoading.updateValue(false);
    emitLoaded();
  }

  @override
  FutureOr<void> onSubmitting() async {
    Map<String, dynamic> data = {
      // "email": tfPassword.value,
      // "password": tfPassword.value
    };

    // MetaResponse? response =
    //     await Injector.resolve<AuthUseCase>().createMembership(data);
    // if (response.isSuccess!) {
    //   dataModel.updateValue(response);
    //   emitSuccess(canSubmitAgain: false);
    // } else {
    //   emitSuccess(canSubmitAgain: false, successResponse: "Please try again.");
    // }
  }
}
