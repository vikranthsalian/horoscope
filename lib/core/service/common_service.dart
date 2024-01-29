import 'package:adithya_horoscope/core/injector/injector.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/domain/usecase/auth_usecase.dart';

class CommonService {
  Future<bool> getConfigData(Map<String, dynamic> data) async {
    UserModel response = await Injector.resolve<AuthUseCase>().getProfile(data);
    if (response.isSuccess!) {
      return true;
    }
    return false;
  }
}
