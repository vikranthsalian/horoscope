import 'package:flutter/material.dart';

class ProfileModel {
  String? name;
  String? date;
  String? pic;
  String? data;
  Widget? widgets;

  ProfileModel({required this.name,required this.date,this.pic,this.data,this.widgets});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pic = json['pic'];
    date = json['date'];
    data = json['data'];
    widgets = json['widgets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['pic'] = pic;
    data['date'] = date;
    data['data'] = data;
    data['widgets'] = widgets;
    return data;
  }
}

