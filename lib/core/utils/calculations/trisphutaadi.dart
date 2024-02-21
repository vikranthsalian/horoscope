class Trisphutaadi{
  /********************************** TRISPHUTAADI Calculations ***************************/

  ArrayList<String> getTrisphutadiValues() {
    ArrayList<String> trisphutadiValues = new ArrayList<String>();

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

    double sookshmatrisphutaValue = Round360(pranasphutaValue + dehasphutaValue + mrityusphutaValue);
    String sookshmatrisphutaString = RDMS(sookshmatrisphutaValue);
    //@"SookshmaTrisphuta";
    trisphutadiValues.add(sookshmatrisphutaString);

    return trisphutadiValues;
  }


  String[] getTrisphutadiArray() {
    return data.getTrisphutadiArray();
  }

/********************************** TRISPHUTAADI END***************************/
}