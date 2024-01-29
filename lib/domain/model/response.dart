class MetaResponse {
  bool? isSuccess;
  int? statusCode;
  String? message;

  MetaResponse({this.isSuccess, this.statusCode, this.message});

  MetaResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
