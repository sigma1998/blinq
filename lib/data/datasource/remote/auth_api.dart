import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/login/response/login_response_model.dart';

abstract class AuthApi {
  Future<LoginResponseModel> login(
      {required String mail, required String password});
}

class AuthApiImpl implements AuthApi {
  final AppApi api;

  AuthApiImpl({required this.api});

  @override
  Future<LoginResponseModel> login(
      {required String mail, required String password}) async {
    try {
      final res = await api.post(NetworkConstants.login,
          data: {'email': mail, 'password': password});

      return LoginResponseModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
