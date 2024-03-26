import 'dart:math' as Math;

import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/utils/calculations/my_data.dart';
import 'package:adithya_horoscope/data/cubits/sunriseSystem/sunrise_system_cubit.dart';
import 'package:adithya_horoscope/domain/model/bhava_sandhi_model.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/planet_model.dart';
import 'package:adithya_horoscope/domain/model/shadvarga_model.dart';
import 'package:adithya_horoscope/domain/model/user.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

class HoroScopeUtils {
  final int CenterLimb_INDEX = 0;

  int kalidin = 0;
  double khandashesh = 0;
  double khandashesh_1hr = 0;
  double ayanams = 0;
  double raviValue = 0;
  double chandraValue = 0;
  double kujaValue = 0;
  double kujaValue_1hr = 0;
  double budhaValue = 0;
  double budhaValue_1hr = 0;
  double guruValue = 0;
  double guruValue_1hr = 0;
  double sukraValue = 0;
  double sukraValue_1hr = 0;
  double saniValue = 0;
  double saniValue_1hr = 0;
  double rahuValue = 0;
  double kt = 0;
  double ketuValue = 0;
  double sunriseValue = 0;
  double sunsetValue = 0;
  double dinamanaValue = 0;
  double lagnaValue = 0;
  double dasamaValue = 0;
  double mandiValue = 0;

  int lagnaPlace = 0;

  double mph = 0.0,
      mkr = 0.0,
      smkrn = 0.0,
      rkr = 0.0,
      mJup = 0.0,
      mSat = 0.0,
      rmph = 0.0,
      rmk = 0.0,
      rvm = 0.0;
  int dd = 0;
  int mm = 0;
  int yyyy = 0;
  double longitude = 0.0;
  int th = 0;
  int tm = 0;
  double timeZone = 0.0;
  double latitude = 0.0;
  double timeOfBirth = 0.0;

  late User mUser;

  List<String> grahaSputhaValues = [];
  List<Map<String, int>> rasiKundliValues = [];

  late MyData data;

  /**
   * @return the grahaSputhaValues
   */
  List<String> getGrahasPuthaValues() {
    return grahaSputhaValues;
  }

  DateTime? dateTime;
  /**
   * @return the grahaSputhaValues
   */
  List<Map<String, int>> getRasiKundliValues() {
    return rasiKundliValues;
  }

  int sunRise = 0;
  //int sunRise = MyConfig.getSunriseSystem();

  calculate(User user) {
    this.data = MyData();
    sunRise = globalContext.read<SunsriseSystemCubit>().getSunsriseSystem();
    print("=================> Loaded Sunrise System");
    print(sunRise);

    mUser = user;
    getInputs();

    kalidin = kalidina(dd, mm, yyyy); //(26, 04, 2013)
    khandashesh = Khandashesha(kalidin, th, tm, timeZone);
    // //khandashesh_1hr = Khandashesha(kalidin, (th+1)%24, tm, timeZone);
    khandashesh_1hr = Khandashesha(kalidin, (th + 1), tm, timeZone);
    ayanams = Ayanamsa(kalidin);
    raviValue = ravi(khandashesh);
    // //chandraValue = Chandra(khandashesh);
    chandraValue = ChandraM(khandashesh, ayanams);
    kujaValue = Kuja(khandashesh);
    kujaValue_1hr = Kuja(khandashesh_1hr);
    budhaValue = Budha(khandashesh);
    budhaValue_1hr = Budha(khandashesh_1hr);
    guruValue = Guru(khandashesh, ayanams);
    guruValue_1hr = Guru(khandashesh_1hr, ayanams);
    sukraValue = Sukra(khandashesh);
    sukraValue_1hr = Sukra(khandashesh_1hr);
    saniValue = Sani(khandashesh, ayanams);
    saniValue_1hr = Sani(khandashesh_1hr, ayanams);
    rahuValue = Rahu(khandashesh);
    kt = rahuValue + 180.0;
    ketuValue = Round360(kt);
    sunriseValue = SunRise(raviValue, ayanams, latitude, longitude, timeZone);
    sunsetValue = SunSet(raviValue, ayanams, latitude, longitude, timeZone);
    dinamanaValue = DinaMana(raviValue, ayanams, latitude, longitude, timeZone);
    lagnaValue =
        Lagna(latitude, longitude, timeZone, kalidin, timeOfBirth, ayanams);
    // lagnaValue = newLagna(latitude, longitude, timeZone, timeOfBirth);
    dasamaValue =
        Dasama(latitude, longitude, timeZone, kalidin, timeOfBirth, ayanams);
    mandiValue = Mandi(latitude, longitude, timeZone, kalidin, timeOfBirth,
        dinamanaValue, sunriseValue, sunsetValue, ayanams);

    //All values populated now calculate Graha Sputha Values
    (List<String>, List<PlanetModel>) datas = calculateGrahasPuthaValues();
    grahaSputhaValues = datas.$1;
    print("---------------------grahaSputhaValues");

    for (var item in grahaSputhaValues) {
      print(item);
    }

    String lgPlace = RDMS(lagnaValue);

    print("lgPlace");
    print(lgPlace);
    lagnaPlace = int.parse(lgPlace.substring(0, 2));

    HoroscopeModel horoscopeModel = HoroscopeModel(
        name: mUser.name,
        lagnaPlace: lagnaPlace,
        tob: mUser.time,
        dob: mUser.date,
        tiz: mUser.timezone,
        place: mUser.place,
        longitude: mUser.longitude,
        latitude: mUser.latitude,
        kalidin: kalidin,
        ayanams: ayanams,
        ketuValue: ketuValue,
        khandashesh: khandashesh,
        budhaValue: budhaValue,
        budhaValue_1hr: budhaValue_1hr,
        khandashesh_1hr: khandashesh_1hr,
        rahuValue: rahuValue,
        raviValue: raviValue,
        chandraValue: chandraValue,
        kujaValue: kujaValue,
        kujaValue_1hr: kujaValue_1hr,
        guruValue: guruValue,
        guruValue_1hr: guruValue_1hr,
        sukraValue: sukraValue,
        sukraValue_1hr: sukraValue_1hr,
        saniValue: saniValue,
        saniValue_1hr: saniValue_1hr,
        kt: kt,
        sunriseValue: sunriseValue,
        sunsetValue: sunsetValue,
        dinamanaValue: dinamanaValue,
        lagnaValue: lagnaValue,
        dasamaValue: dasamaValue,
        mandiValue: mandiValue,
        grahaSputhaValues: datas.$2,
        rasiKundliValues: rasiKundliValues);

    print("----------------------------" +
        "Kalidin " +
        kalidin.toString() +
        "\n " +
        " khandashesh " +
        khandashesh.toString() +
        "\n " +
        " khandashesh_1hr " +
        khandashesh_1hr.toString() +
        "\n " +
        " ayanams " +
        ayanams.toString() +
        "\n " +
        " raviValue " +
        raviValue.toString() +
        "\n " +
        " chandraValue " +
        chandraValue.toString() +
        "\n " +
        " kujaValue " +
        kujaValue.toString() +
        "\n " +
        " kujaValue_1hr " +
        kujaValue_1hr.toString() +
        "\n " +
        " budhaValue " +
        budhaValue.toString() +
        " \n" +
        " budhaValue_1hr " +
        budhaValue_1hr.toString() +
        "\n " +
        " guruValue " +
        guruValue.toString() +
        "\n " +
        " guruValue_1hr " +
        guruValue_1hr.toString() +
        "\n " +
        " sukraValue " +
        sukraValue.toString() +
        "\n " +
        " sukraValue_1hr " +
        sukraValue_1hr.toString() +
        "\n " +
        " saniValue " +
        saniValue.toString() +
        " \n" +
        " kt " +
        kt.toString() +
        "\n " +
        " rahuValue " +
        rahuValue.toString() +
        "\n " +
        " ketuValue " +
        ketuValue.toString() +
        "\n " +
        " sunriseValue " +
        sunriseValue.toString() +
        "\n " +
        " sunsetValue " +
        sunsetValue.toString() +
        "\n " +
        " dinamanaValue " +
        dinamanaValue.toString() +
        "\n " +
        " lagnaValue " +
        lagnaValue.toString() +
        "\n " +
        " dasamaValue " +
        dasamaValue.toString() +
        "\n " +
        " mandiValue " +
        mandiValue.toString() +
        "\n " +
        "---------------------------");

    return horoscopeModel;
  }

  getInputs() {
    initializeDateFormatting('pt_BR', null);
    // DateFormat dateFormat = DateFormat("dd-MM-yyyy").format(date);

    dateTime = DateFormat("dd-MM-yyyy").parse(mUser.getDate());
    //DateTime dateTime = DateTime.parse(mUser.getDate());
    print("dateTime");
    print(dateTime);

    dd = dateTime!.day;
    mm = dateTime!.month;
    yyyy = dateTime!.year;

    latitude = mUser.getLatitude();
    longitude = mUser.getLongitude();
    // mUser.timezone =
    //     double.parse((dateTime!.timeZoneOffset.inMinutes / 60).toString());
    // print(dateTime!.timeZoneOffset.inMinutes / 60);
    timeZone = mUser.timezone!;
    print("================================>: Data Start Input");
    print("Name : " + mUser.getName());
    print("Place : " + mUser.getPlace());
    print("Latitude : " + mUser.getLatitude().toString());
    print("Longitude : " + mUser.getLongitude().toString());
    print("date : " + mUser.getDate());
    print("time : " + mUser.getTime());
    print("timeZone : " + timeZone.toString());
    print("================================>: Data End Input");
    // this is not working so split the time
    //	    Calendar calTime = Calendar.getInstance();
    //	    SimpleDateFormat sdf2 = new SimpleDateFormat("HH:MM");
    //	    try {
    //	    	calTime.setTime(sdf2.parse(user.getTime()));
    //		} catch (ParseException e) {
    //			// TODO Auto-generated catch block
    //			e.printStackTrace();
    //		}
    //

    //	    th = calTime.get(Calendar.HOUR_OF_DAY);
    //	    tm = calTime.get(Calendar.MINUTE);

    List<String> time = mUser.getTime().split(":");

    th = int.parse(time[0]);
    tm = int.parse(time[1]);

    timeOfBirth = th + (tm / 60.0);
  }

  kalidina(int dd, int mm, int yyyy) {
    List<int> months = [306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275];
    int a, b, c, d, e;

    a = yyyy - 1900;
    if (mm < 3) {
      a = a - 1;
    }
    b = (a / 4).floor(); //changed here Math.floor(a / 4);
    c = months[mm - 1];
    d = a * 365 + b;
    e = d + c + dd + 1826613;
    return e;
  }

  double Round360(double angle1) {
    double angle = angle1 - (angle1 / 360).floor() * 360;
    // here changed  Math.floor(angle1 / 360) * 360;
    if (angle < 0) {
      angle = angle + 360;
    }
    return angle;
  }

  double ATan2(double x, double y) {
    return Math.atan2(x, y);
  }

  double SinD(double angle) {
    return Math.sin(angle * Math.pi / 180);
  }

  double CosD(double angle) {
    return Math.cos(angle * Math.pi / 180);
  }

  double ASinD(double angle) {
    return Math.asin(angle) * 180 / Math.pi;
  }

  double TanD(double angle) {
    return Math.tan(angle * Math.pi / 180);
  }

  double ATanD(double angle) {
    return Math.atan(angle) * 180 / Math.pi;
  }

  double Khandashesha(int Kali, int th, int tm, double tz) {
    // 1861322 // Kalidina
    // 12 // th
    // 45 // tm
    // 5.5 // tz
    print("=========================================>");
    print("Khandashesha Begining");
    print(Kali);
    print(th);
    print(tm);
    print(tz);
    double a, b;
    a = th + (tm / 60.0);
    b = Kali - 1861618 + (a - tz) / 24.0;
    print("Khandashesha Calculate End");
    print(b);
    print("=========================================>");
    return b;
  }

  void Mandaphala(double cht, double mean, double much, double pmkr) {
    double a, b, c, d, e, f, mk;
    a = 57.29583333333;
    b = a *
        (2 * cht - 0.25 * (cht * cht * cht) + 5.0 / 96.0 * Math.pow(cht, 5));
    c = a * (1.25 * (cht * cht) - (cht * cht * cht * cht) * 11.0 / 24.0);
    d = a * ((cht * cht * cht) * 13.0 / 12.0);
    e = a * ((cht * cht * cht * cht) * 103.0 / 96.0);
    f = a * (Math.pow(cht, 5) * 1097.0 / 960.0);
    mk = mean - much + 180.0;
    mph = SinD(mk) * b +
        SinD(2.0 * mk) * c +
        SinD(3.0 * mk) * d +
        SinD(4.0 * mk) * e +
        SinD(5.0 * mk) * f;
    mkr = pmkr - pmkr * cht * CosD(mph / 2.0 + mk);
  }

  double ravi(double days) {
    double pl, pmean, uccha;
    double e;
    pmean = Round360(days * 0.9856091147 + 256.1413888888889);
    uccha = Round360(days * 0.03185165 / 3600.0 + 79.07055555555556);
    e = 0.016709 - 1.151E-9 * days;
    Mandaphala(e, pmean, uccha, 10000);
    pl = Round360(pmean + mph);
    rmph = mph;
    rmk = Round360(pmean - uccha);
    rkr = mkr;

    return pl;
  }

