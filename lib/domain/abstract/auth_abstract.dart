import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/model/response.dart';

abstract class AuthAbstract {
  Future<UserData> login(data);

  Future<UserData> getProfile(data);

  Future<UserData> updateProfilePic(data);

  Future<MetaResponse> updateUser(data);

  Future<MetaResponse> verifyPassword(data);

  Future<MetaResponse> updatePassword(data);

  Future<MetaResponse> createMembership(data);
}
