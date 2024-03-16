part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageSet extends LanguageState {
  final String lang;
  LanguageSet({required this.lang});
}