  double SunRise(double Sun, double ayana, double Lat, double Lon, double TiZ) {
    double a, b, c, d, e;
    a = Sun + 180 + ayana;
    b = SinD(a) * SinD(23.45);
    c = ASinD(b);
    d = TanD(c) * TanD(Lat);
    d = ASinD(d);
    e = (1 - CosD(23.45)) * SinD(a) * CosD(a) / CosD(c);
    e = ASinD(e);
    a = TiZ * 15 - Lon;
    // b = (90 + d - e + a + rmph) / 15.0;
    if (sunRise == CenterLimb_INDEX) //Verify
    {
      b = (90 + d - e + a + rmph) / 15.0;
    } else {
      b = (89.1666667 + d - e + a + rmph) / 15.0;
    }
    return b;
  }

  double SunSet(double Sun, double ayana, double Lat, double Lon, double TiZ) {
    double a, b, c, d, e;
    a = Sun + 180 + ayana;
    b = SinD(a) * SinD(23.45);
    c = ASinD(b);
    d = TanD(c) * TanD(Lat);
    d = ASinD(d);
    e = (1 - CosD(23.45)) * SinD(a) * CosD(a) / CosD(c);
    e = ASinD(e);
    a = TiZ * 15 - Lon;
    // b = (270 - d - e + a + rmph) / 15.0;
    if (sunRise == CenterLimb_INDEX) {
      b = (270 - d - e + a + rmph) / 15.0;
    } else {
      b = (270.833333 - d - e + a + rmph) / 15.0;
    }
    return b;
  }

  double Ayanamsa(int Kali) {
    double sm, Cm, Rm, Am, Nu, Ayn;
    Am = (Kali - 1861984) * 0.0000382531932 + 23.815194444;
    sm = Round360(Kali * 0.9856091147 + 121.3725);
    Cm = Round360(Kali * 13.17635851 + 276.6011111);
    Rm = Round360(Kali * -0.0529921432 + 162.6838889);
    Nu = SinD(sm) * -17.23 -
        SinD(2 * Rm) * -1.32 -
        SinD(2 * Cm) * -0.23 +
        SinD(2 * sm) * 0.21;
    Nu = Nu / 3600.0;
    Ayn = Am + Nu;

    var data = mUser.convertDecimalToDegree(Ayn, 'S', 'N');
    print("Ayanamsa");
    print(data);

    return Ayn;
  }

  //New Chandra calculation for 1.2 version and newer
  double ChandraM(double days, double Ayan) {
    List<int> T45AD = [
      0,
      2,
      2,
      0,
      0,
      0,
      2,
      2,
      2,
      2,
      0,
      1,
      0,
      2,
      0,
      0,
      4,
      0,
      4,
      2,
      2,
      1,
      1,
      2,
      2,
      4,
      2,
      0,
      2,
      2,
      1,
      2,
      0,
      0,
      2,
      2,
      2,
      4,
      0,
      3,
      2,
      4,
      0,
      2,
      2,
      2,
      4,
      0,
      4,
      1,
      2,
      0,
      1,
      3,
      4,
      2,
      0,
      1,
      2,
      2
    ];

    List<int> T45AM = [
      0,
      0,
      0,
      0,
      1,
      0,
      0,
      -1,
      0,
      -1,
      1,
      0,
      1,
      0,
      0,
      0,
      0,
      0,
      0,
      1,
      1,
      0,
      1,
      -1,
      0,
      0,
      0,
      1,
      0,
      -1,
      0,
      -2,
      1,
      2,
      -2,
      0,
      0,
      -1,
      0,
      0,
      1,
      -1,
      2,
      2,
      1,
      -1,
      0,
      0,
      -1,
      0,
      1,
      0,
      1,
      0,
      0,
      -1,
      2,
      1,
      0,
      0
    ];

    List<int> T45AMP = [
      1,
      -1,
      0,
      2,
      0,
      0,
      -2,
      -1,
      1,
      0,
      -1,
      0,
      1,
      0,
      1,
      1,
      -1,
      3,
      -2,
      -1,
      0,
      -1,
      0,
      1,
      2,
      0,
      -3,
      -2,
      -1,
      -2,
      1,
      0,
      2,
      0,
      -1,
      1,
      0,
      -1,
      2,
      -1,
      1,
      -2,
      -1,
      -1,
      -2,
      0,
      1,
      4,
      0,
      -2,
      0,
      2,
      1,
      -2,
      -3,
      2,
      1,
      -1,
      3,
      -1
    ];

    List<int> T45AF = [
      0,
      0,
      0,
      0,
      0,
      2,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      -2,
      2,
      -2,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      2,
      0,
      0,
      0,
      0,
      0,
      0,
      -2,
      2,
      0,
      2,
      0,
      0,
      0,
      0,
      0,
      0,
      -2,
      0,
      0,
      0,
      0,
      -2,
      -2,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      -2
    ];

    List<int> T45AL = [
      6288774,
      1274027,
      658314,
      213618,
      -185116,
      -114332,
      58793,
      57066,
      53322,
      45758,
      -40923,
      -34720,
      -30383,
      15327,
      -12528,
      10980,
      10675,
      10034,
      8548,
      -7888,
      -6766,
      -5163,
      4987,
      4036,
      3994,
      3861,
      3665,
      -2689,
      -2602,
      2390,
      -2348,
      2236,
      -2120,
      -2069,
      2048,
      -1773,
      -1595,
      1215,
      -1110,
      -892,
      -810,
      759,
      -713,
      -700,
      691,
      596,
      549,
      537,
      520,
      -487,
      -399,
      -381,
      351,
      -340,
      330,
      327,
      -323,
      299,
      294,
      0
    ];

    List<int> T45AR = [
      -20905355,
      -3699111,
      -2955968,
      -569925,
      48888,
      -3149,
      246158,
      -152138,
      -170733,
      -204586,
      -129620,
      108743,
      104755,
      10321,
      0,
      79661,
      -34782,
      -23210,
      -21636,
      24208,
      30824,
      -8379,
      -16675,
      -12831,
      -10445,
      -11650,
      14403,
      -7003,
      0,
      10056,
      6322,
      -9884,
      5751,
      0,
      -4950,
      4130,
      0,
      -3958,
      0,
      3258,
      2616,
      -1897,
      -2117,
      2354,
      0,
      0,
      -1423,
      -1117,
      -1571,
      -1739,
      0,
      -4421,
      0,
      0,
      0,
      0,
      1165,
      0,
      0,
      8752
    ];
    double T = 0;
    double T2 = 0;
    double T3 = 0;
    double T4 = 0;
    double LP = 0;
    double D = 0;
    double M = 0;
    double MP = 0;
    double F = 0;
    double A1 = 0;
    double A2 = 0;
    double A3 = 0;
    double E = 0;
    double E2 = 0;
    double Sl = 0;
    double Sr = 0;
    double Sb = 0;
    double mglong = 0;
    double Eterm = 0;
    T = (days - 1461.5) / 36525;
    T2 = T * T;
    T3 = T2 * T;
    T4 = T3 * T;
    //Moons mean longitude L'
    LP = 218.3164477 +
        481267.88123421 * T -
        0.0015786 * T2 +
        T3 / 538841.0 -
        T4 / 65194000.0;
    //Moons mean elongation
    D = 297.8501921 +
        445267.1114034 * T -
        0.0018819 * T2 +
        T3 / 545868.0 -
        T4 / 113065000.0;
    //Suns mean anomaly
    M = 357.5291092 + 35999.0502909 * T - 0.0001536 * T2 + T3 / 24490000.0;
    //Moons mean anomaly M'
    MP = 134.9633964 +
        477198.8675055 * T +
        0.0087414 * T2 +
        T3 / 69699.0 -
        T4 / 14712000.0;
    //Moons argument of latitude
    F = 93.272095 +
        483202.0175233 * T -
        0.0036539 * T2 -
        T3 / 3526000.0 +
        T4 / 863310000.0;

    //Additional arguments
    A1 = 119.75 + 131.849 * T;
    A2 = 53.09 + 479264.29 * T;
    A3 = 313.45 + 481266.484 * T;
    E = 1 - 0.002516 * T - 7.4E-06 * T2;
    E2 = E * E;
    //// Sums of periodic terms from table 45.A And 45.B
    Sl = 0.0;
    Sr = 0.0;
    for (int i = 0; i <= 59; i++) {
      Eterm = 1;
      if (((T45AM[i]).abs() == 1)) Eterm = E;
      if (((T45AM[i]).abs() == 2)) Eterm = E2;
      Sl = Sl +
          T45AL[i] *
              Eterm *
              SinD(Round360(
                  T45AD[i] * D + T45AM[i] * M + T45AMP[i] * MP + T45AF[i] * F));
      Sr = Sr +
          T45AR[i] *
              Eterm *
              CosD(Round360(
                  T45AD[i] * D + T45AM[i] * M + T45AMP[i] * MP + T45AF[i] * F));
    }

    //// Additional additive terms
    Sl = Sl +
        3958 * SinD(Round360(A1)) +
        1962 * SinD(Round360(LP - F)) +
        318 * SinD(Round360(A2));

    //// geocentric longitude, latitude And distance
    mglong = Round360((LP + Sl / 1000000.0) - Ayan);

    return mglong;
  }

  double Parinati(double vvp, double node, double iorb) {
    double a, c, d, e, f;
    a = vvp - node;
    c = SinD(a) * SinD(iorb);
    d = ASinD(c);
    e = (1 - CosD(iorb)) * SinD(a) * CosD(a) / CosD(d);
    f = ASinD(e);
    smkrn = mkr * CosD(d);
    return f;
  }

  double Kuja(double days) {
    double pl, pmean, uccha, an, sgk, prv;
    double b, c;
    pmean = Round360(days * 0.5240328404 + 285.715);
    uccha = Round360(days * 0.0438357 / 3600.0 + 132.1586111111111);
    Mandaphala(0.0933122, pmean, uccha, 15237.0);
    b = pmean + mph;
    an = Round360(days * -0.0616031 / 3600.0 + 25.727777777777778);
    b = b - Parinati(b, an, 1.853667);
    prv = ravi(days);
    sgk = b - prv;
    c = SheeghraPhala(sgk);
    pl = Round360(b - c);
    return pl;
  }

  double SheeghraPhala(double kendra) {
    double kr1, kr2, c, d, e;
    kr1 = smkrn;
    kr2 = rkr;
    if (rkr > smkrn) {
      kr1 = rkr;
      kr2 = smkrn;
    }
    c = (kr1 * kr1) + (kr2 * kr2) + 2.0 * kr1 * kr2 * CosD(kendra);
    d = kr2 * SinD(kendra) / Math.sqrt(c);
    e = ASinD(d);
    return e;
  }

  double Budha(double days) {
    double pl, pmean, uccha, an, sgk, prv;
    double b, c;
    pmean = Round360(days * 4.092338803 + 7.439444444444445);
    uccha = Round360(days * 0.0157185 / 3600.0 + 233.59277777777777);
    Mandaphala(0.20561406, pmean, uccha, 3871);
    b = pmean + mph;
    an = Round360(days * -0.0207771 / 3600.0 + 24.482777777777777);
    b = b - Parinati(b, an, 7);
    prv = ravi(days);
    sgk = b - prv;
    c = SheeghraPhala(sgk);
    pl = Round360(prv + c);
    return pl;
  }

