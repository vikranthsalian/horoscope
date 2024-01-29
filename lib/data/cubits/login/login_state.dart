part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoggedIn extends LoginState {
  final UserData loginResponse;
  LoggedIn({required this.loginResponse});
}