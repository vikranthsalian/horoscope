import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/planet_model.dart';

class HoroscopeModel {
  String? name;
  DateTime? dateTime;
  String? dob;
  String? place;
  String? tob;
  double? tiz;
  double? longitude;
  double? latitude;
  int? kalidin;
  int? lagnaPlace;
  double? khandashesh;
  double? khandashesh_1hr;
  double? ayanams;
  double? raviValue;
  double? chandraValue;
  double? kujaValue;
  double? kujaValue_1hr;
  double? budhaValue;
  double? budhaValue_1hr;
  double? guruValue;
  double? guruValue_1hr;
  double? sukraValue;
  double? sukraValue_1hr;
  double? saniValue;
  double? saniValue_1hr;
  double? rahuValue;
  double? kt;
  double? ketuValue;
  double? sunriseValue;
  double? sunsetValue;
  double? dinamanaValue;
  double? lagnaValue;
  double? dasamaValue;
  double? mandiValue;
  List<Map<String, int>>? rasiKundliValues;
  List<PlanetModel>? grahaSputhaValues;

  String get getLongitude {
    return HoroScopeUtils().getMetaDecimalToDegree(longitude!);
  }

  String get getLatitude {
    return HoroScopeUtils().getMetaDecimalToDegree(latitude!);
  }

  String get getSunrise {
    return HoroScopeUtils().getMetaDecimalToDegree(sunriseValue!);
  }

  String get getSunset {
    return HoroScopeUtils().getMetaDecimalToDegree(sunsetValue!);
  }

  String get getTimezone {
    return dateTime!.timeZoneOffset.inHours.toString() +
        "." +
        dateTime!.timeZoneOffset.abs().inMinutes.toString();
  }

  HoroscopeModel(
      {required this.name,
      required this.dateTime,
      required this.lagnaPlace,
      required this.dob,
      required this.tiz,
      required this.tob,
      required this.longitude,
      required this.latitude,
      required this.place,
      required this.kalidin,
      required this.khandashesh,
      required this.khandashesh_1hr,
      required this.ayanams,
      required this.raviValue,
      required this.chandraValue,
      required this.kujaValue,
      required this.kujaValue_1hr,
      required this.budhaValue,
      required this.budhaValue_1hr,
      required this.guruValue,
      required this.guruValue_1hr,
      required this.sukraValue,
      required this.sukraValue_1hr,
      required this.saniValue,
      required this.saniValue_1hr,
      required this.rahuValue,
      required this.kt,
      required this.ketuValue,
      required this.sunriseValue,
      required this.sunsetValue,
      required this.dinamanaValue,
      required this.lagnaValue,
      required this.dasamaValue,
      required this.mandiValue,
      required this.rasiKundliValues,
      required this.grahaSputhaValues});
}