  double Guru(double days, double ayana) {
//		double  pl,pmean,uccha,an,sgk,prv;
//		double  b,c;
//		CorrectMean(days,ayana,Kali);
//		pmean = mJup;
//		uccha = Round360(days * 0.0210864/3600.0 + 170.48052741674115);
//		Mandaphala(0.04833357,pmean,uccha,52028);
//		b = pmean + mph;
//		an = Round360(days * -0.0379941/3600 + 76.63583333333334);
//		b = b - Parinati(b,an,1.308778);
//		prv = ravi(days);
//		sgk = b - prv;
//		c = SheeghraPhala(sgk);
//		pl = Round360(b - c);
//		return pl;

    double d = 0;
    double ecl = 0;
    double pi = 0;
    double deg = 0;
    double node = 0;
    double iorb = 0;
    double ph = 0;
    double pa = 0;
    double ecc = 0;
    double anom = 0;
    double E0 = 0;
    double E1 = 0;
    double E2 = 0;
    double E3 = 0;
    double E4 = 0;
    double E5 = 0;
    double E6 = 0;
    double x = 0;
    double y = 0;
    double z = 0;
    double r = 0;
    double v = 0;
    double xeclip = 0;
    double yeclip = 0;
    double zeclip = 0;
    double lonecl = 0;
    double latecl = 0;
    double Mj = 0;
    double Ms = 0;
    double pert = 0;
    double xh = 0;
    double yh = 0;
    double zh = 0;
    double sph = 0;
    double spa = 0;
    double secc = 0;
    double sanom = 0;
    double slon = 0;
    double ea = 0;
    double lon = 0;
    double xequat = 0;
    double yequat = 0;
    double zequat = 0;
    double xs = 0;
    double ys = 0;
    double xgeo = 0;
    double ygeo = 0;
    double zgeo = 0;
    double xe = 0;
    double ye = 0;
    double ze = 0;
    double rg = 0;
    double RA = 0;
    double Dec = 0;
    double glon = 0;
    d = days - 1460;
    ecl = 23.4393 - 3.563E-07 * d;
    pi = 3.14159265358979;
    deg = 180 / pi;
    node = Round360(100.4542 + 2.76854E-05 * d);
    iorb = 1.303 - 1.557E-07 * d;
    ph = 273.8777 + 1.64505E-05 * d;
    pa = 5.20256;

    ecc = 0.048498 + 4.469E-09 * d;
    anom = Round360(19.895 + 0.0830853001 * d);
    E0 = anom + (180 / pi) * ecc * SinD(anom) * (1 + ecc * CosD(anom));
    E1 = E0 - (E0 - (180 / pi) * ecc * SinD(E0) - anom) / (1 - ecc * CosD(E0));
    E2 = E1 - (E1 - (180 / pi) * ecc * SinD(E1) - anom) / (1 - ecc * CosD(E1));
    E3 = E2 - (E2 - (180 / pi) * ecc * SinD(E2) - anom) / (1 - ecc * CosD(E2));
    E4 = E3 - (E3 - (180 / pi) * ecc * SinD(E3) - anom) / (1 - ecc * CosD(E3));
    E5 = E4 - (E4 - (180 / pi) * ecc * SinD(E4) - anom) / (1 - ecc * CosD(E4));
    E6 = E5 - (E5 - (180 / pi) * ecc * SinD(E5) - anom) / (1 - ecc * CosD(E5));
    x = pa * (CosD(E6) - ecc);
    y = pa * Math.sqrt(1 - ecc * ecc) * SinD(E6);
    r = Math.sqrt(x * x + y * y);
    v = Math.atan2(y, x) * deg;
    xeclip = r *
        (CosD(node) * CosD(v + ph) - SinD(node) * SinD(v + ph) * CosD(iorb));
    yeclip = r *
        (SinD(node) * CosD(v + ph) + CosD(node) * SinD(v + ph) * CosD(iorb));
    zeclip = r * SinD(v + ph) * SinD(iorb);
    lonecl = Math.atan2(yeclip, xeclip) * deg;
    latecl =
        Math.atan2(zeclip, Math.sqrt(xeclip * xeclip + yeclip * yeclip)) * deg;

    Mj = anom;
    Ms = Round360(316.967 + 0.0334442282 * d);
    pert = -0.332 * SinD(2 * Mj - 5 * Ms - 67.6) -
        0.056 * SinD(2 * Mj - 2 * Ms + 21) +
        0.042 * SinD(3 * Mj - 5 * Ms + 21) -
        0.036 * SinD(Mj - 2 * Ms) +
        0.022 * CosD(Mj - Ms) +
        0.023 * SinD(2 * Mj - 3 * Ms + 52) -
        0.016 * SinD(Mj - 5 * Ms - 69);
    lonecl = lonecl + pert;

    xh = r * CosD(lonecl) * CosD(latecl);
    yh = r * SinD(lonecl) * CosD(latecl);
    zh = r * SinD(latecl);

    sph = Round360(282.9404 + 4.70935E-05 * d);
    spa = 1.0;

    secc = 0.016709 - 1.151E-09 * d;
    sanom = Round360(356.047 + 0.9856002585 * d);
    slon = Round360(sph + sanom);
    ea = sanom + (180 / pi) * secc * SinD(sanom) * (1 + secc * CosD(sanom));
    x = CosD(ea) - secc;
    y = SinD(ea) * Math.sqrt(1 - secc * secc);
    r = Math.sqrt(x * x + y * y);
    v = Math.atan2(y, x) * deg;
    lon = Round360(v + sph);
    x = r * CosD(lon);
    y = r * SinD(lon);
    z = 0.0;
    xequat = x;
    yequat = y * CosD(ecl) - 0.0 * SinD(ecl);
    zequat = y * SinD(ecl) + 0.0 * CosD(ecl);
    xs = r * CosD(lon);
    ys = r * SinD(lon);

    xgeo = xh + xs;
    ygeo = yh + ys;
    zgeo = zh;
    xe = xgeo;
    ye = ygeo * CosD(ecl) - zgeo * SinD(ecl);
    ze = ygeo * SinD(ecl) + zgeo * CosD(ecl);
    rg = Math.sqrt(xgeo * xgeo + ygeo * ygeo + zgeo * zgeo);
    RA = Round360(Math.atan2(ye, xe) * deg);
    Dec = Math.atan2(ze, Math.sqrt(xe * xe + ye * ye)) * deg;
    RA = RA / 15;
    glon = Math.atan2(ygeo, xgeo) * deg;
    glon = Round360(glon - ayana);
    return glon;
  }

  void CorrectMean(double days, double ayana, int Kali) {
    double gm, sm, b, c, d, e;
    gm = Round360(days * 0.08309119709 + 249.0716081480736);
    sm = Round360(days * 0.03345965426 + 337.3339768888889);
    b = gm + ayana;
    c = sm + ayana;
    gm = gm - SinD(b - c - 1.15) * 81.0 / 3600.0;
    gm = gm - SinD(b - 2 * c - 13.083) * -132.0 / 3600.0;
    gm = gm - SinD(2 * b - 2 * c - 0.583) * -200.0 / 3600.0;
    gm = gm - SinD(2 * b - 3 * c - 61.567) * -83.0 / 3600.0;
    gm = gm - SinD(3 * b - 5 * c + 56.383) * -162.0 / 3600.0;
    //mJup =gm
    sm = sm - SinD(b - 2 * c - 14.633) * 418.0 / 3600.0;
    sm = sm - SinD(2 * b - 4 * c + 56.867) * 667.0 / 3600.0;
    sm = sm - SinD(3 * c - b + 77.367) * 48.0 / 3600.0;
    d = (Kali - 1701743) * 0.001073666975;
    e = SinD(d);
    mJup = gm + (e * 0.33);
    mSat = sm - (0.8 * e);
  }

  double Sukra(double days) {
    double pl, pmean, uccha, an, sgk, prv;
    double b, c;
    pmean = Round360(days * 1.602130483 + 336.6091666666667);
    uccha = Round360(days * -0.001187 / 3600 + 287.6388888888889);
    Mandaphala(0.00682, pmean, uccha, 7233);
    b = pmean + mph;
    an = Round360(days * -0.0489031 / 3600 + 52.843333333333334);
    b = b - Parinati(b, an, 3.393622);
    prv = ravi(days);
    sgk = b - prv;
    c = SheeghraPhala(sgk);
    pl = Round360(prv + c);
    return pl;
  }

  double Sani(double days, double ayana) {
//		double  pl,pmean,uccha,an,sgk,prv;
//		double  b,c;
//		CorrectMean(days,ayana,Kali);
//		pmean = mSat;
//		uccha = Round360(days * 0.0554313/3600 + 246.79888888888888);
//		Mandaphala(0.0558948,pmean,uccha,95547);
//		b = pmean + mph;
//		an = Round360(days * -0.0515294/3600.0 + 89.79583333333333);
//		b = b - Parinati(b,an,2.492519);
//		prv = ravi(days);
//		sgk = b - prv;
//		c = SheeghraPhala(sgk);
//		pl = Round360(b - c);
//		return pl;

    double d = 0;
    double ecl = 0;
    double pi = 0;
    double deg = 0;
    double node = 0;
    double iorb = 0;
    double ph = 0;
    double pa = 0;
    double ecc = 0;
    double anom = 0;
    double E0 = 0;
    double E1 = 0;
    double E2 = 0;
    double E3 = 0;
    double E4 = 0;
    double E5 = 0;
    double E6 = 0;
    double E7 = 0;
    double E8 = 0;
    double E9 = 0;
    double x = 0;
    double y = 0;
    double z = 0;
    double r = 0;
    double v = 0;
    double xeclip = 0;
    double yeclip = 0;
    double zeclip = 0;
    double lonecl = 0;
    double latecl = 0;
    double Mj = 0;
    double Ms = 0;
    double plong = 0;
    double plat = 0;
    double xh = 0;
    double yh = 0;
    double zh = 0;
    double sph = 0;
    double spa = 0;
    double secc = 0;
    double sanom = 0;
    double slon = 0;
    double ea = 0;
    double lon = 0;
    double xequat = 0;
    double yequat = 0;
    double zequat = 0;
    double xs = 0;
    double ys = 0;
    double xgeo = 0;
    double ygeo = 0;
    double zgeo = 0;
    double xe = 0;
    double ye = 0;
    double ze = 0;
    double rg = 0;
    double RA = 0;
    double Dec = 0;
    double glon = 0;
    d = days - 1460;
    ecl = 23.4393 - 3.563E-07 * d;
    pi = 3.14159265358979;
    deg = 180 / pi;
    node = 113.6634 + 2.3898E-05 * d;
    iorb = 2.4886 - 1.081E-07 * d;
    ph = 339.3939 + 2.97661E-05 * d;
    pa = 9.55475;

    ecc = 0.055546 - 9.499E-09 * d;
    anom = Round360(316.967 + 0.0334442282 * d);
    E0 = anom + (180 / pi) * ecc * SinD(anom) * (1 + ecc * CosD(anom));
    E1 = E0 - (E0 - (180 / pi) * ecc * SinD(E0) - anom) / (1 - ecc * CosD(E0));
    E2 = E1 - (E1 - (180 / pi) * ecc * SinD(E1) - anom) / (1 - ecc * CosD(E1));
    E3 = E2 - (E2 - (180 / pi) * ecc * SinD(E2) - anom) / (1 - ecc * CosD(E2));
    E4 = E3 - (E3 - (180 / pi) * ecc * SinD(E3) - anom) / (1 - ecc * CosD(E3));
    E5 = E4 - (E4 - (180 / pi) * ecc * SinD(E4) - anom) / (1 - ecc * CosD(E4));
    E6 = E5 - (E5 - (180 / pi) * ecc * SinD(E5) - anom) / (1 - ecc * CosD(E5));
    E7 = E6 - (E6 - (180 / pi) * ecc * SinD(E6) - anom) / (1 - ecc * CosD(E6));
    E8 = E7 - (E7 - (180 / pi) * ecc * SinD(E7) - anom) / (1 - ecc * CosD(E7));
    E9 = E8 - (E8 - (180 / pi) * ecc * SinD(E8) - anom) / (1 - ecc * CosD(E8));
    x = pa * (CosD(E9) - ecc);
    y = pa * Math.sqrt(1 - ecc * ecc) * SinD(E9);
    r = Math.sqrt(x * x + y * y);
    v = Math.atan2(y, x) * deg;
    xeclip = r *
        (CosD(node) * CosD(v + ph) - SinD(node) * SinD(v + ph) * CosD(iorb));
    yeclip = r *
        (SinD(node) * CosD(v + ph) + CosD(node) * SinD(v + ph) * CosD(iorb));
    zeclip = r * SinD(v + ph) * SinD(iorb);
    lonecl = Math.atan2(yeclip, xeclip) * deg;
    latecl =
        Math.atan2(zeclip, Math.sqrt(xeclip * xeclip + yeclip * yeclip)) * deg;

    Mj = Round360(19.895 + 0.0830853001 * d);
    Ms = anom;
    plong = 0.812 * SinD(2 * Mj - 5 * Ms - 67.6) -
        0.229 * CosD(2 * Mj - 4 * Ms - 2) +
        0.119 * SinD(Mj - 2 * Ms - 3) +
        0.046 * SinD(2 * Mj - 6 * Ms - 69) +
        0.014 * SinD(Mj - 3 * Ms + 32);

    plat =
        -0.02 * CosD(2 * Mj - 4 * Ms - 2) + 0.018 * SinD(2 * Mj - 6 * Ms - 49);
    lonecl = lonecl + plong;
    latecl = latecl + plat;

    xh = r * CosD(lonecl) * CosD(latecl);
    yh = r * SinD(lonecl) * CosD(latecl);
    zh = r * SinD(latecl);

    sph = Round360(282.9404 + 4.70935E-05 * d);
    spa = 1.0;

    secc = 0.016709 - 1.151E-09 * d;
    sanom = Round360(356.047 + 0.9856002585 * d);
    slon = Round360(sph + sanom);
    ea = sanom + (180 / pi) * secc * SinD(sanom) * (1 + secc * CosD(sanom));
    x = CosD(ea) - secc;
    y = SinD(ea) * Math.sqrt(1 - secc * secc);
    r = Math.sqrt(x * x + y * y);
    v = Math.atan2(y, x) * deg;
    lon = Round360(v + sph);
    x = r * CosD(lon);
    y = r * SinD(lon);
    z = 0.0;
    xequat = x;
    yequat = y * CosD(ecl) - 0.0 * SinD(ecl);
    zequat = y * SinD(ecl) + 0.0 * CosD(ecl);
    xs = r * CosD(lon);
    ys = r * SinD(lon);

    xgeo = xh + xs;
    ygeo = yh + ys;
    zgeo = zh;
    xe = xgeo;
    ye = ygeo * CosD(ecl) - zgeo * SinD(ecl);
    ze = ygeo * SinD(ecl) + zgeo * CosD(ecl);
    rg = Math.sqrt(xgeo * xgeo + ygeo * ygeo + zgeo * zgeo);
    RA = Round360(Math.atan2(ye, xe) * deg);
    Dec = Math.atan2(ze, Math.sqrt(xe * xe + ye * ye)) * deg;
    RA = RA / 15;
    glon = Math.atan2(ygeo, xgeo) * deg;
    glon = Round360(glon - ayana);
    return glon;
  }

