class DialogListModel {
  int? id;
  String? name;
  bool? selected;

  DialogListModel({required this.id,required this.name,this.selected});

  DialogListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['name'] = selected;
    return data;
  }
}

