// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/data/model/car/request/car_request_model.dart';
import 'package:blinq/data/model/cheack_account_datas/cheack_account_datas_response.dart';
import 'package:blinq/data/model/history/history_response_dto.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/vehicle/request/vehicle_request_model.dart';
import 'package:blinq/data/model/vehicle_info/brand_response.dart';
import 'package:blinq/data/model/vehicle_info/color_response.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'profile_repository_test.mocks.dart';

@GenerateMocks([ProfileApi])
void main() {
  late MockProfileApi mockApi;
  late ProfileRepository repository;

  const requestModel = ProfileRequestModel();
  const responseModel = ProfileResponseModel();

  final file = File('assets/images/error_profile_image.png');

  const reportUrl =
      'https://fra1.digitaloceanspaces.com/blinqimages/accident/accident_BqxWW.pdf';

  const policyHolderRequestModel = PolicyHolderRequestModel();
  const carRequestModel = CarRequestModel();
  const userVehicleRequestModel = UserVehicleRequestModel();
  const insuranceRequestModel = InsuranceRequestModel();

  setUp(() {
    mockApi = MockProfileApi();
    repository = ProfileRepositoryImpl(api: mockApi);
  });

  group('Profile Repository', () {
    test('fetch should return a ProfileResponseModel', () async {
      // Arrange
      when(mockApi.fetch()).thenAnswer((_) async => responseModel);

      // Act
      final result = await repository.fetch();

      // Assert
      expect(result, isA<ProfileResponseModel>());
      verify(mockApi.fetch());
    });

    test('update should return a ProfileResponseModel', () async {
      // Arrange
      when(mockApi.update(any)).thenAnswer((_) async => responseModel);

      // Act
      final result = await repository.update(requestModel);

      // Assert
      expect(result, isA<ProfileResponseModel>());
      verify(mockApi.update(requestModel));
    });

    test('should call updateProfileImage with correct parameters', () async {
      // Arrange
      when(mockApi.updateProfileImage(file)).thenAnswer((_) async => {});

      // Act
      await repository.updateProfileImage(file);

      // Assert
      verify(mockApi.updateProfileImage(file));
    });
  });

  group('Editors', () {
    test('should call update policy holder with correct parameters', () async {
      // Arrange
      when(mockApi.updatePolicyHolder(policyHolderRequestModel))
          .thenAnswer((_) async => {});

      // Act
      await repository.updatePolicyHolder(policyHolderRequestModel);

      // Assert
      verify(mockApi.updatePolicyHolder(policyHolderRequestModel));
    });

    test('should call updateCar with correct parameters', () async {
      // Arrange
      when(mockApi.updateCar(carRequestModel)).thenAnswer((_) async => {});

      // Act
      await repository.updateCar(carRequestModel);

      // Assert
      verify(mockApi.updateCar(carRequestModel));
    });

    test('should call updateUserVehicle with corrects parameters', () async {
      // Arrange
      when(mockApi.updateUserVehicle(userVehicleRequestModel))
          .thenAnswer((_) async => {});

      // Act
      await repository.updateUserVehicle(userVehicleRequestModel);

      // Assert
      verify(mockApi.updateUserVehicle(userVehicleRequestModel));
    });

    test('updateInsurance should return void', () async {
      // Arrange
      when(mockApi.updateInsurance(insuranceRequestModel))
          .thenAnswer((_) async => {});

      // Act
      await repository.updateInsurance(insuranceRequestModel);

      // Assert
      verify(mockApi.updateInsurance(insuranceRequestModel));
    });

    test('should call update my car with correct parameters', () async {
      // Arrange
      when(mockApi.updateMyCar(carRequestModel)).thenAnswer((_) async => {});

      // Act
      await repository.updateMyCar(carRequestModel);

      // Assert
      verify(mockApi.updateMyCar(carRequestModel));
    });
  });

  group('Settings', () {
    test('should call updateEmail with correct parameters', () async {
      // Arrange
      when(mockApi.updateEmail('email')).thenAnswer((_) async => {});

      // Act
      await repository.updateEmail('email');

      // Assert
      verify(mockApi.updateEmail('email'));
    });

    test('should call updateLanguage with correct parameters', () async {
      // Arrange
      when(mockApi.updateLanguage('en')).thenAnswer((_) async => {});

      // Act
      await repository.updateLanguage('en');

      // Assert
      verify(mockApi.updateLanguage('en'));
    });

    test('should call updatePassword with correct parameters', () async {
      // Arrange
      when(mockApi.updatePassword('oldPassword', 'newPassword'))
          .thenAnswer((_) async => {});

      // Act
      await repository.updatePassword('oldPassword', 'newPassword');

      // Assert
      verify(mockApi.updatePassword('oldPassword', 'newPassword'));
    });

    test('should call verifyEmail with correct parameters', () async {
      // Arrange
      when(mockApi.verifyEmail('code')).thenAnswer((_) async => {});

      // Act
      await repository.verifyEmail('code');

      // Assert
      verify(mockApi.verifyEmail('code'));
    });
  });

  group('Reports', () {
    test('should call fetchHistory with correct parameters', () async {
      // Arrange
      when(mockApi.fetchHistory())
          .thenAnswer((_) async => const HistoryResponseDto());

      // Act
      final result = await repository.fetchHistory();

      // Assert
      expect(result, isA<HistoryResponseDto>());
      verify(mockApi.fetchHistory());
    });

    test('should call downloadReport with correct parameters', () async {
      // Arrange
      when(mockApi.downloadReport(url: reportUrl, localPath: 'asset'))
          .thenAnswer((_) async => {});

      // Act
      await repository.downloadReport(url: reportUrl, localPath: 'asset');

      // Assert
      verify(mockApi.downloadReport(url: reportUrl, localPath: 'asset'));
    });

    test('should call deleteReport with correct parameters', () async {
      // Arrange
      when(mockApi.deleteReport(1)).thenAnswer((_) async => {});

      // Act
      await repository.deleteReport(1);

      // Assert
      verify(mockApi.deleteReport(1));
    });

    test('should call fetchBrands with correct parameters', () async {
      // Arrange
      when(mockApi.fetchBrands(1))
          .thenAnswer((_) async => const BrandResponseDto());

      // Act
      final result = await repository.fetchBrands(1);

      // Assert
      expect(result, isA<BrandResponseDto>());
      verify(mockApi.fetchBrands(1));
    });

    test('should call fetchColors with correct parameters', () async {
      // Arrange
      when(mockApi.fetchColors(1, 1))
          .thenAnswer((_) async => const ColorResponseDto());

      // Act
      final result = await repository.fetchColors(1, 1);

      // Assert
      expect(result, isA<ColorResponseDto>());
      verify(mockApi.fetchColors(1, 1));
    });

    test('should call fetchModels with correct parameters', () async {
      // Arrange
      when(mockApi.fetchModels(1, 1))
          .thenAnswer((_) async => const BrandResponseDto());

      // Act
      final result = await repository.fetchModels(1, 1);

      // Assert
      expect(result, isA<BrandResponseDto>());
      verify(mockApi.fetchModels(1, 1));
    });

    test('should call checkAccountData with correct parameters', () async {
      // Arrange
      when(mockApi.checkAccountData()).thenAnswer(
        (_) async => const CheckAccountResponse(
          account: true,
          car: true,
          insurance: true,
          policyHolder: true,
        ),
      );

      // Act
      final result = await repository.checkAccountData();

      // Assert
      expect(result, isA<CheckAccountResponse>());
      verify(mockApi.checkAccountData());
    });
  });
}
