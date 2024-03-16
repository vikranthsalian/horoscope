part of 'sunrise_system_cubit.dart';

@immutable
abstract class SunsriseSystemState {}

class SunsriseSystemInitial extends SunsriseSystemState {}

class SunsriseSystemSet extends SunsriseSystemState {
  final int sunriseSytem;
  SunsriseSystemSet({required this.sunriseSytem});
}
