import 'dart:async';

import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/user.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ViewHoroScopeFormBloc extends FormBloc<String, String> {
  final feature = SelectFieldBloc(initialValue: 0);

  final showLoading = BooleanFieldBloc<bool>(initialValue: true);
  final dataModel = SelectFieldBloc<HoroscopeModel, String>();
  final inputModel = SelectFieldBloc<User, String>();

  ViewHoroScopeFormBloc() : super(autoValidate: true, isLoading: true) {
    addFieldBlocs(fieldBlocs: [feature]);
  }

  @override
  FutureOr<void> onLoading() async {
    showLoading.updateValue(true);
    print(inputModel.value!.toJson());
    // User user = User(
    //     name: "Vikranth",
    //     place: "Mangalore",
    //     // latitude: 12.8666667,
    //     // longitude: 74.88333333333334,
    //     latitude: 13.33333611,
    //     longitude: 74.75000278,
    //     time: "12:45",
    //     date: "11-03-1995");
    HoroscopeModel model = await HoroScopeUtils().calculate(inputModel.value!);
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