  double Rahu(double days) {
    double pl;
    pl = Round360(days * -0.0529921432 + 178.6352777777778);
    return pl;
  }

  double DinaMana(
      double Sun, double ayana, double Lat, double Lon, double TiZ) {
    double a, b, c, d, e;
    a = Sun + 180 + ayana;
    b = SinD(a) * SinD(23.45);
    c = ASinD(b);
    d = TanD(c) * TanD(Lat);
    d = ASinD(d);
    // e = 30.0 - d / 3.0;
    if (sunRise == CenterLimb_INDEX) {
      e = 30.0 - d / 3.0;
    } else {
      e = 30.2777778 - d / 3.0;
    }
    return e;
  }

  double Lagna(
      double Lat, double Lon, double TiZ, int Kali, double tob, double Ayn) {
    //64.2588888889
    print("Lagna----");
    print(Kali);
    print(Ayn);
    print(Lat);
    print(Lon);
    print(TiZ);
    print(tob);

    double a, b, c, d, e, f, g;
    a = tob + ((Lon / 15.0) - TiZ); // (12.75 +( 13.33361111/15 - 5.5 ))
    b = Kali - 1861984 + ((tob - TiZ) / 24.0); //
    c = Round360((frac(b / 365.24219) * 360) + 280.68972222);
    d = Round360(c + ((a - 12) * 15.0));
    e = (CosD(23.45) * TanD(d)) + (SinD(23.45) * (TanD(Lat) / CosD(d)));
    f = ATanD(e);
    g = 90 + f;
    if (d > 90) {
      g = 270 + f;
    }
    if (d > 270) {
      g = 90 + f;
    }
    g = Round360(g - Ayn);
    print(g);
    print(g);
    return g;

    // double a, b, c, d, e, f, g;
    // a = tob + (Lon / 15.0 - TiZ);
    // b = Kali - 1861984 + (tob - TiZ) / 24.0;
    // c = Round360(frac(b / 365.24219) * 360 + 280.68972222);
    // d = Round360(c + (a - 12) * 15.0);
    // e = CosD(23.45) * TanD(d) + (SinD(23.45) * TanD(Lat) / CosD(d));
    // f = ATanD(e);
    // g = 90 + f;
    // if (d > 90) {
    //   g = 270 + f;
    // }
    // if (d > 270) {
    //   g = 90 + f;
    // }
    // g = Round360(g - Ayn);
  }

  double newLagna(double Lat, double Lon, double TiZ, double time) {
    double pi = 3.14159265358979323846;
    double f, t, ra, ob, ascd;
    f = time - TiZ;
    t = ((getJulian() - 2415020) + f / 24 - 0.5) / 36525;
    print("t");
    print(t);
    ra = Round360((6.6460656 + 2400.0513 * t + 2.58e-5 * t * t + f) * 15 + Lon);
    print("ra");
    print(ra);
    ob = 23.452294 - 0.0130125 * t;
    print("ob");
    print(ob);
    ascd = ATan2(CosD(ra), -SinD(ra) * CosD(ob) - TanD(Lat) * SinD(ob));
    print("ascd");
    print(ascd);
    if (ascd < 0.0) {
      ascd = ascd + pi;
    }
    if (CosD(ra) < 0.0) {
      ascd = ascd + pi;
    }

    print("after sym");
    print("ascd");
    print(ascd);

    ascd = Round360(ascd * 180 / pi);

    print("final");
    print(ascd);

    return ascd;
  }

  getJulian() {
    int y = dateTime!.year;
    int m = dateTime!.month;
    int d = dateTime!.day;
    double im;
    double j;
    im = 12 * (y + 4800) + m - 3;
    j = (2 * (im - (im / 12) * 12).floor() + 7 + 365 * im) / 12;
    j = j.floor() + d + (im / 48).floor() - 32083;
    if (j > 2299171) {
      j = j + (im / 4800).floor() - (im / 1200).floor() + 38;
    }

    return j;
  }

  double Dasama(
      double Lat, double Lon, double TiZ, int Kali, double tob, double Ayn) {
    double a, b, c, d, e, f, g;
    a = tob + (Lon / 15.0 - TiZ);
    b = Kali - 1861984 + (tob - TiZ) / 24.0;
    c = Round360(frac(b / 365.24219) * 360 + 280.68972222);
    d = Round360(c + (a - 12) * 15.0);
    e = TanD(d) / CosD(23.45);
    f = ATanD(e);
    g = f;
    if (d > 90) {
      g = f + 180;
    }
    if (d > 270) {
      g = f;
    }
    g = Round360(g - Ayn);
    return g;
  }

  double Mandi(double Lat, double Lon, double TiZ, int Kali, double tob,
      double DivaMana, double Rise, double sSet, double Ayn) {
    print("DivaMana");
    print(DivaMana);

    var data = mUser.convertDecimalToDegree(Rise, 'S', 'N');
    print("Rise");
    print(Rise);
    print(data);

    var data2 = mUser.convertDecimalToDegree(sSet, 'S', 'N');
    print("sSet");
    print(sSet);
    print(data2);

    double a, b, c = 0, d, tim;
    int kld;
    // a = Kali - ((Kali / 7.0) * 7.0).floorToDouble();
    a = Kali % 7;

    print("upper a");
    print(a);
    b = DivaMana;
    if (tob > sSet) {
      a = a + 4;
      b = 60 - b;
    }
    if (tob < Rise) {
      a = a + 3;
      b = 60 - b;
    }
    if (a > 7 || a == 7) {
      a = a - 7;
    }
    if (a == 0) {
      c = 6;
    }
    if (a == 1) {
      c = 2;
    }
    if (a == 2) {
      c = 26;
    }
    if (a == 3) {
      c = 22;
    }
    if (a == 4) {
      c = 18;
    }
    if (a == 5) {
      c = 14;
    }
    if (a == 6) {
      c = 10;
    }

    print("======>a: $a");
    print("======>b: $b");
    print("======>c: $c");

    d = c * b / 75.0;
    print("======>d: $d");
    tim = Rise + d;
    if (tob > sSet) {
      tim = sSet + d;
    }
    if (tob < Rise) {
      tim = sSet + d;
    }
    kld = Kali;
    if (tob < Rise) {
      kld = Kali - 1;
    }
    print("kld");
    print(kld);
    print("tim");
    print(tim);
    a = Lagna(Lat, Lon, TiZ, kld, tim, Ayn);
    //a = newLagna(Lat, Lon, TiZ, timeOfBirth);
    return a;
  }

  double frac(double angle1) {
    double angle = angle1 - (angle1).floor(); //changed here Math.floor(angle1);
    return angle;
  }

  /**
   * RDBMS Calculations
   */
  String RDMS(double planet) {
    double x;
    double y, z;
    x = planet.floorToDouble(); //changed here Math.floor(planet);
    y = planet - x;
    int rasi = (x / 30).floor();
    int degrees = (x % 30).floor();
    z = y * 60.0;
    int minutes = z.floor(); //changed here Math.floor(z);
    int seconds = ((z - minutes) * 60.0).floor();
    //changed here Math.floor((z - minutes) * 60.0);

    //   print("X ${x}Y ${y}Rasi ${rasi}Deg ${degrees}Min ${minutes}Sec $seconds");
    //String *pada = Naks(planet);
    //return [String stringWithFormat:@"%.2d:%.2d:%.2d:%.2d     %s",rasi,degrees,minutes,seconds,pada];
    // return String.format("%.2dË¢ %.2dÂ° %.2d' %.2d\"",rasi,degrees,minutes,seconds);
    //
    // return String.format("%02d<sup><small>s</small> </sup> %02d° %02d' %02d\"",
    //     rasi, degrees, minutes, seconds);
//<sup><small>s</small> </sup>
    return "${rasi.toString().padLeft(2, '0')}SS ${degrees.toString().padLeft(2, '0')}° ${minutes.toString().padLeft(2, '0')}' ${seconds.toString().padLeft(2, '0')}\"";

    //@"áµƒ áµ‡ á¶œ áµˆ áµ‰ á¶  áµ Ê° â± Ê² áµ Ë¡ áµ â¿ áµ’ áµ– Ê³ Ë¢ áµ— áµ˜ áµ› Ê· Ë£ Ê¸ á¶»" ";
    //Â° '
  }

  /**
   * Nakshathra calculation
   *
   * @param planet
   * @return
   */
  (String, String) Naks(double planet) {
    double lon = (planet).abs();
    double n1; //,n3;
    int pada, n2;
    n1 = lon / 13.333333; //yash
    n2 = (n1).floor();
    pada = ((n1 - n2) * 4).floor() + 1;
    //	    return String.format("%d#%d",naks[n2],pada);
    return ("" + data.getNakArrayValue(n2), pada.toString());
  }

  /**
   * Shadvarga calculations for planets
   *
   * @param planet
   * @return shadvarg value for a planet
   **/

  /*Calculate and return value for grahasputha(plant info ) Module */
  List<String> getShadvargaValues() {
    List<String> values = [];

    List<double> planetValues = [
      lagnaValue,
      raviValue,
      chandraValue,
      kujaValue,
      budhaValue,
      guruValue,
      sukraValue,
      saniValue,
      rahuValue,
      ketuValue,
      mandiValue
    ];

    int counter = 0;
    for (var planetNames in data.getPlanetFullNameArray()) {
      print(" " + planetNames + "  " + planetValues[counter].toString());
      String value =
          planetNames + "#" + calculateShadvarga(planetValues[counter]);
      values.add(value);
      counter++;
    }
    print("Size :" + values.length.toString());
    return values;
  }

  List<ShadVargaModel> getMetaShadvargaValues(HoroscopeModel hm) {
    List<ShadVargaModel> values = [];

    List<double> planetValues = [
      hm.lagnaValue!,
      hm.raviValue!,
      hm.chandraValue!,
      hm.kujaValue!,
      hm.budhaValue!,
      hm.guruValue!,
      hm.sukraValue!,
      hm.saniValue!,
      hm.rahuValue!,
      hm.ketuValue!,
      hm.mandiValue!
    ];

    int counter = 0;
    for (var planetNames in engPlanetFullNameArr) {
      print(" " + planetNames + "  " + planetValues[counter].toString());
      values.add(metaCalculateShadvarga(planetNames, planetValues[counter]));
      counter++;
    }
    print("Size :" + values.length.toString());
    return values;
  }

  String calculateShadvarga(double Planet) {
    String shadvarga_value = Drekkana(Planet) +
        "#" +
        Hora(Planet) +
        "#" +
        Navamsa(Planet) +
        "#" +
        Trimsamsa(Planet) +
        "#" +
        Dwadasamsa(Planet) +
        "#" +
        Kshetra(Planet);

    return shadvarga_value;
  }

  ShadVargaModel metaCalculateShadvarga(String planetName, double Planet) {
    return ShadVargaModel(
        graha: planetName,
        dre: Drekkana(Planet),
        hor: Hora(Planet),
        nav: Navamsa(Planet),
        tri: Trimsamsa(Planet),
        dwa: Dwadasamsa(Planet),
        ksh: Kshetra(Planet));

    // String shadvarga_value = Drekkana(Planet) +
    //     "#" +
    //     Hora(Planet) +
    //     "#" +
    //     Navamsa(Planet) +
    //     "#" +
    //     Trimsamsa(Planet) +
    //     "#" +
    //     Dwadasamsa(Planet) +
    //     "#" +
    //     Kshetra(Planet);
    //
    // return shadvarga_value;
  }

  List<String> engPlanetFullNameArr = [
    "Lagn",
    "Ravi",
    "Chan",
    "Kuja",
    "Buda",
    "Guru",
    "Sukr",
    "Sani",
    "Rahu",
    "Ketu",
    "Mand"
  ];
  List<String> engAdhipathiArr = [
    "Kj",
    "Sk",
    "Bd",
    "Ch",
    "Rv",
    "Bd",
    "Sk",
    "Kj",
    "Gr",
    "Sn",
    "Sn",
    "Gr"
  ];

  String Drekkana(double Planet) {
    int a, b, c;
    String result = "";
    a = (Planet).floor();
    b = (a / 30.0).floor();
    c = ((((a * 1) % (30 * 1))) / 10.0).floor();
    switch (c) {
      case 0:
        result = engAdhipathiArr[b];
        break;
      case 1:
        result = engAdhipathiArr[(b + 4 * 1) % (12 * 1)];
        break;
      case 2:
        result = engAdhipathiArr[(b + 8 * 1) % (12 * 1)];
        break;
      default:
        break;
    }

    return result;
  }

  String Hora(double Planet) {
    double a;
    int b, c;
    String d;
    //a = ((Planet*1)%(30*1));
    a = fmod(Planet * 1, 30 * 1);
    b = (a / 15.0).floor();
    // c = floor((Planet / 30*1)%(2*1));
    c = (fmod((Planet / 30.0 * 1), (2 * 1))).floor();

    if (c == 0) {
      if (b == 0) {
        d = engAdhipathiArr[4];
      } else {
        d = engAdhipathiArr[3];
      }
    } else {
      if (b == 0) {
        d = engAdhipathiArr[3];
      } else {
        d = engAdhipathiArr[4];
      }
    }
    return d;
  }

