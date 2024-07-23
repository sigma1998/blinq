// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/data/model/car/request/car_request_model.dart';
import 'package:blinq/data/model/history/history_response_dto.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/vehicle/request/vehicle_request_model.dart';
import 'profile_api_test.mocks.dart';

@GenerateMocks([AppApi])
void main() {
  late MockAppApi mockApiService;
  late ProfileApi profileApi;

  final file = File('assets/images/error_profile_image.png');

  const profileRequestModel = ProfileRequestModel(
    firstName: 'test',
    lastName: 'test',
    birthDate: 'test',
    country: 'test',
    phoneNumber: 'test',
    postalCode: 'test',
    driverLicenseNumber: 'test',
    driverLicenseExpiredDate: 'test',
  );

  const carRequestModel = CarRequestModel();
  const policyHolderRequestModel = PolicyHolderRequestModel();
  const insuranceRequestModel = InsuranceRequestModel();
  const userVehicleRequestModel = UserVehicleRequestModel();

  const profileResponseModel = ProfileResponseModel(
    id: 0,
    image: '',
    firstName: 'test',
    lastName: 'test',
    birthDate: '',
    country: '',
    address: '',
    phoneNumber: '',
    email: '',
    qrCode: '',
    driverLicenseNumber: '',
    driverLicenseExpiredDate: '',
  );

  const historyResponseDto = HistoryResponseDto();

  const reportUrl =
      'https://fra1.digitaloceanspaces.com/blinqimages/accident/accident_BqxWW.pdf';

  setUp(() {
    mockApiService = MockAppApi();
    profileApi = ProfileApiImpl(api: mockApiService);
  });

  group('Profile api calls', () {
    test('should fetch profile with correct parameters', () async {
      // Arrange
      when(mockApiService.get(
        NetworkConstants.profileData,
      )).thenAnswer((_) async => profileResponseModel.toJson());

      // Act
      await profileApi.fetch();

      // Assert
      verify(mockApiService.get(NetworkConstants.profileData));
    });

    test('should update profile with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.profile,
        data: anyNamed('data'),
      )).thenAnswer((_) async => profileResponseModel.toJson());

      // Act
      await profileApi.update(profileRequestModel);

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.profile,
        data: profileRequestModel.toJson(),
      ));
    });

    test('should update profile image with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.profile,
        data: anyNamed('data'),
      )).thenAnswer((_) async => profileResponseModel.toJson());

      // Act
      await profileApi.updateProfileImage(file);

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.profile,
        data: anyNamed('data'),
      ));
    });
  });

  group('Editors api calls', () {
    test('should update policy holder with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.policyHolder,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await profileApi.updatePolicyHolder(policyHolderRequestModel);

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.policyHolder,
        data: policyHolderRequestModel.toJson(),
      ));
    });

    test('should update insurance with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.insurance,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await profileApi.updateInsurance(insuranceRequestModel);

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.insurance,
        data: insuranceRequestModel.toJson(),
      ));
    });

    test('should update user vehicle with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.userVehicle,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await profileApi.updateUserVehicle(userVehicleRequestModel);

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.userVehicle,
        data: userVehicleRequestModel.toJson(),
      ));
    });

    test('should update my car with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.car,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await profileApi.updateMyCar(carRequestModel);

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.car,
        data: carRequestModel.toJson(),
      ));
    });

    test('should update my car with correct parameters', () {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.car,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      profileApi.updateMyCar(carRequestModel);

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.car,
        data: carRequestModel.toJson(),
      ));
    });
  });

  group('Settings api calls', () {
    test('should update email with correct parameters', () async {
      // Arrange
      when(mockApiService.post(
        NetworkConstants.changeEmail,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await profileApi.updateEmail('test');

      // Assert
      verify(mockApiService.post(
        NetworkConstants.changeEmail,
        data: {'email': 'test'},
      ));
    });

    test('should update password with correct parameters', () async {
      // Arrange
      when(mockApiService.post(
        NetworkConstants.changePassword,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await profileApi.updatePassword('test', 'test');

      // Assert
      verify(mockApiService.post(
        NetworkConstants.changePassword,
        data: {'old_password': 'test', 'new_password': 'test'},
      ));
    });

    test('should update language with correct parameters', () async {
      // Arrange
      when(mockApiService.get(
        NetworkConstants.changeLanguage,
        queryParameters: {'lan_code': 'en'},
      )).thenAnswer((_) async => {});

      // Act
      await profileApi.updateLanguage('en');

      // Assert
      verify(mockApiService.get(
        NetworkConstants.changeLanguage,
        queryParameters: {'lan_code': 'en'},
      ));
    });

    test('should verify email with correct parameters', () async {
      // Arrange
      when(mockApiService.post(
        NetworkConstants.verifyEmail,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await profileApi.verifyEmail('5555');

      // Assert
      verify(mockApiService.post(
        NetworkConstants.verifyEmail,
        data: {'verification_code': '5555'},
      ));
    });
  });

  group('Reports api calls', () {
    test('should fetch history with correct parameters', () async {
      // Arrange
      when(mockApiService.get(NetworkConstants.history))
          .thenAnswer((_) async => historyResponseDto.toJson());

      // Act
      await profileApi.fetchHistory();

      // Assert
      verify(mockApiService.get(NetworkConstants.history));
    });

    test('should download report with correct parameters', () async {
      // Arrange
      when(mockApiService.download(
        reportUrl,
        'assets',
        onReceiveProgress: anyNamed('onReceiveProgress'),
      )).thenAnswer((_) async => {});

      // Act
      await profileApi.downloadReport(
        url: reportUrl,
        localPath: 'assets',
      );

      // Assert
      verify(mockApiService.download(
        reportUrl,
        'assets',
        onReceiveProgress: anyNamed('onReceiveProgress'),
      ));
    });

    test('should delete report with correct parameters', () async {
      // Arrange
      when(mockApiService.delete('${NetworkConstants.deleteReport}/1/'))
          .thenAnswer((_) async => {});

      // Act
      await profileApi.deleteReport(1);

      // Assert
      verify(mockApiService.delete('${NetworkConstants.deleteReport}/1/'));
    });
  });
}
