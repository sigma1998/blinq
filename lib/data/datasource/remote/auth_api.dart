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

  Future<void> getVerificationCode(String mail);

  Future<String> confirmMailVerification(
      {required String mail, required String code});

  Future<void> resetPassword(String newPassword);

  Future<void> deleteUser();

  Future<void> verifyDeleteUser(String code);

  Future<LoginResponseModel> refreshToken(String refresh);
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

  @override
  Future<String> confirmMailVerification(
      {required String mail, required String code}) async {
    try {
      final res = await api.post(NetworkConstants.confirmMailVerification,
          data: {'email': mail, 'verification_code': code});
      return res['token'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> getVerificationCode(String mail) async {
    try {
      await api
          .post(NetworkConstants.getVerificationCode, data: {'email': mail});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String newPassword) async {
    try {
      await api.post(NetworkConstants.resetPassword,
          data: {'password': newPassword});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      await api.post(NetworkConstants.deleteUser);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> verifyDeleteUser(String code) async {
    try {
      await api.delete(NetworkConstants.verifyDeleteUser(code));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> refreshToken(String refresh) async {
    try {
      final res = await api.post(NetworkConstants.refreshToken, data: {
        'refresh': refresh,
      });
      return LoginResponseModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