  String Navamsa(double Planet) {
    double a;
    a = (Planet / 40.0) - (Planet / 40.0).floor();
    int b = (a * 12).floor();

    return engAdhipathiArr[b];
  }

  double fmod(double d, double i) {
    //VERIFY
    // TODO Auto-generated method stub
    return d % i;
  }

  String Trimsamsa(double Planet) {
    int a, b, c;
    String d;
    a = (Planet / 30.0).floor();
    b = ((a * 1) % (2 * 1));
    int index = 0;
    // c = floor(((Planet*1)%(30*1)));
    c = (fmod((Planet * 1), (30 * 1))).floor();
    if (b == 0) {
      if (c < 5) {
        index = 0;
      }
      if (c == 5 || c > 5) {
        index = 9;
      }
      if (c == 10 || c > 10) {
        index = 8;
      }
      if (c == 18 || c > 18) {
        index = 2;
      }
      if (c == 25 || c > 25) {
        index = 1;
      }
    } else {
      if (c < 5) {
        index = 1;
      }
      if (c == 5 || c > 5) {
        index = 2;
      }
      if (c == 12 || c > 12) {
        index = 8;
      }
      if (c == 20 || c > 20) {
        index = 9;
      }
      if (c == 25 || c > 25) {
        index = 0;
      }
    }

    d = engAdhipathiArr[index];
    return d;
  }

  String Dwadasamsa(double Planet) {
    double b;
    double c;
    int d;
    double a;
    String e;

    ///a = ((Planet*1)%(30*1));
    a = fmod((Planet * 1.0), (30.0 * 1.0));

    //NSLog(@"aa: %f",fmod((Planet*1), (30*1)));
    // NSLog(@"bb: %f",fmod((Planet*1.0), (30.0*1.0)));
    b = (a / 2.5).floorToDouble();
    c = (Planet / 30.0).floorToDouble();
    d = ((c + b * 1) % (12 * 1)).floor();

    print(
        "${"A: " + a.toString() + "  " + b.toString() + "  " + c.toString()}  " +
            d.toString());
    e = engAdhipathiArr[d];
    return e;
  }

  String Kshetra(double Planet) {
    int a;
    String b;
    a = (Planet / 30.0).floor();
    b = engAdhipathiArr[a];
    return b;
  }

  /**** Shadvarga calculations end*******/

  /**
   * AshtakaVarga calculations
   *
   * @return AshtakaVarga
   **/

  List<String> getAshtakaVargaHeadingArray() {
    return data.getAshtakaVargaHeadingArray();
  }

  /*Calculate and return value for AshtakaVarga Module */
  List<List<int>> getAshtakaVargaValues() {
    // here changed List<int>[]

    return ashtakavargaCalculation(raviValue, chandraValue, kujaValue,
        budhaValue, guruValue, sukraValue, saniValue, lagnaValue);
  }

  List<List<int>> getMetaAshtakaVargaValues(HoroscopeModel hm) {
    // here changed List<int>[]

    return ashtakavargaCalculation(
        hm.raviValue!,
        hm.chandraValue!,
        hm.kujaValue!,
        hm.budhaValue!,
        hm.guruValue!,
        hm.sukraValue!,
        hm.saniValue!,
        hm.lagnaValue!);
  }

  // AshtakaVarga Calculations

  List<List<int>> ashtakavargaCalculation(double ravi, double chan, double kuja,
      double buda, double guru, double sukr, double sani, double lagn) {
    List<int> rva1 = [1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0];
    List<int> rva2 = [0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0];
    List<int> rva3 = [1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0];
    List<int> rva4 = [0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1];
    List<int> rva5 = [0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0];
    List<int> rva6 = [0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1];
    List<int> rva7 = [1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0];
    List<int> rva8 = [0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1];

    List<int> cha1 = [0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0];
    List<int> cha2 = [1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0];
    List<int> cha3 = [0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0];
    List<int> cha4 = [1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0];
    List<int> cha5 = [1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0];
    List<int> cha6 = [0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0];
    List<int> cha7 = [0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0];
    List<int> cha8 = [0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0];

    List<int> kja1 = [0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0];
    List<int> kja2 = [0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0];
    List<int> kja3 = [1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0];
    List<int> kja4 = [0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0];
    List<int> kja5 = [0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1];
    List<int> kja6 = [0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1];
    List<int> kja7 = [1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0];
    List<int> kja8 = [1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0];

    List<int> bda1 = [0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1];
    List<int> bda2 = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0];
    List<int> bda3 = [1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0];
    List<int> bda4 = [1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1];
    List<int> bda5 = [0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1];
    List<int> bda6 = [1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0];
    List<int> bda7 = [1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0];
    List<int> bda8 = [1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0];

    List<int> gra1 = [1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0];
    List<int> gra2 = [0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0];
    List<int> gra3 = [1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0];
    List<int> gra4 = [1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0];
    List<int> gra5 = [1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0];
    List<int> gra6 = [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0];
    List<int> gra7 = [0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1];
    List<int> gra8 = [1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0];

    List<int> ska1 = [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1];
    List<int> ska2 = [1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1];
    List<int> ska3 = [0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1];
    List<int> ska4 = [0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0];
    List<int> ska5 = [0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0];
    List<int> ska6 = [1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0];
    List<int> ska7 = [0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0];
    List<int> ska8 = [1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0];

    List<int> sna1 = [1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0];
    List<int> sna2 = [0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0];
    List<int> sna3 = [0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1];
    List<int> sna4 = [0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1];
    List<int> sna5 = [0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1];
    List<int> sna6 = [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1];
    List<int> sna7 = [0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0];
    List<int> sna8 = [1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0];

    List<List<int>> ashtakavargaArray =
        List.generate(12, (i) => List.filled(9, 0));

    for (int i = 0; i <= 11; i++) {
      //NSLog(@"rv:  %d",tempRv[i]);
      ashtakavargaArray[i][0] = i + 1; //label
    }
    List<int> tempRv = Avarga(rva1, rva2, rva3, rva4, rva5, rva6, rva7, rva8,
        ravi, chan, kuja, buda, guru, sukr, sani, lagn);
    // NSArray *RvAr = [NSArray arrayWithObjects:[String stringWithFormat:@"%d",tempRv[0]], nil];
    for (int i = 0; i <= 11; i++) {
      //NSLog(@"rv:  %d",tempRv[i]);
      ashtakavargaArray[i][1] = tempRv[i]; // tempRv;
    }

    List<int> tempCh = Avarga(cha1, cha2, cha3, cha4, cha5, cha6, cha7, cha8,
        ravi, chan, kuja, buda, guru, sukr, sani, lagn);
    for (int i = 0; i <= 11; i++) {
      //NSLog(@"cg:  %d",tempCh[i]);
      ashtakavargaArray[i][2] = tempCh[i];
    }

    List<int> tempKj = Avarga(kja1, kja2, kja3, kja4, kja5, kja6, kja7, kja8,
        ravi, chan, kuja, buda, guru, sukr, sani, lagn);
    for (int i = 0; i <= 11; i++) {
      //NSLog(@"kj:  %d",tempKj[i]);
      ashtakavargaArray[i][3] = tempKj[i];
    }

    List<int> tempBd = Avarga(bda1, bda2, bda3, bda4, bda5, bda6, bda7, bda8,
        ravi, chan, kuja, buda, guru, sukr, sani, lagn);
    for (int i = 0; i <= 11; i++) {
      //NSLog(@"Bd:  %d",tempBd[i]);
      ashtakavargaArray[i][4] = tempBd[i];
    }

    List<int> tempGr = Avarga(gra1, gra2, gra3, gra4, gra5, gra6, gra7, gra8,
        ravi, chan, kuja, buda, guru, sukr, sani, lagn);
    for (int i = 0; i <= 11; i++) {
      //NSLog(@"Gr:  %d",tempGr[i]);
      ashtakavargaArray[i][5] = tempGr[i];
    }

    List<int> tempSk = Avarga(ska1, ska2, ska3, ska4, ska5, ska6, ska7, ska8,
        ravi, chan, kuja, buda, guru, sukr, sani, lagn);
    for (int i = 0; i <= 11; i++) {
      //NSLog(@"Sk:  %d",tempSk[i]);
      ashtakavargaArray[i][6] = tempSk[i];
    }

    List<int> tempSn = Avarga(sna1, sna2, sna3, sna4, sna5, sna6, sna7, sna8,
        ravi, chan, kuja, buda, guru, sukr, sani, lagn);
    for (int i = 0; i <= 11; i++) {
      //NSLog(@"Sn:  %d",tempSn[i]);
      ashtakavargaArray[i][7] = tempSn[i];
    }

    //Calculate Sarv
    for (int i = 0; i <= 11; i++) {
      int sarv_value = 0;
      sarv_value += tempRv[i];
      sarv_value += tempCh[i];
      sarv_value += tempKj[i];
      sarv_value += tempBd[i];
      sarv_value += tempGr[i];
      sarv_value += tempSk[i];
      sarv_value += tempSn[i];
      ashtakavargaArray[i][8] = sarv_value;
    }

