class BhavaSandhi{
  /******************************* BHAVASANDHI ********************************************/

  String[] getBhavasandhiHeadingArray() {
    return data.getBhavasandhiHeadingArray();
  }

  /**
   * Bhavasandhi calculations for planets
   *
   * @param planet
   * @return Bhavasandhi value for a planet
   **/

  /*Calculate and return value for Bhavasandhi Module */
  ArrayList<String> getBhavasandhiValues() {
    ArrayList<String> values = new ArrayList<String>();

    String madhya, anthya;
    double[] bhavaMandya = BhavaMadhya(lagnaValue, dasamaValue);
    double[] bhavaAntya = Bhavantya(lagnaValue, dasamaValue);

    for (int i = 0; i < 12; i++) {
      madhya = RDMS(bhavaMandya[i]);
      anthya = RDMS(bhavaAntya[i]);
      String value = madhya + "#" + anthya;
      values.add(value);
    }
    MyConfig.showLog("Bhavasandhi : Size :" + values.size());
    return values;
  }


  double[] BhavaMadhya(double Lagna, double Dasama) {
    double a, b, c, d;
    a = Round360(Dasama + 180);
    b = Round360(a - Lagna) / 3.0;
    c = Round360(Lagna + 180);
    d = Round360(c - a) / 3.0;
    double[] Bhava_m = new double[12];
    Bhava_m[0] = Lagna;
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
    //
    return Bhava_m;
  }

  double[] Bhavantya(double Lagna, double Dasama) {
    double a, b, c, d, e, f;
    a = Round360(Dasama + 180);
    b = Round360(a - Lagna) / 3.0;
    c = b / 2.0;
    d = Round360(Lagna + 180);
    e = Round360(d - a) / 3.0;
    f = e / 2.0;
    double[] Bhava_e = new double[12];
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
    return Bhava_e;
  }

/*************** BHAVASANDHI END ************************/

}