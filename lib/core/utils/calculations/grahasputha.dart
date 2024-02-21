class GrahasPutha{


  /******************************* GRAHASPUTHA AND RASI KUNDLI********************************************/
  /*Calculate and return value for grahasputha(plant info ) Module */
  List<String> calculateGrahasPuthaValues() {
    ArrayList<String> values = new ArrayList<String>();

    double[] planetValues = {lagnaValue, raviValue, chandraValue, kujaValue, budhaValue, guruValue, sukraValue, saniValue, rahuValue, ketuValue, mandiValue};
    double[] planetValues_1hr = {0, 0, 0, kujaValue_1hr, budhaValue_1hr, guruValue_1hr, sukraValue_1hr, saniValue_1hr, 0, 0, 0};

    String[] planetFullNames = data.getPlanetFullNameArray();
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
      rasiKundliValues.put(shortPlanetName, Integer.parseInt(val.substring(0, 2)));

      //Use longitude value for navamsha kundli draw

      String value = planetFullNames[i] + "#" + longitude + "#" + Naks(planetValues[i]);
      values.add(value);
    }

    MyConfig.showLog("Size :" + values.size());
    return values;
  }


/******************************* GRAHASPUTHA END ********************************************/


}