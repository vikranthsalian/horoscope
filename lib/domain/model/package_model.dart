class MetaPackageModel {
  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;

  MetaPackageModel(
      this.appName, this.packageName, this.version, this.buildNumber);

  MetaPackageModel.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    packageName = json['packageName'];
    version = json['version'];
    buildNumber = json['buildNumber'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appName'] = appName;
    data['packageName'] = packageName;
    data['version'] = version;
    data['buildNumber'] = buildNumber;
    return data;
  }
}
