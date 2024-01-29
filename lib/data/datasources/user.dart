import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

class UserModel {
  bool? isSuccess;

  int? statusCode;

  String? token;

  String? message;

  UserData? data;

  UserModel(
      {this.isSuccess, this.statusCode, this.token, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    statusCode = json['statusCode'];
    token = json['token'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['isSuccess'] = isSuccess;
    data['statusCode'] = statusCode;
    data['token'] = token;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      data: map['data'] != null ? UserData.fromJson(map['data']) : null,
    );
  }

  @override
  String toString() {
    return 'UserResponse{data: $data}';
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'data': data,
    } as Map<String, dynamic>;
  }
}

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? mobile;
  @HiveField(4)
  String? profilePic;
  @HiveField(5)
  String? regDate;
  @HiveField(6)
  String? lastLogin;
  @HiveField(7)
  String? verifiedAt;
  @HiveField(8)
  int? status;

  UserData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.profilePic,
    this.regDate,
    this.lastLogin,
    this.verifiedAt,
    this.status,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    profilePic = json['profile_pic'];
    regDate = json['reg_date'];
    lastLogin = json['last_login'];
    verifiedAt = json['verified_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['profile_pic'] = profilePic;
    data['reg_date'] = regDate;
    data['last_login'] = lastLogin;
    data['verified_at'] = verifiedAt;
    data['status'] = status;
    return data;
  }
}
