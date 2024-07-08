
import 'package:dio/dio.dart';
import 'package:project/core/config/get_it_config.dart';
import 'package:project/model/handling_model.dart';
import 'package:project/model/signup_model.dart';
import 'package:project/service/core_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService extends CoreService {
  Future<ResultModel> signUp(SignupModel user);
}

class AuthSeviceImp extends AuthService {

  @override
  Future<ResultModel> signUp(SignupModel user) async {
    try {
      response = await dio.post(baseurl + "/auth/register", data: user.toMap());
      if (response.statusCode == 200) {
        String token = response.data['access_token'];
        core.get<SharedPreferences>().setString('token', token);
        return SuccessModel();
      } else {
        return ErrorModel(message: "Failed to rejester");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message.toString());
    }
  }
}