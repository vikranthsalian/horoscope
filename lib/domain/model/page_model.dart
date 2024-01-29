class PageModel {
  String? totalPages;
  String? totalItems;

  PageModel({required this.totalPages,required this.totalItems});

  PageModel.fromJson(Map<String, dynamic> json) {
    totalPages = json['totalPages'] ?? "";
    totalItems = json['totalItems'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    return data;
  }
}

