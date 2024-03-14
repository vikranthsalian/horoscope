class Language {
  String? id;
  String? title;
  String? path;

  Language({required this.id, required this.title, required this.path});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    title = json['title'] ?? "";
    path = json['path'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['path'] = path;
    return data;
  }
}
