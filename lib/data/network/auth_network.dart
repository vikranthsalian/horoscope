import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:adithya_horoscope/core/dio/dio_client.dart';
import 'package:flutter/cupertino.dart';

class AuthNetwork {
  String loginPath = "userLogin";
  String verifyPasswordPath = "verifyPassword";
  String getFollowingListPath = "getFollowingList";
  String updateFollowingPath = "updateFollowing";
  String updatePasswordPath = "changePassword";
  String updateData = "updateMembership";
  String createPath = "createMembership";
  String getProfilePath = "getProfile";
  String updateEmailPushStatusPath = "updateEmailPushStatus";
  String updateProfilePicPath = "updateProfilePic";

  Future<dynamic> loginRequest(Map<String, dynamic> data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            loginPath,
            data: data,
            showAlert: false,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "verifyingCredentials...",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }

  Future<dynamic> updateFollowing(Map<String, dynamic> data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            updateFollowingPath,
            data: data,
            showAlert: false,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }

  Future<dynamic> updatePushEmailSmsStatus(Map<String, dynamic> data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            updateEmailPushStatusPath,
            data: data,
            showAlert: false,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }

  Future<dynamic> getFollowingList(Map<String, dynamic> data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            getFollowingListPath,
            data: data,
            showAlert: false,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }

  Future<dynamic> verifyPassword(Map<String, dynamic> data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            verifyPasswordPath,
            data: data,
            showAlert: false,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }

  Future<dynamic> getProfile(Map<String, dynamic> data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            getProfilePath,
            data: data,
            showAlert: false,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "verifyingCredentials...",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }

  Future<dynamic> updateProfilePic(data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            updateProfilePicPath,
            data: data,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "verifyingCredentials...",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }

  Future<dynamic> updateUser(Map<String, dynamic> data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            updateData,
            data: data,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "verifyingCredentials...",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }

  Future<dynamic> updatePassword(Map<String, dynamic> data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            updatePasswordPath,
            data: data,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "verifyingCredentials...",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }

  Future<dynamic> createMembership(Map<String, dynamic> data) async {
    try {
      final responseJson = await MetaDio().getWrapper().post(
            createPath,
            data: data,
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Basic',
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            enableBearer: false,
            loadingMessage: "creatingMembership...",
          );
      return responseJson.data;
    } on DioException catch (e) {
      debugPrint("DioException $e");
      return;
    } catch (e) {
      debugPrint("CatchError $e");
      return jsonDecode(e.toString());
    }
  }
}
