class BhavaKundli {
  /************************** BHAVA-KUNDLI CALCULATIONS*****************************/

  int getLagnaValue() {
    return lagnaPlace;
  }

  HashMap<String, Integer> getBhavaKundliValues() {
    HashMap<String, Integer> bhavaKundliValues = new HashMap<String, Integer>();

    int counter = 0;
    String planetName;
    int value;

    //"Lg"
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = lagnaPlace;
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Rv";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, raviValue);
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Ch";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, chandraValue);
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Kj";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, kujaValue);
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Bd";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, budhaValue);
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Gr";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, guruValue);
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Sk";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, sukraValue);
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Sn";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, saniValue);
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Rh";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, rahuValue);
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Kt";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, ketuValue);
    bhavaKundliValues.put(planetName, value);
    counter++;

    //@"Md";
    planetName = data.getPlanetShortNameArrayValue(counter);
    value = GetBhava(lagnaValue, dasamaValue, mandiValue);
    bhavaKundliValues.put(planetName, value);

    return bhavaKundliValues;
  }
}
