import 'package:flutter_flavor/flutter_flavor.dart';

class MetaFlavourConstants {
  static String apiVersion = FlavorConfig.instance.variables["apiVersion"];
  static String devUrl = FlavorConfig.instance.variables["devUrl"];
  static String prodUrl = FlavorConfig.instance.variables["prodUrl"];
  static String appTitle = FlavorConfig.instance.variables["appTitle"];
  static String appSubTitle = FlavorConfig.instance.variables["appSubTitle"];
  static String appLogo = FlavorConfig.instance.variables["appLogo"];
  static String appIcon = FlavorConfig.instance.variables["appIcon"];
  static String logo = FlavorConfig.instance.variables["logo"];
  static String flavourTag = FlavorConfig.instance.variables["flavor"];
  static String assets = FlavorConfig.instance.variables["assetPath"];
  static String instagram = FlavorConfig.instance.variables["instagram"];
  static String whatsapp = FlavorConfig.instance.variables["whatsapp"];
  static String facebook = FlavorConfig.instance.variables["facebook"];
  static String linkedin = FlavorConfig.instance.variables["linkedin"];
  static String shareMsg = FlavorConfig.instance.variables["shareMsg"];
  static String shareAsset = FlavorConfig.instance.variables["shareAsset"];
  static List<dynamic> premiumPlansList =
      FlavorConfig.instance.variables["premiumPlans"];
  static String serverAssetPath =
      FlavorConfig.instance.variables["serverAssetPath"];
  static String primaryColor =
      FlavorConfig.instance.variables["appTheme"]["primaryColor"];
  static String secondaryColor =
      FlavorConfig.instance.variables["appTheme"]["secondaryColor"];
  static String flavorPath = "$assets/flavor/$flavourTag/";
  static String imagesPath = "images/";
  static Map<String, dynamic> packageDetails =
      FlavorConfig.instance.variables["package_details"];
  static String assetPath = "$assets/images/";

  // static  String flavour =  FlavorConfig.instance.name.toString();
  // static  bool enableTesting =  FlavorConfig.instance.variables["enableUnitTesting"];
}
