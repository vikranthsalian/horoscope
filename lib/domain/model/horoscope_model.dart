import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/planet_model.dart';
import 'package:intl/intl.dart';

class HoroscopeModel {
  String? name;
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

  DateTime get getDateTime {
    DateTime dateTime = DateFormat("dd-MM-yyyy").parse(dob!);
    return dateTime;
  }

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
    return getDateTime.timeZoneOffset.inHours.toString() +
        "." +
        getDateTime.timeZoneOffset.abs().inMinutes.toString();
  }

  HoroscopeModel(
      {required this.name,
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

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data ={};
  //   data['name'] = name;
  //   data['lagnaPlace'] = lagnaPlace;
  //   data['dob'] = dob;
  //   data['tiz'] = tiz;
  //   data['tob'] = tob;
  //   data['longitude'] =longitude ;
  //   data['latitude'] = ;
  //   data['place'] = ;
  //   data['kalidin'] = ;
  //   data['khandashesh'] = ;
  //   data['khandashesh_1hr'] = ;
  //   data['ayanams'] = ;
  //   data['raviValue'] = ;
  //   data['chandraValue'] = ;
  //   data['kujaValue'] = ;
  //   data['kujaValue_1hr'] = ;
  //   data['budhaValue'] = ;
  //   data['budhaValue_1hr'] = ;
  //   data['guruValue'] = ;
  //   data['guruValue_1hr'] = ;
  //   data['sukraValue'] = ;
  //   data['sukraValue_1hr'] = ;
  //   data['saniValue'] = ;
  //   data['saniValue_1hr'] = ;
  //   data['rahuValue'] = ;
  //   data['kt'] = ;
  //   data['ketuValue'] = ;
  //   data['sunriseValue'] = ;
  //   data['sunsetValue'] = ;
  //   data['dinamanaValue'] = ;
  //   data['lagnaValue'] = ;
  //   data['dasamaValue'] = ;
  //   data['mandiValue'] = ;
  //   data['rasiKundliValues'] = ;
  //   data['grahaSputhaValues'] = ;
  //   if (err != null) {
  //     data['err'] = err!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
