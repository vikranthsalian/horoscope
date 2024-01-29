import 'package:bloc/bloc.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoggedIn(loginResponse: UserData()));

  UserData getLoginResponse() {
    UserData LoginResponse = UserData();
    if (state is LoggedIn) {
      final current = state as LoggedIn;
      return current.loginResponse;
    }
    return LoginResponse;
  }

  setLoginResponse(UserData LoginResponse) {
    //  if(state is LoggedIn) {
    emit(LoggedIn(loginResponse: LoginResponse));
    //   }
  }
}
