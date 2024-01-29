import 'package:adithya_horoscope/domain/model/package_model.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MetaPackageUtils {
  MetaPackageUtils._();

  static Future<MetaPackageModel> getPackageDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    MetaPackageModel model = MetaPackageModel(packageInfo.appName,
        packageInfo.packageName, packageInfo.version, packageInfo.buildNumber);

    return model;
  }
}
