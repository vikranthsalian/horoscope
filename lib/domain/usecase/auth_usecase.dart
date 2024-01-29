import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/abstract/auth_abstract.dart';
import 'package:adithya_horoscope/domain/model/response.dart';

class AuthUseCase {
  final AuthAbstract authAbstract;

  AuthUseCase(this.authAbstract);

  Future<MetaResponse> createMembership(data) =>
      authAbstract.createMembership(data);

  Future<UserModel> userLogin(data) => authAbstract.login(data);

  Future<UserModel> getProfile(data) => authAbstract.getProfile(data);

  Future<UserModel> updateProfilePic(data) =>
      authAbstract.updateProfilePic(data);

  Future<MetaResponse> updateUser(data) => authAbstract.updateUser(data);

  Future<MetaResponse> verifyPassword(data) =>
      authAbstract.verifyPassword(data);

  Future<MetaResponse> updatePassword(data) =>
      authAbstract.updatePassword(data);
}
