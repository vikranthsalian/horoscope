import 'dart:convert';

import 'package:adithya_horoscope/core/config/flavour_config.dart';
import 'package:adithya_horoscope/core/utils/package_info.dart';
import 'package:adithya_horoscope/domain/model/package_model.dart';
import 'package:flutter/services.dart';

class MetaJsonConfig {
  initFlavor({String jsonPath = ""}) async {
    MetaPackageModel model = await MetaPackageUtils.getPackageDetails();

    String data = await rootBundle.loadString(jsonPath);
    Map<String, dynamic> map = json.decode(data.toString());
    map['package_details'] = model.toJson();

    MetaFlavourConfig().initConfig(map);
    return;
  }
}
