// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';
import 'package:blinq/data/model/login/google_request/login_google_request.dart';
import 'package:blinq/data/model/login/response/login_response_model.dart';
import 'package:blinq/data/model/registration/registration_request_dto.dart';
import 'package:blinq/data/model/send_email/response/send_email_response.dart';
import 'auth_api_test.mocks.dart';

@GenerateMocks([AppApi])
void main() {
  late MockAppApi mockApiService;
  late AuthApiImpl authApiImpl;

  const email = 'test@mail.com';
  const password = 'testpassword';

  const code = 'test';

  const token = '123';
  const fcmToken = 'test';
  const deviceType = 'ios';
  const refresh = 'test';

  const mockResponse = LoginResponseModel(refresh: '', access: '');
  const mockRequest = RegistrationRequestDto(
    email: 'test@mail.com',
    password: 'testpassword',
    firstName: 'test',
    lastName: 'test',
    fcmToken: 'test',
    deviceType: 'ios',
  );

  const googleRequest = LoginGoogleRequest(
    email: 'test',
    displayName: 'test test',
    id: 'test',
    fcmToken: '',
    deviceType: '',
  );

  const emailResponse = SendEmailResponse(
    success: true,
    email: email,
    verificationCode: 'test',
  );

  setUp(() {
    mockApiService = MockAppApi();
    authApiImpl = AuthApiImpl(api: mockApiService);
  });

  group('Registration', () {
    test('register should call api.post with correct parameters', () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => mockResponse.toJson());

      // Act
      await authApiImpl.register(registrationRequestDto: mockRequest);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.registration,
        data: mockRequest.toJson(),
      ));
    });

    test('login should call api.post with correct parameters', () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => mockResponse.toJson());

      // Act
      await authApiImpl.login(
        mail: email,
        password: password,
        fcmToken: 'mockFcmToken',
        deviceType: 'ios',
      );

      // Assert
      verify(mockApiService.post(
        NetworkConstants.login,
        data: {
          'email': email,
          'password': password,
          'device_type': 'ios',
          'fcm_token': 'mockFcmToken',
        },
      ));
    });

    test('refreshToken should call api.post with correct parameters', () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => mockResponse.toJson());

      // Act
      await authApiImpl.refreshToken(refresh);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.refreshToken,
        data: {'refresh': refresh},
      ));
    });

    test('resetPassword should call api.post with correct parameters',
        () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await authApiImpl.resetPassword(password);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.resetPassword,
        data: {'password': password},
      ));
    });
  });

  group('Social', () {
    test('loginWithGoogle should call api.post with correct parameters',
        () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => mockResponse.toJson());

      // Act
      await authApiImpl.loginWithGoogle(googleRequest);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.loginGoogle,
        data: googleRequest.toJson(),
      ));
    });

    test('loginWithApple should call api.post with correct parameters',
        () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => mockResponse.toJson());

      // Act
      await authApiImpl.loginWithApple(
        token: token,
        deviceType: deviceType,
        fcmToken: fcmToken,
      );

      // Assert
      verify(mockApiService.post(
        NetworkConstants.loginApple,
        data: {
          'token': token,
          'device_type': deviceType,
          'fcm_token': fcmToken,
        },
      ));
    });
  });

  group('Email', () {
    test('sendEmail should call api.post with correct parameters', () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => emailResponse.toJson());

      // Act
      await authApiImpl.sendEmail(email);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.sendVerificationCode,
        data: {'email': email},
      ));
    });

    test('getVerificationCode should call api.post with correct parameters',
        () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await authApiImpl.getVerificationCode(email);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.getVerificationCode,
        data: {'email': email},
      ));
    });

    test('confirmMailVerification should call api.post with correct parameters',
        () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => {'token': token});

      // Act
      await authApiImpl.confirmMailVerification(mail: email, code: code);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.confirmMailVerification,
        data: {'email': email, 'verification_code': code},
      ));
    });
  });

  group('Delete', () {
    test('deleteUser should call api.delete with correct parameters', () async {
      // Arrange
      when(mockApiService.post(any)).thenAnswer((_) async => {});

      // Act
      await authApiImpl.deleteUser();

      // Assert
      verify(mockApiService.post(NetworkConstants.deleteUser));
    });

    test('verify deleteUser should call api.delete with correct parameters',
        () async {
      // Arrange
      when(mockApiService.delete(any)).thenAnswer((_) async => {});

      // Act
      await authApiImpl.verifyDeleteUser(code);

      // Assert
      verify(mockApiService.delete(NetworkConstants.verifyDeleteUser(code)));
    });
  });
}
