import 'package:blinq/data/datasource/local/local_db.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';
import 'package:blinq/data/model/login/google_request/login_google_request.dart';
import 'package:blinq/data/model/login/response/login_response_model.dart';
import 'package:blinq/data/model/registration/registration_request_dto.dart';
import 'package:blinq/data/model/send_email/response/send_email_response.dart';
import 'package:blinq/data/model/user/user_status.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login(
      {required String mail, required String password});

  Future<SendEmailResponse> sendEmail(String mail);

  Future<LoginResponseModel> register(
      {required RegistrationRequestDto registrationRequestDto});

  Future<LoginResponseModel> loginWithApple(String token);

  Future<LoginResponseModel> loginWithGoogle(LoginGoogleRequest request);

  String getToken();

  void setToken(String token);

  String getRefreshToken();

  void setRefreshToken(String token);

  void setUserStatus(UserStatus userStatus);

  UserStatus getUserStatus();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi api;
  final LocalStorage localStorage;

  AuthRepositoryImpl({required this.api, required this.localStorage});

  @override
  Future<LoginResponseModel> login(
      {required String mail, required String password}) async {
    try {
      return await api.login(mail: mail, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SendEmailResponse> sendEmail(String mail) async {
    try {
      return await api.sendEmail(mail);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> register(
      {required RegistrationRequestDto registrationRequestDto}) async {
    try {
      return await api.register(registrationRequestDto: registrationRequestDto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> loginWithApple(String token) async {
    try {
      return await api.loginWithApple(token);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> loginWithGoogle(LoginGoogleRequest request) async {
    try {
      return await api.loginWithGoogle(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  String getRefreshToken() {
    return localStorage.getRefreshToken();
  }

  @override
  String getToken() {
    return localStorage.getToken();
  }

  @override
  void setRefreshToken(String token) {
    localStorage.setRefreshToken(token);
  }

  @override
  void setToken(String token) {
    localStorage.setToken(token);
  }

  @override
  void setUserStatus(UserStatus userStatus) {
    localStorage.setUserStatus(userStatus);
  }

  @override
  UserStatus getUserStatus() {
    return localStorage.getUserStatus();
  }
}
