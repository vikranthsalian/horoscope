class User {
  String? uniqueID = "";
  String? userID = "";
  String? code = "";
  String? name = "";
  String? date = "";
  String? createdData = "";
  String? time = "";
  String? place = "";
  double? timezone = 0;
  double? latitude = 0;
  double? longitude = 0;
  bool? selected = false;

  User(
      {this.code,
      this.userID,
      this.name,
      this.uniqueID,
      this.date,
      this.createdData,
      this.time,
      this.place,
      this.timezone,
      this.latitude,
      this.longitude,
      this.selected});

  //  User(String code, String name, bool selected) {
  //   this.code = code;
  //   this.name = name;
  //   this.selected = selected;
  // }

  User.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    uniqueID = json['uniqueID'];
    code = json['code'];
    name = json['name'];
    date = json['date'];
    createdData = json['createdData'];
    place = json['place'];
    time = json['time'];
    timezone = json['timezone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userID'] = userID;
    data['uniqueID'] = uniqueID;
    data['code'] = code;
    data['name'] = name;
    data['time'] = time;
    data['createdData'] = createdData;
    data['date'] = date;
    data['place'] = place;
    data['timezone'] = timezone;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['selected'] = selected;
    return data;
  }

  /**
   * @return the latitude
   */
  double getLatitude() {
    return latitude!;
  }

  String getFormatedLatitude() {
    return convertDecimalToDegree(latitude!, " S", " N");
    //return convertLatLng(latitude!, true);
  }

  String getFormatedLongitude() {
    return convertDecimalToDegree(longitude!, " W", " E");
    // return convertLatLng(latitude!, false);
  }

  /**
   * @param latitude the latitude to set
   */
  void setLatitude(double latitude) {
    this.latitude = latitude;
  }

  /**
   * @return the date
   */
  String getDate() {
    return date!;
  }

  /**
   * @param date the date to set
   */
  void setDate(String date) {
    this.date = date;
  }

  /**
   * @return the time
   */
  String getTime() {
    return time!;
  }

  /**
   * @param time the time to set
   */
  void setTime(String time) {
    this.time = time;
  }

  /**
   * @return the place
   */
  String getPlace() {
    return place!;
  }

  /**
   * @param place the place to set
   */
  void setPlace(String place) {
    this.place = place;
  }

  /**
   * @return the timezone
   */
  double getTimezone() {
    return timezone!;
  }

  /**
   * returns formated time zone value
   * @param formated
   * @return
   */
  String getFormatedTimezone() {
    double whole_number = timezone!;
    //  double dec_part = BigDecimal.valueOf(whole_number).divideAndRemainder(BigDecimal.ONE)[1].floatValue();
    double dec_part = (whole_number % 1).toDouble();
    if (dec_part < 0) {
      dec_part = -(dec_part);
    }
    String _hr = int.parse(whole_number.toString()).toString();
    String _min = int.parse((dec_part * 60).toString()).toString();

    _hr = int.parse(_hr) > 0 ? "+ " + _hr : _hr;
    return _hr + ":" + _min;
  }

  /**
   * @param timezone the timezone to set
   */
  void setTimezone(double timezone) {
    this.timezone = timezone;
  }

  /**
   * @return the longitude
   */
  double getLongitude() {
    return longitude!;
  }

  /**
   * @param longitude the longitude to set
   */
  void setLongitude(double longitude) {
    this.longitude = longitude;
  }

  String convertLatLng(double decimal, bool isLat) {
    String degree = "${decimal.toString().split(".")[0]}°";
    double minutesBeforeConversion =
        double.parse("0.${decimal.toString().split(".")[1]}");
    String minutes =
        "${(minutesBeforeConversion * 60).toString().split('.')[0]}'";
    double secondsBeforeConversion = double.parse(
        "0.${(minutesBeforeConversion * 60).toString().split('.')[1]}");
    String seconds =
        '${double.parse((secondsBeforeConversion * 60).toString()).toStringAsFixed(2)}" ';
    String dmsOutput =
        "$degree    $minutes    $seconds    ${isLat ? decimal > 0 ? 'N' : 'S' : decimal > 0 ? 'E' : 'w'}";
    return dmsOutput;
  }

  String convertDecimalToDegree(
      double value, String direction1, String direction2) {
    double whole_number = value;
    // double dec_part = BigDecimal.valueOf(whole_number).divideAndRemainder(BigDecimal.ONE)[1].floatValue();
    double dec_part = (whole_number % 1).toDouble();

    if (dec_part < 0) {
      dec_part = -(dec_part);
    }

    int minutes = (dec_part * 60).floor(); // 47
    double dec_part2 = ((dec_part * 60) % 1).toDouble();

    if (dec_part2 < 0) {
      dec_part2 = -(dec_part2);
    }

    int decC = (dec_part2 * 60).round();

    int temp_hr = whole_number.floor();
    int temp_min = minutes;
    int temp_sec = decC;
    String lat_direction = "";
    if (temp_hr < 0) {
      temp_hr = -(temp_hr); //make it positive num
      lat_direction = direction1;
    } else {
      lat_direction = direction2;
    }
    return temp_hr.toString() +
        "\u00B0 " +
        temp_min.toString() +
        "'" +
        temp_sec.toString() +
        '"' +
        lat_direction;
  }

  String getCode() {
    return code!;
  }

  void setCode(String code) {
    this.code = code;
  }

  String getName() {
    return name!;
  }

  void setName(String name) {
    this.name = name;
  }

  bool isSelected() {
    return selected!;
  }

  void setSelected(bool selected) {
    this.selected = selected;
  }
}
