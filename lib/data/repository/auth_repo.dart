import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/data/network/auth_network.dart';
import 'package:adithya_horoscope/domain/abstract/auth_abstract.dart';
import 'package:adithya_horoscope/domain/model/response.dart';

class AuthRepo extends AuthAbstract {
  @override
  Future<UserData> login(data) async {
    var response = await AuthNetwork().loginRequest(data);
    UserData model = UserData();
    try {
      model = UserData.fromJson(response);
    } catch (e) {
      print(e);
    }
    return model;
  }

  @override
  Future<MetaResponse> verifyPassword(data) async {
    var response = await AuthNetwork().verifyPassword(data);
    MetaResponse model = MetaResponse(isSuccess: false);
    try {
      model = MetaResponse.fromJson(response);
    } catch (e) {
      print(e);
    }
    return model;
  }

  @override
  Future<UserData> updateProfilePic(data) async {
    var response = await AuthNetwork().updateProfilePic(data);
    UserData model = UserData();
    try {
      model = UserData.fromJson(response);
    } catch (e) {
      print(e);
    }
    return model;
  }

  @override
  Future<UserData> getProfile(data) async {
    var response = await AuthNetwork().getProfile(data);
    UserData model = UserData();
    try {
      model = UserData.fromJson(response);
    } catch (e) {
      print(e);
    }
    return model;
  }

  @override
  Future<MetaResponse> updateUser(data) async {
    var response = await AuthNetwork().updateUser(data);
    MetaResponse model = MetaResponse(isSuccess: false);
    try {
      model = MetaResponse.fromJson(response);
    } catch (e) {
      print(e);
    }
    return model;
  }

  @override
  Future<MetaResponse> updatePassword(data) async {
    var response = await AuthNetwork().updatePassword(data);
    MetaResponse model = MetaResponse(isSuccess: false);
    try {
      model = MetaResponse.fromJson(response);
    } catch (e) {
      print(e);
    }
    return model;
  }

  @override
  Future<MetaResponse> createMembership(data) async {
    var response = await AuthNetwork().createMembership(data);
    MetaResponse model = MetaResponse(isSuccess: false);
    try {
      model = MetaResponse.fromJson(response);
    } catch (e) {
      print(e);
    }
    return model;
  }
}