    /* NSLog(@"Math \n");
	     for (int i=0; i<=11; i++)
	     {
	     NSLog(@" %d  %d  %d  %d  %d  %d  %d\n",ashtakavargaArray[i][0],ashtakavargaArray[i][1],ashtakavargaArray[i][2],ashtakavargaArray[i][3],ashtakavargaArray[i][4],ashtakavargaArray[i][5],ashtakavargaArray[i][6]);
	     }*/
    return ashtakavargaArray;
  }

  List<int> Avarga(
      List<int> pl1,
      List<int> pl2,
      List<int> pl3,
      List<int> pl4,
      List<int> pl5,
      List<int> pl6,
      List<int> pl7,
      List<int> pl8,
      double ravi,
      double chan,
      double kuja,
      double buda,
      double guru,
      double sukr,
      double sani,
      double lagn) {
    List<int> av = List.filled(12, 0);
    int a, b, c;
    for (c = 0; c <= 11; c++) {
      av[c] = 0;
    }

    a = (ravi / 30.0).floor();
    for (b = 0; b <= 11; b++) {
      av[a] = av[a] + pl1[b];
      a = ((a + 1) % (12));
    }

    a = (chan / 30.0).floor();
    for (b = 0; b <= 11; b++) {
      av[a] = av[a] + pl2[b];
      a = ((a + 1) % (12));
    }

    a = (kuja / 30.0).floor();
    for (b = 0; b <= 11; b++) {
      av[a] = av[a] + pl3[b];
      a = ((a + 1) % (12));
    }

    a = (buda / 30.0).floor();
    for (b = 0; b <= 11; b++) {
      av[a] = av[a] + pl4[b];
      a = ((a + 1) % (12));
    }

    a = (guru / 30.0).floor();
    for (b = 0; b <= 11; b++) {
      av[a] = av[a] + pl5[b];
      a = ((a + 1) % (12));
    }

    a = (sukr / 30.0).floor();
    for (b = 0; b <= 11; b++) {
      av[a] = av[a] + pl6[b];
      a = ((a + 1) % (12));
    }

    a = (sani / 30.0).floor();
    for (b = 0; b <= 11; b++) {
      av[a] = av[a] + pl7[b];
      a = ((a + 1) % (12));
    }

    a = (lagn / 30.0).floor();
    for (b = 0; b <= 11; b++) {
      av[a] = av[a] + pl8[b];
      a = ((a + 1) % (12));
    }
    return av;
  }

  /*Udayadi***/
  String getUdayadi() {
    return Udayadi(timeOfBirth, sunriseValue);
  }

  /*Udayadi***/
  String getMetaUdayadi(timeOfBirth, sunriseValue) {
    return Udayadi(timeOfBirth, sunriseValue);
  }

  getMetaTimeOfBirth(timeString) {
    List<String> time = timeString.split(":");

    int th = int.parse(time[0]);
    int tm = int.parse(time[1]);

    return th + (tm / 60.0);
  }

  String getMetaDecimalToDegree(double value) {
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
    if (temp_hr < 0) {
      temp_hr = -(temp_hr); //make it positive num
    }
    return temp_hr.toString() +
        "\u00B0 " +
        temp_min.toString() +
        "' " +
        temp_sec.toString() +
        '" ';
  }

  double getMetaDegreeToDecimal(
      double degrees, double minutes, double seconds) {
    //Decimal degrees =
    //   whole number of degrees,
    //   plus minutes divided by 60,
    //   plus seconds divided by 3600

    return degrees + (minutes / 60) + (seconds / 3600);
  }

  String Udayadi(double TimeOfBirth, double sunRise) {
    double a, b;
    a = TimeOfBirth - sunRise;
    if (a < 0) {
      a = a + 24;
    }
    b = a * 2.5;
    return DegreeMinutes(b);
  }

  String DegreeMinutes(double angle) {
    int a, b;
    a = (angle).floor();
    //		/b = (int) ((angle - a) * 60);
    b = ((angle - a) * 60).round();
    return "$a:$b";
  }

  /******************************* Dasa-Bhukti ********************************************/
  /*Calculate and return value for Dasa-Bhukti Module */
  List<String> get9DasaBhuktiValues() {
    ShistaDasa(chandraValue!); //First calclate  Bal_Dasa to find 9 das
    return Get9Dasa(dd, mm, yyyy);
  }

  List<(String, String)> getMeta9DasaBhuktiValues(HoroscopeModel hm) {
    //ShistaDasa(hm.chandraValue!); //First calclate  Bal_Dasa to find 9 das
    (double, int) datas = betaShistaDasa(hm.chandraValue!);
    return GetMeta9Dasa(hm.getDateTime.day, hm.getDateTime.month,
        hm.getDateTime.year, datas.$1, datas.$2);
  }

  /*Calculate and return value for Dasa-Bhukti Module */
  List<String> getADasaBhuktiValues(int id) {
    return GetBhukti(id, dd, mm, yyyy);
  }

  List<int> dasayear = [7, 20, 6, 10, 7, 18, 16, 19, 17];
  int dasaindex = 0;
  double Bal_Dasa = 0.0;
  //static char *dasa[]={};

  int navamsaLagnaPlace = 0;

  String ShistaDasa(double chan) {
    int a, c, d;
    double b, e, f;
    int bdyy, bdmm, bddd;
    a = (chan / 13.3333).floor();
    b = frac(chan / 13.3333);
    c = ((a * 1) % (9 * 1));
    dasaindex = c; // Saved for next calculations
    // NSLog(@"dasaindex: %d",dasaindex);
    //sdasa = dasalord[c];

    String sdasa = data.getDasaLordArray(c);
    d = dasayear[c];
    e = d - b * d;
    Bal_Dasa = e; // Saved for next calculations
    //NSLog(@"Bal_Dasa: %f ",Bal_Dasa);
    bdyy = (e).floor(); // Remaining years
    bdmm = (frac(e) * 12).floor(); // Remaining months
    f = frac(frac(e) * 12) * 30;
    //bddd = Round(f); // Remaining days
    bddd = (f).floor();
    //return [String stringWithFormat:@"%s : %d years ,%d months , %d days",sdasa,bdyy,bdmm,bddd];

    return sdasa +
        bdyy.toString() +
        data.getYearArrayValue(0) +
        bdmm.toString() +
        data.getYearArrayValue(1) +
        bddd.toString() +
        data.getYearArrayValue(2);
  }

  List<String> engYearArr = ["years", "months", "days"];
  List<int> metaDasaYear = [7, 20, 6, 10, 7, 18, 16, 19, 17];

  String metaShistaDasa(double chan) {
    double metaBalDasa = 0.0;
    int metaDasaIndex = 0;

    int a, c, d;
    double b, e, f;
    int bdyy, bdmm, bddd;
    a = (chan / 13.3333).floor();
    b = frac(chan / 13.3333);
    c = ((a * 1) % (9 * 1));
    metaDasaIndex = c; // Saved for next calculations
    // NSLog(@"dasaindex: %d",dasaindex);
    //sdasa = dasalord[c];

    String sdasa = engDasaLordArr[c];
    d = metaDasaYear[c];
    e = d - b * d;
    metaBalDasa = e; // Saved for next calculations
    //NSLog(@"Bal_Dasa: %f ",Bal_Dasa);
    bdyy = (e).floor(); // Remaining years
    bdmm = (frac(e) * 12).floor(); // Remaining months
    f = frac(frac(e) * 12) * 30;
    //bddd = Round(f); // Remaining days
    bddd = (f).floor();
    //return [String stringWithFormat:@"%s : %d years ,%d months , %d days",sdasa,bdyy,bdmm,bddd];

    return sdasa +
        " " +
        bdyy.toString() +
        " " +
        engYearArr[0] +
        ", " +
        bdmm.toString() +
        " " +
        engYearArr[1] +
        ", " +
        bddd.toString() +
        engYearArr[2];
  }

  (double, int) betaShistaDasa(double chan) {
    double metaBalDasa = 0.0;
    int metaDasaIndex = 0;

    int a, c, d;
    double b, e, f;
    int bdyy, bdmm, bddd;
    a = (chan / 13.3333).floor();
    b = frac(chan / 13.3333);
    c = ((a * 1) % (9 * 1));
    metaDasaIndex = c; // Saved for next calculations
    // NSLog(@"dasaindex: %d",dasaindex);
    //sdasa = dasalord[c];

    String sdasa = engDasaLordArr[c];
    d = metaDasaYear[c];
    e = d - b * d;
    metaBalDasa = e; // Saved for next calculations
    //NSLog(@"Bal_Dasa: %f ",Bal_Dasa);
    bdyy = (e).floor(); // Remaining years
    bdmm = (frac(e) * 12).floor(); // Remaining months
    f = frac(frac(e) * 12) * 30;
    //bddd = Round(f); // Remaining days
    bddd = (f).floor();
    //return [String stringWithFormat:@"%s : %d years ,%d months , %d days",sdasa,bdyy,bdmm,bddd];

    return (metaBalDasa, metaDasaIndex);
  }

  String DasaEndingDate(double rdasa) {
    int a, c, e;
    double b, d, f;
    a = (rdasa).floor(); // Year
    b = frac(rdasa) * 12;
    c = (b).floor(); // Month
    d = frac(b) * 30;
    e = (d).floor(); // Days
    if (c == 0) {
      c = 12;
      a = a - 1;
    }
    if (e == 0) {
      e = 30;
      c = c - 1;
    }

    f = ((a * 1) % (4 * 1)); // February correction
    if (f == 0) {
      if ((c == 2) && e > 29) {
        e = 29;
      }
    } else {
      if ((c == 2) && e > 28) {
        e = 28;
      }
    }
    String str1 = "";
    String str2 = "";

    str1 = (e < 10) ? "0" + e.toString() : "" + e.toString();
    str2 = (c < 10) ? "0" + c.toString() : "" + c.toString();

    String res = str1 + "-" + str2 + "-" + a.toString();

    return res;
  }

  List<String> engDasaLordArr = [
    "Ketu",
    "Sukr",
    "Ravi",
    "Chan",
    "Kuja",
    "Rahu",
    "Guru",
    "Sani",
    "Budh"
  ];
  List<(String, String)> GetMeta9Dasa(
      int dob_dd, int dob_mm, int dob_yyyy, Bal_Dasa, dasaindex) {
    double a, b, e;
    String c;
    a = dob_yyyy + (dob_mm + (dob_dd / 30.0)) / 12.0;
    b = a + Bal_Dasa;
    c = DasaEndingDate(b);
    List<(String, String)> dasa = [];
    //String str1 = String.format("%s#%s", data.getDasaLordArray(dasaindex), c);
    // String str1 = engDasaLordArr[dasaindex] + "#" + c;
    dasa.add((engDasaLordArr[dasaindex], c));

    e = b;
    for (int i = 1; i <= 8; i++) {
      a = e + dasayear[((dasaindex + i * 1) % (9 * 1))];
      c = DasaEndingDate(a);
      //String res1 = String.format("%s#%s", data.getDasaLordArray((dasaindex + i) % (9)), c);
      // String res1 =  engDasaLordArr[(dasaindex + i) % (9)] + "#" + c;
      dasa.add((engDasaLordArr[(dasaindex + i) % (9)], c));
      e = a;
    }
    return dasa;
  }

  List<String> Get9Dasa(int dob_dd, int dob_mm, int dob_yyyy) {
    double a, b, e;
    String c;
    a = dob_yyyy + (dob_mm + (dob_dd / 30.0)) / 12.0;
    b = a + Bal_Dasa;
    c = DasaEndingDate(b);
    List<String> dasa = [];
    //String str1 = String.format("%s#%s", data.getDasaLordArray(dasaindex), c);
    String str1 = data.getDasaLordArray(dasaindex) + "#" + c;
    dasa.add(str1);

    e = b;
    for (int i = 1; i <= 8; i++) {
      a = e + dasayear[((dasaindex + i * 1) % (9 * 1))];
      c = DasaEndingDate(a);
      //String res1 = String.format("%s#%s", data.getDasaLordArray((dasaindex + i) % (9)), c);
      String res1 = data.getDasaLordArray((dasaindex + i) % (9)) + "#" + c;
      dasa.add(res1);
      e = a;
    }
    return dasa;
  }

  List<String> GetBhukti(int dasanumber, int dob_dd, int dob_mm, int dob_yyyy) {
    double a, b, c, d, e, g;
    List<double> tdasa = [];

    List<String> Bhu = [];
    String f;

    a = dob_yyyy + (dob_mm + (dob_dd / 30.0)) / 12.0;
    g = a;
    b = a + Bal_Dasa;
    //NSLog(@"Bal_Dasa: %f   dasaindex: %d",Bal_Dasa,dasaindex);
    tdasa[0] = b;
    e = b;
    for (int i = 1; i <= 8; i++) {
      a = e + dasayear[((dasaindex + i * 1) % (9 * 1))];
      tdasa[i] = a;
      e = a;
    }
    c = tdasa[dasanumber] - dasayear[((dasaindex + dasanumber * 1) % (9 * 1))];
    for (int i = 0; i <= 8; i++) {
      d = dasayear[((dasaindex + dasanumber * 1) % (9 * 1))] *
          dasayear[((dasaindex + dasanumber + i * 1) % (9 * 1))] /
          120.0;
      e = c + d;
      if (e > g) {
        f = DasaEndingDate(e);
        //String dasalord1 = String.format("%s#%s", data.getDasaLordArray((dasaindex + dasanumber + i * 1) % (9 * 1)), f);
        String dasalord1 =
            data.getDasaLordArray((dasaindex + dasanumber + i * 1) % (9 * 1)) +
                "#" +
                f;
        Bhu.add(dasalord1);
      }
      c = e;
    }
    return Bhu;
  }

  String Thithi(double sun, double moon) {
    double a;
    int b;
    String d = "";
    a = Round360(moon - sun);
    b = (a / 12.0).floor();
    String c = data.getThithiValue(b);
    d = (b > 14) ? data.getKrishnaPakshaValue() : data.getSuklaPakshaValue();
    //return String.format("%s (%s)", c, d);
    return "$c ($d)";
  }

  String metaThithi(double sun, double moon) {
    List<String> arr = [
      "Pratipat",
      "Dviteeya",
      "Triteeya",
      "Chaturthi",
      "Panchami",
      "Shashthi",
      "Sapthami",
      "Ashtami",
      "Navami",
      "Dasami",
      "Ekadasi",
      "Dvadasi",
      "Trayodasi",
      "Chaturdasi",
      "Poornima",
      "Pratipat",
      "Dviteeya",
      "Triteeya",
      "Chaturthi",
      "Panchami",
      "Shashthi",
      "Sapthami",
      "Ashtami",
      "Navami",
      "Dasami",
      "Ekadasi",
      "Dvadasi",
      "Trayodasi",
      "Chaturdasi",
      "Amavasya"
    ];
    String kPaksha = "Krishna Paksha";
    String sPaksha = "Sukla Paksha";
    double a;
    int b;
    String d = "";
    a = Round360(moon - sun);
    b = (a / 12.0).floor();
    String c = arr[b];
    d = (b > 14) ? kPaksha : sPaksha;
    //return String.format("%s (%s)", c, d);
    return "$c ($d)";
  }

  String Vaara(int kali) {
    int a;
    a = (kali * 1) % (7 * 1);
    return data.getVaraArrayValue(a);
  }

  String metaVaara(int kali) {
    List<String> engVara = [
      "friday",
      "saturday",
      "sunday",
      "monday",
      "tuesday",
      "wednesday",
      "thursday"
    ];
    int a;
    a = (kali * 1) % (7 * 1);
    return engVara[a];
  }

  String getNakshatra(double moon) {
    double a;
    int b;
    a = moon / 13.333333;
    b = (a).floor();
    String c = data.getNakArrayValue(b);
    return c;
  }

  String getMetaNakshatra(double moon) {
    List<String> engNakArr = [
      "Ashwini",
      "Bharani",
      "Krittika",
      "Rohini",
      "Mrigasira",
      "Ardra",
      "Punarvasu",
      "Pushya",
      "Ashlesha",
      "Makha",
      "P.Phalguni",
      "U.Phalguni",
      "Hastha",
      "Chitra",
      "Swathi",
      "Visakha",
      "Anuradha",
      "Jyeshtha",
      "Moola",
      "P.Ashadha",
      "U.Ashadha",
      "Shravana",
      "Dhanishtha",
      "Satabhisha",
      "P.Bhadra",
      "U.Bhadra",
      "Revathi"
    ];
    double a;
    int b;
    a = moon / 13.333333;
    b = (a).floor();
    String c = engNakArr[b];
    return c;
  }

  String Yoga(double sun, double moon) {
    double a;
    int b;
    a = Round360(sun + moon);
    b = (a / 13.33333).floor();
    String c = data.getYogaArrayValue(b);
    return c;
  }

  String metaYoga(double sun, double moon) {
    List<String> engYogaArr = [
      "Vishkambha",
      "Preethi",
      "Ayushman",
      "Soubhagya",
      "Shobhana",
      "Atiganda",
      "Sukarma",
      "Dhriti",
      "Shoola",
      "Ganda",
      "Vruddhi",
      "Dhruva",
      "Vyaaghata",
      "Harshana",
      "Vajra",
      "Siddhi",
      "Vyateepata",
      "Vareeyan",
      "Parigha",
      "Shiva",
      "Siddha",
      "Saadhya",
      "Shubha",
      "Shukla",
      "Brahma",
      "Aindra",
      "Vaidhriti"
    ];
    double a;
    int b;
    a = Round360(sun + moon);
    b = (a / 13.33333).floor();
    String c = engYogaArr[b];
    return c;
  }

  String Karana(double sun, double moon) {
    double a;
    int b;
    a = Round360(moon - sun);
    b = (a / 6.0).floor();
    String c = data.getKaranaArrayValue(b);
    return c;
  }

  String metaKarana(double sun, double moon) {
    List<String> engKaranaArr = [
      "Kimstughna",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Bava",
      "Baalava",
      "Koulava",
      "Taitila",
      "Garija",
      "Vanig",
      "Vishti",
      "Sakuni",
      "Chatushpat",
      "Dvirasana"
    ];
    double a;
    int b;
    a = Round360(moon - sun);
    b = (a / 6.0).floor();
    String c = engKaranaArr[b];
    return c;
  }

  String Nak_Gatha(double Chandra) {
    double a, b;
    int c, d;
    a = frac(Chandra / 13.33333);
    b = a * 60;
    c = (b).floor();
    d = (frac(b) * 60).floor();

    return "$c:$d";
  }

  /**
   * BHAVA KUNDLI
   */

  int GetBhava(double Lagna, double Dasama, double planet) {
    int savethefunction_rvar;
    double a, b, c, d, e, f;
    int h = 0;
    List<double> bhava_s = [];
    List<double> bhava_en = [];
    a = Round360(Dasama + 180.0);
    b = Round360(a - Lagna) / 3.0;
    c = b / 2.0;
    d = Round360(Lagna + 180.0);
    e = Round360(d - a) / 3.0;
    f = e / 2.0;
    bhava_en[0] = Round360(Lagna + c);
    bhava_en[1] = Round360(bhava_en[0] + b);
    bhava_en[2] = Round360(bhava_en[1] + b);
    bhava_en[3] = Round360(a + f);
    bhava_en[4] = Round360(bhava_en[3] + e);
    bhava_en[5] = Round360(bhava_en[4] + e);
    bhava_en[6] = Round360(bhava_en[0] + 180.0);

    bhava_en[7] = Round360(bhava_en[1] + 180.0);
    bhava_en[8] = Round360(bhava_en[2] + 180.0);
    bhava_en[9] = Round360(bhava_en[3] + 180.0);
    bhava_en[10] = Round360(bhava_en[4] + 180.0);
    bhava_en[11] = Round360(bhava_en[5] + 180.0);

    bhava_s[0] = bhava_en[11];
    bhava_s[1] = bhava_en[0];
    bhava_s[2] = bhava_en[1];
    bhava_s[3] = bhava_en[2];
    bhava_s[4] = bhava_en[3];
    bhava_s[5] = bhava_en[4];
    bhava_s[6] = bhava_en[5];
    bhava_s[7] = bhava_en[6];
    bhava_s[8] = bhava_en[7];
    bhava_s[9] = bhava_en[8];
    bhava_s[10] = bhava_en[9];
    bhava_s[11] = bhava_en[10];

    for (int g = 0; g <= 11; g++) {
      if ((bhava_en[g] - bhava_s[g]) < 0) {
        if (planet >= bhava_s[g]) {
          h = g;
        }
        if (planet < bhava_en[g]) {
          h = g;
        }
      } else if (planet >= bhava_s[g] && planet < bhava_en[g]) {
        h = g;
      }
    }
    //h = (floor(Lagna / 30) + h) + 1;
    h = ((Lagna / 30.0).floor() +
        h); //removed +1 //  changed here (Math.floor(Lagna / 30.0) + h);//removed +1
    if (h >= 12) {
      h = h - 12;
    }
    savethefunction_rvar = h;
    return savethefunction_rvar;
  }

  int GetMetaBhava(double Lagna, double Dasama, double planet) {
    int savethefunction_rvar;
    double a, b, c, d, e, f;
    int h = 0;
    List<double> bhava_s = List<double>.filled(12, 0);
    List<double> bhava_en = List<double>.filled(12, 0);
    a = Round360(Dasama + 180.0);
    b = Round360(a - Lagna) / 3.0;
    c = b / 2.0;
    d = Round360(Lagna + 180.0);
    e = Round360(d - a) / 3.0;
    f = e / 2.0;
    bhava_en[0] = Round360(Lagna + c);
    bhava_en[1] = Round360(bhava_en[0] + b);
    bhava_en[2] = Round360(bhava_en[1] + b);
    bhava_en[3] = Round360(a + f);
    bhava_en[4] = Round360(bhava_en[3] + e);
    bhava_en[5] = Round360(bhava_en[4] + e);
    bhava_en[6] = Round360(bhava_en[0] + 180.0);
    bhava_en[7] = Round360(bhava_en[1] + 180.0);
    bhava_en[8] = Round360(bhava_en[2] + 180.0);
    bhava_en[9] = Round360(bhava_en[3] + 180.0);
    bhava_en[10] = Round360(bhava_en[4] + 180.0);
    bhava_en[11] = Round360(bhava_en[5] + 180.0);
    bhava_s[0] = bhava_en[11];
    bhava_s[1] = bhava_en[0];
    bhava_s[2] = bhava_en[1];
    bhava_s[3] = bhava_en[2];
    bhava_s[4] = bhava_en[3];
    bhava_s[5] = bhava_en[4];
    bhava_s[6] = bhava_en[5];
    bhava_s[7] = bhava_en[6];
    bhava_s[8] = bhava_en[7];
    bhava_s[9] = bhava_en[8];
    bhava_s[10] = bhava_en[9];
    bhava_s[11] = bhava_en[10];
    for (int g = 0; g <= 11; g++) {
      if ((bhava_en[g] - bhava_s[g]) < 0) {
        if (planet >= bhava_s[g]) {
          h = g;
        }
        if (planet < bhava_en[g]) {
          h = g;
        }
      } else if (planet >= bhava_s[g] && planet < bhava_en[g]) {
        h = g;
      }
    }

    h = (Lagna / 30.0).floor() + h;
    if (h >= 12) {
      h = h - 12;
    }
    savethefunction_rvar = h;
    return savethefunction_rvar;
  }

  List<String> getShadvargaHeadingArray() {
    return data.getShadvargaHeadingArray();
  }

  // To DRAW NAVAMSA KUNDLI
  int navamsaNum(double Planet) {
    double a;
    int b;
    a = (Planet / 40.0) -
        (Planet / 40.0).floor(); //changed here  Math.floor(Planet / 40.0);
    b = (a * 12).floor(); //changed here   Math.floor(a * 12);
    return b;
  }

  /************************** BHAVA-KUNDLI CALCULATIONS*****************************/
  int getLagnaValue() {
    return lagnaPlace;
  }

  List<Map<String, int>> getBhavaKundliValues() {
    List<Map<String, int>> bhavaKundliValues = [];

    int counter = 0;
    String planetName;
    int value;

    //"Lg"
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = lagnaPlace;
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Rv";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, raviValue);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Ch";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, chandraValue);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Kj";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, kujaValue);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Bd";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, budhaValue);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Gr";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, guruValue);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Sk";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, sukraValue);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Sn";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, saniValue);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Rh";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, rahuValue);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Kt";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, ketuValue);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Md";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetMetaBhava(lagnaValue, dasamaValue, mandiValue);
    bhavaKundliValues.add({planetName: value});

    return bhavaKundliValues;
  }

  List<Map<String, int>> getMetaBhavaKundliValues(HoroscopeModel hm) {
    List<Map<String, int>> bhavaKundliValues = [];

    int counter = 0;
    String planetName;
    int value;

    //"Lg"
    planetName = engPlanetShortNameArr[counter];
    value = hm.lagnaPlace!;
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Rv";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.raviValue!);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Ch";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.chandraValue!);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Kj";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.kujaValue!);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Bd";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.budhaValue!);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Gr";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.guruValue!);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Sk";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.sukraValue!);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Sn";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.saniValue!);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Rh";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.rahuValue!);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Kt";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.ketuValue!);
    bhavaKundliValues.add({planetName: value});
    counter++;

    //@"Md";
    planetName = engPlanetShortNameArr[counter];
    value = GetMetaBhava(hm.lagnaValue!, hm.dasamaValue!, hm.mandiValue!);
    bhavaKundliValues.add({planetName: value});

    return bhavaKundliValues;
  }

