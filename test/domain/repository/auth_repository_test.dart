// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/datasource/local/auth_local_db.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';
import 'package:blinq/data/model/login/google_request/login_google_request.dart';
import 'package:blinq/data/model/login/response/login_response_model.dart';
import 'package:blinq/data/model/registration/registration_request_dto.dart';
import 'package:blinq/data/model/send_email/response/send_email_response.dart';
import 'package:blinq/data/model/user/user_status.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthApi, AuthLocalStorage])
void main() {
  late MockAuthApi mockAuthApi;
  late MockAuthLocalStorage mockAuthLocalStorage;
  late AuthRepository authRepository;

  const mail = 'test@mail.com';

  const code = '123456';

  const userStatus = UserStatus.signed;

  const token = 'mockToken';
  const fcmToken = 'mockFcmToken';
  const refreshToken = 'mockRefreshToken';

  const deviceType = 'ios';

  const sendEmailResponse = SendEmailResponse(
    success: true,
    email: '',
    verificationCode: '',
  );

  const loginResponseModel = LoginResponseModel(
    refresh: '',
    access: '',
  );

  setUp(() {
    mockAuthApi = MockAuthApi();
    mockAuthLocalStorage = MockAuthLocalStorage();
    authRepository = AuthRepositoryImpl(
      api: mockAuthApi,
      localStorage: mockAuthLocalStorage,
    );
  });

  group('Register', () {
    test('register calls api.register with correct parameters', () async {
      // Arrange
      const registrationRequestDto = RegistrationRequestDto(
        email: 'test@mail.com',
        password: 'testpassword',
        firstName: 'John',
        lastName: 'Doe',
        fcmToken: 'mockFcmToken',
        deviceType: 'ios',
      );

      when(mockAuthApi.register(
              registrationRequestDto: anyNamed('registrationRequestDto')))
          .thenAnswer(
              (_) async => const LoginResponseModel(refresh: '', access: ''));

      // Act
      final result = await authRepository.register(
          registrationRequestDto: registrationRequestDto);

      // Assert
      expect(result, isA<LoginResponseModel>());
      verify(
          mockAuthApi.register(registrationRequestDto: registrationRequestDto));
    });

    test('login calls api.login with correct parameters', () async {
      // Arrange
      const password = 'testpassword';
      const deviceType = 'ios';
      const fcmToken = 'mockFcmToken';

      when(mockAuthApi.login(
        mail: anyNamed('mail'),
        password: anyNamed('password'),
        deviceType: anyNamed('deviceType'),
        fcmToken: anyNamed('fcmToken'),
      )).thenAnswer((_) async => loginResponseModel);

      // Act
      final result = await authRepository.login(
        mail: mail,
        password: password,
        deviceType: deviceType,
        fcmToken: fcmToken,
      );

      // Assert
      expect(result, isA<LoginResponseModel>());
      verify(mockAuthApi.login(
        mail: mail,
        password: password,
        deviceType: deviceType,
        fcmToken: fcmToken,
      ));
    });

    test('refreshToken calls api.refreshToken with correct parameters',
        () async {
      // Arrange

      when(mockAuthApi.refreshToken(any))
          .thenAnswer((_) async => loginResponseModel);

      // Act
      final result = await authRepository.refreshToken('mockRefreshToken');

      // Assert
      expect(result, isA<LoginResponseModel>());
      verify(mockAuthApi.refreshToken('mockRefreshToken'));
    });

    test('resetPassword calls api.resetPassword with correct parameter',
        () async {
      // Arrange
      const newPassword = 'newTestPassword';

      // Act
      await authRepository.resetPassword(newPassword);

      // Assert
      verify(mockAuthApi.resetPassword(newPassword));
    });
  });

  group('Social', () {
    test('loginWithApple calls api.loginWithApple with correct parameters',
        () async {
      // Arrange
      when(mockAuthApi.loginWithApple(
        token: token,
        deviceType: deviceType,
        fcmToken: fcmToken,
      )).thenAnswer((_) async => loginResponseModel);

      // Act
      final result = await authRepository.loginWithApple(
        token: token,
        deviceType: deviceType,
        fcmToken: fcmToken,
      );

      // Assert
      expect(result, isA<LoginResponseModel>());
      verify(mockAuthApi.loginWithApple(
        token: token,
        deviceType: deviceType,
        fcmToken: fcmToken,
      ));
    });

    test('loginWithGoogle calls api.loginWithGoogle with correct parameters',
        () async {
      // Arrange
      const loginGoogleRequest = LoginGoogleRequest(
        id: 'mockGoogleIdToken',
        email: 'mockFcmToken',
        displayName: 'ios',
        fcmToken: 'mockFcmToken',
        deviceType: 'ios',
      );

      when(mockAuthApi.loginWithGoogle(any))
          .thenAnswer((_) async => loginResponseModel);

      // Act
      final result = await authRepository.loginWithGoogle(loginGoogleRequest);

      // Assert
      expect(result, isA<LoginResponseModel>());
      verify(mockAuthApi.loginWithGoogle(loginGoogleRequest));
    });
  });

  group('Email', () {
    test('sendEmail calls api.sendEmail with correct parameters', () async {
      // Arrange
      when(mockAuthApi.sendEmail(any)).thenAnswer(
        (_) async => sendEmailResponse,
      );

      // Act
      final result = await authRepository.sendEmail(mail);

      // Assert
      expect(result, isA<SendEmailResponse>());
      verify(mockAuthApi.sendEmail(mail));
    });

    test(
        'getVerificationCode calls api.getVerificationCode with correct parameters',
        () async {
      // Act
      await authRepository.getVerificationCode(mail);

      // Assert
      verify(mockAuthApi.getVerificationCode(mail));
    });

    test(
        'confirmMailVerification calls api.confirmMailVerification with correct parameters',
        () async {
      // Arrange
      when(mockAuthApi.confirmMailVerification(
        mail: mail,
        code: code,
      )).thenAnswer((_) async => token);

      // Act
      await authRepository.confirmMailVerification(mail: mail, code: code);

      // Assert
      verify(mockAuthApi.confirmMailVerification(mail: mail, code: code));
    });
  });

  group('Token', () {
    test('setToken calls localStorage.setToken with correct parameter', () {
      // Act
      authRepository.setToken(token);

      // Assert
      verify(mockAuthLocalStorage.setToken(token));
    });

    test('getToken calls localStorage.getToken', () {
      // Arrange
      when(mockAuthLocalStorage.getToken()).thenReturn('mockToken');

      // Act
      final result = authRepository.getToken();

      // Assert
      expect(result, 'mockToken');
      verify(mockAuthLocalStorage.getToken());
    });
  });

  group('Refresh Token', () {
    test(
        'setRefreshToken calls localStorage.setRefreshToken with correct parameter',
        () {
      // Act
      authRepository.setRefreshToken(refreshToken);

      // Assert
      verify(mockAuthLocalStorage.setRefreshToken(refreshToken));
    });

    test('getRefreshToken calls localStorage.getRefreshToken', () {
      // Arrange
      when(mockAuthLocalStorage.getRefreshToken())
          .thenReturn('mockRefreshToken');

      // Act
      final result = authRepository.getRefreshToken();

      // Assert
      expect(result, 'mockRefreshToken');
      verify(mockAuthLocalStorage.getRefreshToken());
    });
  });

  group('User Status', () {
    test(
        'setUserStatus calls localStorage.setUserStatus with correct parameter',
        () {
      // Act
      authRepository.setUserStatus(userStatus);

      // Assert
      verify(mockAuthLocalStorage.setUserStatus(userStatus));
    });

    test('getUserStatus calls localStorage.getUserStatus', () {
      // Arrange
      when(mockAuthLocalStorage.getUserStatus()).thenReturn(userStatus);

      // Act
      final result = authRepository.getUserStatus();

      // Assert
      expect(result, userStatus);
      verify(mockAuthLocalStorage.getUserStatus());
    });
  });

  group('Delete User', () {
    test('deleteUser calls api.deleteUser', () async {
      // Act
      await authRepository.deleteUser();

      // Assert
      verify(mockAuthApi.deleteUser());
    });

    test('verifyDeleteUser calls api.verifyDeleteUser with correct parameter',
        () async {
      // Act
      await authRepository.verifyDeleteUser(code);

      // Assert
      verify(mockAuthApi.verifyDeleteUser(code));
    });
  });
}
