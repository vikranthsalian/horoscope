class Panchanga{
  /****************************** PANCHANGA Calculations***********************************************/


  ArrayList<String> getPanchangaValues() {
    ArrayList<String> panchngaValues = new ArrayList<String>();
    panchngaValues.add(Thithi(raviValue, chandraValue));
    panchngaValues.add(Vaara(kalidin));
    panchngaValues.add(getNakshatra(chandraValue));
    panchngaValues.add(Yoga(raviValue, chandraValue));
    panchngaValues.add(Karana(raviValue, chandraValue));
    panchngaValues.add(Nak_Gatha(chandraValue));
    panchngaValues.add(ShistaDasa(chandraValue));
    return panchngaValues;

  }

  String[] getPanchangaArray() {
    return data.getPanchangaArray();
  }


/************************************PANCHANGA END*************************************/
}