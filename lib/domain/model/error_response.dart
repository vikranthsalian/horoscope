class ErrorResponse {
  String? msg;
  List<Err>? err;

  ErrorResponse({this.msg, this.err});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['err'] != null) {
      err =  [];
      json['err'].forEach((v) {
        err!.add( Err.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['msg'] = msg;
    if (err != null) {
      data['err'] = err!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Err {
  String? field;
  String? message;

  Err({this.field, this.message});

  Err.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['field'] = this.field;
    data['message'] = this.message;
    return data;
  }
}