/************************* BHAVA-KUNDLI CALCULATIONS END ***********************************/

  /******************************* BHAVASANDHI ********************************************/

  List<String> getBhavasandhiHeadingArray() {
    return data.getBhavasandhiHeadingArray();
  }

  /**
   * Bhavasandhi calculations for planets
   *
   * @param planet
   * @return Bhavasandhi value for a planet
   **/

  /*Calculate and return value for Bhavasandhi Module */
  List<String> getBhavasandhiValues() {
    List<String> values = [];

    String madhya, anthya;
    List<double> bhavaMandya = BhavaMadhya(lagnaValue, dasamaValue);
    List<double> bhavaAntya = Bhavantya(lagnaValue, dasamaValue);

    for (int i = 0; i < 12; i++) {
      madhya = RDMS(bhavaMandya[i]);
      anthya = RDMS(bhavaAntya[i]);
      String value = madhya + "#" + anthya;
      values.add(value);
    }
    print("Bhavasandhi : Size :" + values.length.toString());
    return values;
  }

  List<BhavaSandhiModel> getMetaBhavasandhiValues(lagnaValue, dasamaValue) {
    List<BhavaSandhiModel> values = [];

    String madhya, anthya;
    List<double> bhavaMandya = BhavaMadhya(lagnaValue, dasamaValue);
    List<double> bhavaAntya = Bhavantya(lagnaValue, dasamaValue);

    for (int i = 0; i < 12; i++) {
      madhya = RDMS(bhavaMandya[i]);
      anthya = RDMS(bhavaAntya[i]);
      String value = madhya + "#" + anthya;
      values
          .add(BhavaSandhiModel(bhava: i + 1, madhya: madhya, anthya: anthya));
    }
    print("Bhavasandhi : Size :" + values.length.toString());
    return values;
  }

  List<double> BhavaMadhya(double Lagna, double Dasama) {
    double a, b, c, d;
    a = Round360(Dasama + 180);
    b = Round360(a - Lagna) / 3.0;
    c = Round360(Lagna + 180);
    d = Round360(c - a) / 3.0;

    List<double> Bhava_m = List.filled(12, 0.0);

    Bhava_m[1] = Round360(Bhava_m[0] + b);
    Bhava_m[2] = Round360(Bhava_m[1] + b);
    Bhava_m[3] = a;
    Bhava_m[4] = Round360(Bhava_m[3] + d);
    Bhava_m[5] = Round360(Bhava_m[4] + d);
    Bhava_m[6] = c;
    Bhava_m[7] = Round360(Bhava_m[1] + 180);
    Bhava_m[8] = Round360(Bhava_m[2] + 180);
    Bhava_m[9] = Dasama;
    Bhava_m[10] = Round360(Bhava_m[4] + 180);
    Bhava_m[11] = Round360(Bhava_m[5] + 180);

    // Bhava_m[0] = Lagna;
    // Bhava_m[1] = Round360(Bhava_m[0] + b);
    // Bhava_m[2] = Round360(Bhava_m[1] + b);
    // Bhava_m[3] = a;
    // Bhava_m[4] = Round360(Bhava_m[3] + d);
    // Bhava_m[5] = Round360(Bhava_m[4] + d);
    // Bhava_m[6] = c;
    // Bhava_m[7] = Round360(Bhava_m[1] + 180);
    // Bhava_m[8] = Round360(Bhava_m[2] + 180);
    // Bhava_m[9] = Dasama;
    // Bhava_m[10] = Round360(Bhava_m[4] + 180);
    // Bhava_m[11] = Round360(Bhava_m[5] + 180);
    //
    return Bhava_m;
  }

  List<double> Bhavantya(double Lagna, double Dasama) {
    double a, b, c, d, e, f;
    a = Round360(Dasama + 180);
    b = Round360(a - Lagna) / 3.0;
    c = b / 2.0;
    d = Round360(Lagna + 180);
    e = Round360(d - a) / 3.0;
    f = e / 2.0;
    List<double> Bhava_e = List.filled(12, 0.0);
    Bhava_e[0] = Round360(Lagna + c);
    Bhava_e[1] = Round360(Bhava_e[0] + b);
    Bhava_e[2] = Round360(Bhava_e[1] + b);
    Bhava_e[3] = Round360(a + f);
    Bhava_e[4] = Round360(Bhava_e[3] + e);
    Bhava_e[5] = Round360(Bhava_e[4] + e);
    Bhava_e[6] = Round360(Bhava_e[0] + 180);
    Bhava_e[7] = Round360(Bhava_e[1] + 180);
    Bhava_e[8] = Round360(Bhava_e[2] + 180);
    Bhava_e[9] = Round360(Bhava_e[3] + 180);
    Bhava_e[10] = Round360(Bhava_e[4] + 180);
    Bhava_e[11] = Round360(Bhava_e[5] + 180);

    // List<double> Bhava_e = [];
    // Bhava_e[0] = Round360(Lagna + c);
    // Bhava_e[1] = Round360(Bhava_e[0] + b);
    // Bhava_e[2] = Round360(Bhava_e[1] + b);
    // Bhava_e[3] = Round360(a + f);
    // Bhava_e[4] = Round360(Bhava_e[3] + e);
    // Bhava_e[5] = Round360(Bhava_e[4] + e);
    // Bhava_e[6] = Round360(Bhava_e[0] + 180);
    // Bhava_e[7] = Round360(Bhava_e[1] + 180);
    // Bhava_e[8] = Round360(Bhava_e[2] + 180);
    // Bhava_e[9] = Round360(Bhava_e[3] + 180);
    // Bhava_e[10] = Round360(Bhava_e[4] + 180);
    // Bhava_e[11] = Round360(Bhava_e[5] + 180);
    return Bhava_e;
  }

