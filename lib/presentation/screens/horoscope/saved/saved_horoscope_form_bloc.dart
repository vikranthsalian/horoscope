import 'dart:async';

import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/model/user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SavedHoroScopeFormBloc extends FormBloc<String, String> {
  final isLoading = BooleanFieldBloc(initialValue: true);
  final dataModel = SelectFieldBloc<List<User>, String>();

  SavedHoroScopeFormBloc() : super(autoValidate: true, isLoading: true) {
    addFieldBlocs(fieldBlocs: []);
  }

  @override
  FutureOr<void> onLoading() async {
    UserData userData = globalContext.read<LoginCubit>().getLoginResponse();
    DatabaseReference ref = FirebaseDatabase.instance.ref('horoscope_details');
    List<User> list = [];
    emitLoaded();
    ref.onValue.listen((DatabaseEvent event) {
      isLoading.updateValue(true);
      Map<dynamic, dynamic>? receivedData =
          event.snapshot.value as Map<dynamic, dynamic>?;
      print(userData.id);
      if (receivedData != null) {
        list.clear(); // Clear the previous list before updating
        receivedData.forEach((key, value) {
          print(value);
          Map<String, dynamic> data = value.cast<String, dynamic>();
          if (data['userID'].toString() == userData.id) {
            list.add(User.fromJson(data));
          }
        });
        print("list.length");
        print(list.length);
        dataModel.updateValue(list);
      }
      isLoading.updateValue(false);
    });
  }

  @override
  FutureOr<void> onSubmitting() async {
    emitSuccess(canSubmitAgain: false);
  }
}
