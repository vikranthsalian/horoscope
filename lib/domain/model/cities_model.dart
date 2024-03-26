class CitiesModel {
  String? city;
  dynamic? latDeg;
  dynamic? latMin;
  String? latDir;
  dynamic? longDeg;
  dynamic? longMin;
  String? longDir;
  dynamic? tZoneHour;
  dynamic? tZoneMin;

  CitiesModel(
      {this.city,
      this.latDeg,
      this.latMin,
      this.latDir,
      this.longDeg,
      this.longMin,
      this.longDir,
      this.tZoneHour,
      this.tZoneMin});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    city = json['City'];
    latDeg = json['Lat_Deg'];
    latMin = json['Lat_Min'];
    latDir = json['Lat_Dir'];
    longDeg = json['Long_Deg'];
    longMin = json['Long_Min'];
    longDir = json['Long_Dir'];
    tZoneHour = json['TZone_Hour'];
    tZoneMin = json['TZone_Min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['City'] = this.city;
    data['Lat_Deg'] = this.latDeg;
    data['Lat_Min'] = this.latMin;
    data['Lat_Dir'] = this.latDir;
    data['Long_Deg'] = this.longDeg;
    data['Long_Min'] = this.longMin;
    data['Long_Dir'] = this.longDir;
    data['TZone_Hour'] = this.tZoneHour;
    data['TZone_Min'] = this.tZoneMin;
    return data;
  }

  String get timeZoneLiteral {
    return "+$tZoneHour\u00B0 $tZoneMin' ";
  }

  String get longitudeLiteral {
    return "$longDeg\u00B0 $longMin' $longDir";
    // + '00" '
  }

  String get latitudeLiteral {
    return "$latDeg\u00B0 $latMin' $latDir";
    // + '00" '
  }
}
