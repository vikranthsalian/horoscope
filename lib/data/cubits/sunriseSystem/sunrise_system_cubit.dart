import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sunrise_system_state.dart';

class SunsriseSystemCubit extends Cubit<SunsriseSystemState> {
  SunsriseSystemCubit() : super(SunsriseSystemSet(sunriseSytem: 0));

  int getSunsriseSystem() {
    int sunrise = 0;
    if (state is SunsriseSystemSet) {
      final current = state as SunsriseSystemSet;
      return current.sunriseSytem;
    }
    return sunrise;
  }

  setSunsriseSystem(int sunrise) {
    if (state is SunsriseSystemSet) {
      MetaHiveConfig().putHive(StringConstants.sunriseSystem, sunrise);
      emit(SunsriseSystemSet(sunriseSytem: sunrise));
    }
  }
}
