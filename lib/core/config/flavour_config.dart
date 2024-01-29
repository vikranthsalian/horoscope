import 'package:flutter_flavor/flutter_flavor.dart';

class MetaFlavourConfig {

  initConfig(Map<String, dynamic> flavour) {
    FlavorConfig(variables: flavour);
    print(FlavorConfig.instance.variables);
  }
}

