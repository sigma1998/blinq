import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';
import 'package:blinq/data/model/login/response/login_response_model.dart';
import 'package:blinq/data/model/registration/registration_request_dto.dart';
import 'package:blinq/data/model/send_email/response/send_email_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_api_test.mocks.dart';

@GenerateMocks([AppApi])
void main() {
  late MockAppApi mockApiService;
  late AuthApiImpl authApiImpl;

  setUp(() {
    mockApiService = MockAppApi();
    authApiImpl = AuthApiImpl(api: mockApiService);
  });

  test('login should call api.post with correct parameters', () async {
    // Arrange
    const mail = 'test@mail.com';
    const password = 'testpassword';

    const mockResponse = LoginResponseModel(refresh: '', access: '');

    when(mockApiService.post(any, data: anyNamed('data')))
        .thenAnswer((_) async => mockResponse.toJson());

    // Act
    await authApiImpl.login(mail: mail, password: password, fcmToken: '', deviceType: 'ios');

    // Assert
    verify(mockApiService.post(
      NetworkConstants.login,
      data: {'email': mail, 'password': password},
    ));
  });

  test('register should call api.post with correct parameters', () async {
    // Arrange
    const mockResponse = LoginResponseModel(refresh: '123', access: '123');
    const mockRequest = RegistrationRequestDto(
      email: 'test@mail.com',
      password: 'testpassword',
      firstName: 'test',
      lastName: 'test', fcmToken: '', deviceType: 'ios',
    );

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

  test('sendEmail should call api.post with correct parameters', () async {
    // Arrange
    const mail = 'test@gmail.com';
    const mockResponse = SendEmailResponse(
      success: true,
      email: 'test',
      verificationCode: 'test',
    );

    when(mockApiService.post(any, data: anyNamed('data'))).thenAnswer(
      (_) async => mockResponse.toJson(),
    );

    // Act
    await authApiImpl.sendEmail(mail);

    // Assert
    verify(mockApiService.post(
      NetworkConstants.sendVerificationCode,
      data: {'email': mail},
    ));
  });

  test('getVerificationCode should call api.post with correct parameters',
      () async {
    // Arrange
    const mail = 'test@gmail.com';

    when(mockApiService.post(any, data: anyNamed('data')))
        .thenAnswer((_) async => {});

    // Act
    await authApiImpl.getVerificationCode(mail);

    // Assert
    verify(mockApiService.post(
      NetworkConstants.getVerificationCode,
      data: {'email': mail},
    ));
  });

  test('confirmMailVerification should call api.post with correct parameters',
      () async {
    // Arrange
    const mail = 'test@gmail.com';
    const code = 'test';
    const token = '123';

    when(mockApiService.post(any, data: anyNamed('data')))
        .thenAnswer((_) async => {'token': token});

    // Act
    await authApiImpl.confirmMailVerification(mail: mail, code: code);

    // Assert
    verify(mockApiService.post(
      NetworkConstants.confirmMailVerification,
      data: {'email': mail, 'verification_code': code},
    ));
  });
}
