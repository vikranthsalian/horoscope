import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MetaHiveConfig {
  factory MetaHiveConfig() => _singleton;

  MetaHiveConfig._internal();

  static final MetaHiveConfig _singleton = MetaHiveConfig._internal();

  String hiveName = StringConstants.hiveApp;

  initConfig() async {
    await Hive.initFlutter();
    Hive.registerAdapter<UserData>(UserDataAdapter());
    await Hive.openBox(hiveName);
    return;
  }

  getHive(String key) {
    return Hive.box(hiveName).get(key);
  }

  putHive(String key, data) {
    return Hive.box(hiveName).put(key, data);
  }

  deleteHive() {
    Hive.box(hiveName).clear();
  }
}
