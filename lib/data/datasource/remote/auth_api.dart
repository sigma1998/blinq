import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/login/google_request/login_google_request.dart';
import 'package:blinq/data/model/login/response/login_response_model.dart';
import 'package:blinq/data/model/registration/registration_request_dto.dart';
import 'package:blinq/data/model/send_email/response/send_email_response.dart';

abstract class AuthApi {
  Future<LoginResponseModel> login(
      {required String mail, required String password});

  Future<LoginResponseModel> register(
      {required RegistrationRequestDto registrationRequestDto});

  Future<SendEmailResponse> sendEmail(String mail);

  Future<LoginResponseModel> loginWithApple(String token);

  Future<LoginResponseModel> loginWithGoogle(LoginGoogleRequest request);
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

  @override
  Future<LoginResponseModel> register(
      {required RegistrationRequestDto registrationRequestDto}) async {
    try {
      final res = await api.post(NetworkConstants.registration,
          data: registrationRequestDto.toJson());

      return LoginResponseModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SendEmailResponse> sendEmail(String mail) async {
    try {
      final res = await api
          .post(NetworkConstants.sendVerificationCode, data: {'email': mail});

      return SendEmailResponse.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> loginWithApple(String token) async {
    try {
      final res =
          await api.post(NetworkConstants.loginApple, data: {'token': token});

      return LoginResponseModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> loginWithGoogle(LoginGoogleRequest request) async {
    try {
      final res =
          await api.post(NetworkConstants.loginGoogle, data: request.toJson());

      return LoginResponseModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
