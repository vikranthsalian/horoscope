import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageSet(lang: "en"));

  String getLanguage() {
    String language = "en";
    if (state is LanguageSet) {
      final current = state as LanguageSet;
      return current.lang;
    }
    return language;
  }

  setLanguage(String language) {
    if (state is LanguageSet) {
      MetaHiveConfig().putHive(StringConstants.language, language);
      emit(LanguageSet(lang: language));
    }
  }
}
