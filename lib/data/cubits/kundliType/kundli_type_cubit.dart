import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'kundli_type_state.dart';

class KundliTypeCubit extends Cubit<KundliTypeState> {
  KundliTypeCubit() : super(KundliTypeSet(kundliType: getKundliLocal()));

  int getKundliType() {
    int kundliType = 0;
    if (state is KundliTypeSet) {
      final current = state as KundliTypeSet;
      return current.kundliType;
    }
    return kundliType;
  }

  setKundliType(int type) {
    if (state is KundliTypeSet) {
      MetaHiveConfig().putHive(StringConstants.kundliType, type);
      emit(KundliTypeSet(kundliType: type));
    }
  }

  static getKundliLocal() {
    int? kundli = MetaHiveConfig().getHive(StringConstants.kundliType);
    if (kundli != null) {
      return kundli;
    }
    return 0;
  }
}
