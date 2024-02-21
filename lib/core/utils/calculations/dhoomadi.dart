class Dhoomadi{
  /********************************** DHOOMAADI Calculations ***************************/

  List<String> getDhoomadiValues() {


    List<String> dhoomaadiValues = new List<String>;
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

  String[] getDhoomadiArray() {
    return data.getDhoomadiArray();
  }


/************************** DHOOMAADI CALCULATIONS END***************************/
}