/*************** BHAVASANDHI END ************************/

  /********************************** DHOOMAADI Calculations ***************************/

  List<String> getDhoomadiValues() {
    List<String> dhoomaadiValues = [];
    //@"Dhooma";
    double dhoomaValue = Round360(raviValue + 133.0);
    String dhoomaString = RDMS(dhoomaValue);
    dhoomaadiValues.add(dhoomaString);

    //@"Vyatipata";
    double vyatipataValue = Round360(360.0 - dhoomaValue);
    String vyatipataString = RDMS(vyatipataValue);
    dhoomaadiValues.add(vyatipataString);

    //@"Parivesha";
    double pariveshaValue = Round360(vyatipataValue + 180.0);
    String pariveshaString = RDMS(pariveshaValue);
    dhoomaadiValues.add(pariveshaString);

    //@"Indrachapa";
    double indrachapaValue = Round360(360.0 - pariveshaValue);
    String indrachapaString = RDMS(indrachapaValue);
    dhoomaadiValues.add(indrachapaString);

    //@"Upaketu";
    double upaketuValue = Round360(indrachapaValue + 17.0);
    String upaketuString = RDMS(upaketuValue);
    dhoomaadiValues.add(upaketuString);

    return dhoomaadiValues;
  }

  List<(String, String)> getMetaDhoomadiValues(raviValue) {
    List<(String, String)> dhoomaadiValues = [];
    //@"Dhooma";
    double dhoomaValue = Round360(raviValue + 133.0);
    String dhoomaString = RDMS(dhoomaValue);
    dhoomaadiValues.add(("Dhooma", dhoomaString));

    //@"Vyatipata";
    double vyatipataValue = Round360(360.0 - dhoomaValue);
    String vyatipataString = RDMS(vyatipataValue);
    dhoomaadiValues.add(("Vyatipata", vyatipataString));

    //@"Parivesha";
    double pariveshaValue = Round360(vyatipataValue + 180.0);
    String pariveshaString = RDMS(pariveshaValue);
    dhoomaadiValues.add(("Parivesha", pariveshaString));

    //@"Indrachapa";
    double indrachapaValue = Round360(360.0 - pariveshaValue);
    String indrachapaString = RDMS(indrachapaValue);
    dhoomaadiValues.add(("Indrachapa", indrachapaString));

    //@"Upaketu";
    double upaketuValue = Round360(indrachapaValue + 17.0);
    String upaketuString = RDMS(upaketuValue);
    dhoomaadiValues.add(("Upaketu", upaketuString));

    return dhoomaadiValues;
  }

  List<String> getDhoomadiArray() {
    return data.getDhoomadiArray();
  }

/************************** DHOOMAADI CALCULATIONS END***************************/

  /******************************* GRAHASPUTHA AND RASI KUNDLI********************************************/
  /*Calculate and return value for grahasputha(plant info ) Module */
  (List<String>, List<PlanetModel>) calculateGrahasPuthaValues() {
    List<String> values = [];
    List<PlanetModel> planetList = [];

    List<double> planetValues = [
      lagnaValue,
      raviValue,
      chandraValue,
      kujaValue,
      budhaValue,
      guruValue,
      sukraValue,
      saniValue,
      rahuValue,
      ketuValue,
      mandiValue
    ];
    List<double> planetValues_1hr = [
      0,
      0,
      0,
      kujaValue_1hr,
      budhaValue_1hr,
      guruValue_1hr,
      sukraValue_1hr,
      saniValue_1hr,
      0,
      0,
      0
    ];

    List<String> planetFullNames = data.getPlanetFullNameArray();
    for (int i = 0; i < planetFullNames.length; i++) {
      //If planet name is "Kuja","Buda","Guru","Sukr","Sani" then append R
      //Some extra calculation
      String longitude = "";
      if (i == 3 || i == 4 || i == 5 || i == 6 || i == 7) {
        if ((planetValues_1hr[i] - planetValues[i]) < 0) {
          longitude = RDMS(planetValues[i]) + "(R)";
        } else {
          longitude = RDMS(planetValues[i]);
        }
      } else {
        longitude = RDMS(planetValues[i]);
      }

      String val = longitude;
      //Values for rasi Kundli
      String shortPlanetName = data.getPlanetShortNameArrayValue(i);

      rasiKundliValues.add({shortPlanetName: int.parse(val.substring(0, 2))});

      //Use longitude value for navamsha kundli draw
      (String, String) datas = Naks(planetValues[i]);
      String value = planetFullNames[i] +
          "#" +
          longitude +
          "#" +
          datas.$1 +
          "#" +
          datas.$2;
      values.add(value);
      planetList.add(PlanetModel(
          planet: planetFullNames[i],
          longitude: longitude,
          nakshathra: datas.$1,
          pada: datas.$2));
    }

    print("Size :" + values.length.toString());
    return (values, planetList);
  }
/******************************* GRAHASPUTHA END ********************************************/

  /************************** NAVAMSA-KUNDLI CALCULATIONS*****************************/

  int getNavamsaLagnaValue() {
    return navamsaLagnaPlace;
  }

  List<Map<String, int>> getNavamsaKundliValues() {
    List<Map<String, int>> navamsaKundliValues = [];

    int counter = 0;
    String planetName;
    int value;

    //"Lg"
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(lagnaValue);

    navamsaLagnaPlace = value;
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Rv";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(raviValue);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Ch";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(chandraValue);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Kj";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(kujaValue);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Bd";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(budhaValue);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Gr";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(guruValue);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Sk";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(sukraValue);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Sn";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(saniValue);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Rh";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(rahuValue);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Kt";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(ketuValue);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Md";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(mandiValue);
    navamsaKundliValues.add({planetName: value});
    counter++;
    return navamsaKundliValues;
  }

  List<String> engPlanetShortNameArr = [
    "Lg",
    "Rv",
    "Ch",
    "Kj",
    "Bd",
    "Gr",
    "Sk",
    "Sn",
    "Rh",
    "Kt",
    "Md"
  ];

  List<Map<String, int>> getMetaNavamsaKundliValues(HoroscopeModel hm) {
    List<Map<String, int>> navamsaKundliValues = [];

    int counter = 0;
    String planetName;
    int value;

    //"Lg"
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.lagnaValue!);

    navamsaLagnaPlace = value;
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Rv";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.raviValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Ch";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.chandraValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Kj";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.kujaValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Bd";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.budhaValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Gr";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.guruValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Sk";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.sukraValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Sn";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.saniValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Rh";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.rahuValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Kt";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.ketuValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;

    //@"Md";
    planetName = engPlanetShortNameArr[counter];
    value = navamsaNum(hm.mandiValue!);
    navamsaKundliValues.add({planetName: value});
    counter++;
    return navamsaKundliValues;
  }
/****************************************************************************************/

  /****************************** PANCHANGA Calculations***********************************************/

  List<String> getPanchangaValues() {
    List<String> panchngaValues = [];
    panchngaValues.add(Thithi(raviValue, chandraValue));
    panchngaValues.add(Vaara(kalidin));
    panchngaValues.add(getNakshatra(chandraValue));
    panchngaValues.add(Yoga(raviValue, chandraValue));
    panchngaValues.add(Karana(raviValue, chandraValue));
    panchngaValues.add(Nak_Gatha(chandraValue));
    panchngaValues.add(ShistaDasa(chandraValue));
    return panchngaValues;
  }

  List<(String, String)> getMetaPanchangaValues(HoroscopeModel hm) {
    List<(String, String)> panchngaValues = [];

    panchngaValues.add(("thithi", metaThithi(hm.raviValue!, hm.chandraValue!)));
    panchngaValues.add(("vaara", metaVaara(hm.kalidin!)));
    panchngaValues.add(("nakshatra", getMetaNakshatra(hm.chandraValue!)));
    panchngaValues.add(("yoga", metaYoga(hm.raviValue!, hm.chandraValue!)));
    panchngaValues.add(("karana", metaKarana(hm.raviValue!, hm.chandraValue!)));
    panchngaValues.add(("nak.gatha", Nak_Gatha(hm.chandraValue!)));
    panchngaValues.add(("balance_dasa", metaShistaDasa(hm.chandraValue!)));
    return panchngaValues;
  }

  List<String> getPanchangaArray() {
    return data.getPanchangaArray();
  }

/************************************PANCHANGA END*************************************/

  /********************************** TRISPHUTAADI Calculations ***************************/

  List<String> getTrisphutadiValues() {
    List<String> trisphutadiValues = [];

    double trisphutaValue = Round360(lagnaValue + chandraValue + mandiValue);
    String trisphutaString = RDMS(trisphutaValue);
    //"Trisphuta";
    trisphutadiValues.add(trisphutaString);

    double chatusphutaValue = Round360(trisphutaValue + raviValue);
    String chatusphutaString = RDMS(chatusphutaValue);
    //"Chatusphuta";
    trisphutadiValues.add(chatusphutaString);

    double panchasphutaValue = Round360(chatusphutaValue + rahuValue);
    String panchaSputaString = RDMS(panchasphutaValue);
    //@"Panchasphuta";
    trisphutadiValues.add(panchaSputaString);

    double pranasphutaValue = Round360(lagnaValue * 5 + mandiValue);
    String pranasphutaString = RDMS(pranasphutaValue);
    //@"PranaSphuta";
    trisphutadiValues.add(pranasphutaString);

    double dehasphutaValue = Round360(chandraValue * 8 + mandiValue);
    String dehasphutaString = RDMS(dehasphutaValue);
    //@"DehaSphuta";
    trisphutadiValues.add(dehasphutaString);

    double mrityusphutaValue = Round360(mandiValue * 7 + raviValue);
    String mrityusphutaString = RDMS(mrityusphutaValue);
    //@"MrityuSphuta";
    trisphutadiValues.add(mrityusphutaString);

    double sookshmatrisphutaValue =
        Round360(pranasphutaValue + dehasphutaValue + mrityusphutaValue);
    String sookshmatrisphutaString = RDMS(sookshmatrisphutaValue);
    //@"SookshmaTrisphuta";
    trisphutadiValues.add(sookshmatrisphutaString);

    return trisphutadiValues;
  }

  List<(String, String)> getMetaTrisphutadiValues(HoroscopeModel hm) {
    //"Trisphuta", "Chatusphuta",
    // 				"Panchasphuta", "PranaSphuta", "DehaSphuta", "MrityuSphuta",
    // 				"SookshmaTrisphuta"
    List<(String, String)> trisphutadiValues = [];

    double trisphutaValue =
        Round360(hm.lagnaValue! + hm.chandraValue! + hm.mandiValue!);
    String trisphutaString = RDMS(trisphutaValue);
    //"Trisphuta";
    trisphutadiValues.add(("Trisphuta", trisphutaString));

    double chatusphutaValue = Round360(trisphutaValue + hm.raviValue!);
    String chatusphutaString = RDMS(chatusphutaValue);
    //"Chatusphuta";
    trisphutadiValues.add(("Chatusphuta", chatusphutaString));

    double panchasphutaValue = Round360(chatusphutaValue + hm.rahuValue!);
    String panchaSputaString = RDMS(panchasphutaValue);
    //@"Panchasphuta";
    trisphutadiValues.add(("Panchasphuta", panchaSputaString));

    double pranasphutaValue = Round360(hm.lagnaValue! * 5 + hm.mandiValue!);
    String pranasphutaString = RDMS(pranasphutaValue);
    //@"PranaSphuta";
    trisphutadiValues.add(("PranaSphuta", pranasphutaString));

    double dehasphutaValue = Round360(hm.chandraValue! * 8 + hm.mandiValue!);
    String dehasphutaString = RDMS(dehasphutaValue);
    //@"DehaSphuta";
    trisphutadiValues.add(("DehaSphuta", dehasphutaString));

    double mrityusphutaValue = Round360(hm.mandiValue! * 7 + hm.raviValue!);
    String mrityusphutaString = RDMS(mrityusphutaValue);
    //@"MrityuSphuta";
    trisphutadiValues.add(("MrityuSphuta", mrityusphutaString));

    double sookshmatrisphutaValue =
        Round360(pranasphutaValue + dehasphutaValue + mrityusphutaValue);
    String sookshmatrisphutaString = RDMS(sookshmatrisphutaValue);
    //@"SookshmaTrisphuta";
    trisphutadiValues.add(("SookshmaTrisphuta", sookshmatrisphutaString));

    return trisphutadiValues;
  }

  List<String> getTrisphutadiArray() {
    return data.getTrisphutadiArray();
  }

/********************************** TRISPHUTAADI END***************************/
}
