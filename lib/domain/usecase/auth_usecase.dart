import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/abstract/auth_abstract.dart';
import 'package:adithya_horoscope/domain/model/response.dart';

class AuthUseCase {
  final AuthAbstract authAbstract;

  AuthUseCase(this.authAbstract);

  Future<MetaResponse> createMembership(data) =>
      authAbstract.createMembership(data);

  Future<UserData> userLogin(data) => authAbstract.login(data);

  Future<UserData> getProfile(data) => authAbstract.getProfile(data);

  Future<UserData> updateProfilePic(data) =>
      authAbstract.updateProfilePic(data);

  Future<MetaResponse> updateUser(data) => authAbstract.updateUser(data);

  Future<MetaResponse> verifyPassword(data) =>
      authAbstract.verifyPassword(data);

  Future<MetaResponse> updatePassword(data) =>
      authAbstract.updatePassword(data);
}
