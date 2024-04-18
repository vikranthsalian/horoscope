import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  String? id;
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
  int? status;
  @HiveField(8)
  String? planDetails;
  @HiveField(9)
  String? planID;
  UserData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.profilePic,
    this.regDate,
    this.lastLogin,
    this.status,
    this.planDetails,
    this.planID,
  });

  bool get isPremium {
    if (planDetails == "premium") {
      return true;
    }
    return false;
  }

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    profilePic = json['photoUrl'];
    regDate = json['reg_date'];
    lastLogin = json['last_login'];
    status = json['status'];
    planDetails = json['plan_details'];
    planID = json['plan_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['photoUrl'] = profilePic;
    data['reg_date'] = regDate;
    data['last_login'] = lastLogin;
    data['status'] = status;
    data['plan_details'] = planDetails;
    data['plan_id'] = planID;
    return data;
  }
}
