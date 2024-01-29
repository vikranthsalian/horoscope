import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/model/response.dart';

abstract class AuthAbstract {
  Future<UserModel> login(data);

  Future<UserModel> getProfile(data);

  Future<UserModel> updateProfilePic(data);

  Future<MetaResponse> updateUser(data);

  Future<MetaResponse> verifyPassword(data);

  Future<MetaResponse> updatePassword(data);

  Future<MetaResponse> createMembership(data);
}
