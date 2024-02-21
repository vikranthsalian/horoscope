class NavamsaKundli {
  /************************** NAVAMSA-KUNDLI CALCULATIONS*****************************/

  int getNavamsaLagnaValue() {
    return navamsaLagnaPlace;
  }

  HashMap<String, Integer> getNavamsaKundliValues() {
    HashMap<String, Integer> navamsaKundliValues =
        new HashMap<String, Integer>();

    int counter = 0;
    String planetName;
    int value;

    //"Lg"
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(lagnaValue);

    navamsaLagnaPlace = value;
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Rv";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(raviValue);
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Ch";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(chandraValue);
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Kj";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(kujaValue);
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Bd";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(budhaValue);
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Gr";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(guruValue);
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Sk";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(sukraValue);
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Sn";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(saniValue);
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Rh";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(rahuValue);
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Kt";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(ketuValue);
    navamsaKundliValues.put(planetName, value);
    counter++;

    //@"Md";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = navamsaNum(mandiValue);
    navamsaKundliValues.put(planetName, value);
    counter++;
    return navamsaKundliValues;
  }
/****************************************************************************************/
}
