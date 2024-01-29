import 'dart:async';

import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/core/injector/injector.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/usecase/auth_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final tfUsername = TextFieldBloc(validators: [emptyValidator]);
  final tfPassword = TextFieldBloc(validators: [emptyValidator]);

  final dataModel = SelectFieldBloc<UserData, String>();
  final submitted = BooleanFieldBloc<bool>();
  final keepLoggedIn = SelectFieldBloc<bool, String>(initialValue: false);
  final loggedIn = BooleanFieldBloc<bool>(initialValue: false);
  final toggle = BooleanFieldBloc<bool>(initialValue: false);
  final isWithdraw = BooleanFieldBloc(initialValue: false);

  LoginFormBloc() : super(autoValidate: true) {
    addFieldBlocs(fieldBlocs: [
      tfUsername,
      tfPassword,
    ]);
  }

  static String? emptyValidator(dynamic value) {
    if (value.isEmpty) {
      return "fieldCannotEmpty".tr();
    }
    return null;
  }

  @override
  FutureOr<void> onSubmitting() async {
    Map<String, dynamic> data = {
      "email": tfUsername.value,
      "password": tfPassword.value
    };

    try {
      UserModel? userModel =
          await Injector.resolve<AuthUseCase>().userLogin(data);

      if (userModel.isSuccess!) {
        MetaHiveConfig().putHive(StringConstants.accessToken, userModel.token);
        MetaHiveConfig().putHive(StringConstants.currency, "Won");

        UserData userData = userModel.data as UserData;

        MetaHiveConfig().putHive(StringConstants.userId, userData.id);
        MetaHiveConfig().putHive(StringConstants.userData, userData);
        MetaHiveConfig().putHive(StringConstants.loggedIn, true);
        MetaHiveConfig()
            .putHive(StringConstants.keepLoggedIn, keepLoggedIn.value ?? false);

        dataModel.updateValue(userData);
        submitted.updateValue(true);
        emitSuccess(canSubmitAgain: false);
      } else {
        if (userModel.statusCode == 300) {
          isWithdraw.updateValue(true);
        } else {
          isWithdraw.updateValue(false);
        }
        submitted.updateValue(false);
        emitSuccess(canSubmitAgain: true);
      }
    } catch (e) {
      print(e);
    } finally {
      if (!submitted.value) {
        emitSuccess(canSubmitAgain: true);
      }
    }
  }
}
