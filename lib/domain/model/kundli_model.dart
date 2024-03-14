class KundliModel {
  int? id;
  List<String>? data;

  KundliModel({this.id, this.data});

  KundliModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v).toList();
    }
    return data;
  }
}
