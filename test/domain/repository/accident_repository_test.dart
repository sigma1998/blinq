// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/accident_api.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/report/injury/injury.dart';
import 'package:blinq/data/model/report/report_time_and_location/report_time_and_location.dart';
import 'package:blinq/data/model/second_driver/car/request/second_driver_car_request_model.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'accident_repository_test.mocks.dart';

@GenerateMocks([AccidentApi])
void main() {
  late MockAccidentApi mockAccidentApi;
  late AccidentRepository accidentRepository;

  const accidentId = 1;

  final file = File('assets/images/error_profile_image.png');

  const profileResponseModel = ProfileResponseModel(
    firstName: 'test',
    lastName: 'test',
    birthDate: '22.04.2005',
    country: 'test',
    address: 'test',
    phoneNumber: '998999999999',
    email: 'test@test.com',
    qrCode: 'test',
    driverLicense: DriverLicenseType.a,
    driverLicenseNumber: 'test',
    driverLicenseExpiredDate: 'test',
  );

  const accidentTimeAndLocationDto = ReportTimeAndLocationDto(
    country: 'test',
    location: 'test',
    createdAt: '22.04.2023',
  );

  const injuryDto = InjuryDto(
    injury: true,
    otherDamagedVehicles: true,
    otherDamagedItems: true,
  );

  const secondDriverCarRequestModel = SecondDriverCarRequestModel(
    car: 1,
    color: 1,
    modelSeries: 'test',
    mark: 'test',
    makeType: 'test',
    vehicleType: VehicleType.auto,
    engineNumber: 'test',
    countryOfRegistration: 'test',
    trailerRegistrationNumber: 'test',
    trailerCountryOfRegistration: 'test',
  );

  const profileRequestModel = ProfileRequestModel(
    firstName: 'test',
    lastName: 'test',
    birthDate: 'test',
    country: 'test',
    address: 'test',
    phoneNumber: 'test',
    postalCode: 'test',
    driverLicense: DriverLicenseType.a,
    driverLicenseNumber: 'test',
    driverLicenseExpiredDate: 'test',
  );

  const insuranceRequestModel = InsuranceRequestModel(
    name: 'test',
    policyNumber: 'test',
    greenCardNumber: 'test',
    certificateValidFrom: 'test',
    certificateValidTo: 'test',
    agency: 'test',
    address: 'test',
    phoneNumber: 'test',
    email: 'test',
    policyCover: 'test',
    country: 'test',
  );

  const policyHolderRequestModel = PolicyHolderRequestModel(
    firstName: 'test',
    lastName: 'test',
    country: 'test',
    address: 'test',
    postalCode: 'test',
    phoneNumber: 'test',
    email: 'test',
  );

  setUp(() {
    mockAccidentApi = MockAccidentApi();
    accidentRepository = AccidentRepositoryImpl(
      api: mockAccidentApi,
    );
  });

  group('Driver A Accident Repository', () {
    test('should call fetchUserById with correct parameters', () async {
      // Arrange
      when(mockAccidentApi.fetchUserById(any)).thenAnswer(
        (_) async => profileResponseModel,
      );

      // Act
      final result = await accidentRepository.fetchUserById(accidentId);

      // Assert
      verify(mockAccidentApi.fetchUserById(accidentId));
      expect(result, profileResponseModel);
    });

    test('should call addDriverB with correct parameters', () async {
      // Arrange
      when(mockAccidentApi.addDriverB(
        accidentId: anyNamed('accidentId'),
        secondDriverId: anyNamed('secondDriverId'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentRepository.addDriverB(
        accidentId: accidentId,
        secondDriverId: 2,
      );

      // Assert
      verify(mockAccidentApi.addDriverB(
        accidentId: accidentId,
        secondDriverId: 2,
      ));
    });

    test('should call createAccident with correct parameters', () async {
      // Arrange
      const long = '41.3111';
      const lat = '69.2796';
      when(mockAccidentApi.createAccident(long, lat)).thenAnswer(
        (_) async => accidentId,
      );

      // Act
      final result = await accidentRepository.createAccident(long, lat);

      // Assert
      verify(mockAccidentApi.createAccident(long, lat));
      expect(result, accidentId);
    });

    test('should call accidentInitialImpactPoint with correct parameters',
        () async {
      // Arrange
      final impactPoint = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockAccidentApi.accidentInitialImpactPoint(accidentId, impactPoint))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.accidentInitialImpactPoint(
          accidentId, impactPoint);

      // Assert
      verify(
          mockAccidentApi.accidentInitialImpactPoint(accidentId, impactPoint));
    });

    test('should call accidentInitialImpactPointB with correct parameters',
        () async {
      // Arrange
      final impactPoint = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockAccidentApi.accidentInitialImpactPointB(accidentId, impactPoint))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.accidentInitialImpactPointB(
          accidentId, impactPoint);

      // Assert
      verify(
          mockAccidentApi.accidentInitialImpactPointB(accidentId, impactPoint));
    });

    test('should call accidentInjury with correct parameters', () async {
      // Arrange
      when(mockAccidentApi.accidentInjury(any, any))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.accidentInjury(
        accidentId,
        injuryDto,
      );

      // Assert
      verify(mockAccidentApi.accidentInjury(
        accidentId,
        injuryDto,
      ));
    });
  });

  group('Driver B Accident', () {
    test('should call connectToNoBlinqDriver with correct parameters',
        () async {
      // Arrange
      when(mockAccidentApi.connectToNoBlinqDriver(any)).thenAnswer(
        (_) async => {},
      );

      // Act
      await accidentRepository.connectToNoBlinqDriver(accidentId);

      // Assert
      verify(mockAccidentApi.connectToNoBlinqDriver(accidentId));
    });

    test('should call accidentInjuryB with correct parameters', () async {
      // Arrange
      when(mockAccidentApi.accidentInjuryB(any, any))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.accidentInjuryB(accidentId, injuryDto);

      // Assert
      verify(mockAccidentApi.accidentInjuryB(accidentId, injuryDto));
    });

    test('should call accidentWitnesses with correct parameters', () async {
      // Arrange
      const witnesses = 'test';
      when(mockAccidentApi.accidentWitnesses(accidentId, witnesses))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.accidentWitnesses(accidentId, witnesses);

      // Assert
      verify(mockAccidentApi.accidentWitnesses(accidentId, witnesses));
    });

    test('should call addAccidentLocationAndTime with correct parameters',
        () async {
      // Arrange
      when(mockAccidentApi.addAccidentLocationAndTime(
              accidentId, accidentTimeAndLocationDto))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.addAccidentLocationAndTime(
          accidentId, accidentTimeAndLocationDto);

      // Assert
      verify(mockAccidentApi.addAccidentLocationAndTime(
          accidentId, accidentTimeAndLocationDto));
    });

    test('should call accidentSketch with correct parameters', () async {
      // Arrange
      final sketch = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockAccidentApi.uploadAccidentSketch(
              accidentId: accidentId, sketch: sketch))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.accidentSketch(accidentId, sketch);

      // Assert
      verify(mockAccidentApi.uploadAccidentSketch(
        accidentId: accidentId,
        sketch: sketch,
      ));
    });

    test('should call sendCircumstances with correct parameters', () async {
      // Arrange
      const a = ['test'];
      const b = ['test'];
      when(mockAccidentApi.sendCircumstances(
              accidentId: accidentId, a: a, b: b))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.sendCircumstances(
          accidentId: accidentId, a: a, b: b);

      // Assert
      verify(mockAccidentApi.sendCircumstances(
          accidentId: accidentId, a: a, b: b));
    });

    test('should call damagedPoints with correct parameters', () async {
      // Arrange
      final top = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      final front = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      final back = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      final left = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      final right = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      const damageParts = ['test'];

      when(mockAccidentApi.damagedPoints(
        accidentId: accidentId,
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        damageParts: damageParts,
      )).thenAnswer((_) async => {});

      // Act
      await accidentRepository.damagedPoints(
        accidentId: accidentId,
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        damageParts: damageParts,
      );

      // Assert
      verify(mockAccidentApi.damagedPoints(
        accidentId: accidentId,
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        damageParts: damageParts,
      ));
    });

    test('should call damagedPointsB with correct parameters', () async {
      // Arrange
      final top = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      final front = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      final back = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      final left = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      final right = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      const damageParts = ['test'];

      when(mockAccidentApi.damagedPointsB(
        accidentId: accidentId,
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        damageParts: damageParts,
      )).thenAnswer((_) async => {});

      // Act
      await accidentRepository.damagedPointsB(
        accidentId: accidentId,
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        damageParts: damageParts,
      );

      // Assert
      verify(mockAccidentApi.damagedPointsB(
        accidentId: accidentId,
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        damageParts: damageParts,
      ));
    });

    test('should call myRemarks with correct parameters', () async {
      // Arrange
      const visibleDamage = 'test';
      when(mockAccidentApi.myRemarks(accidentId, visibleDamage))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.myRemarks(accidentId, visibleDamage);

      // Assert
      verify(mockAccidentApi.myRemarks(accidentId, visibleDamage));
    });

    test('should call myRemarksB with correct parameters', () async {
      // Arrange
      const visibleDamage = 'test';
      when(mockAccidentApi.myRemarksB(accidentId, visibleDamage))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.myRemarksB(accidentId, visibleDamage);

      // Assert
      verify(mockAccidentApi.myRemarksB(accidentId, visibleDamage));
    });

    test('should call visibleDamage with correct parameters', () async {
      // Arrange
      const visibleDamage = 'test';
      when(mockAccidentApi.visibleDamage(accidentId, visibleDamage))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.visibleDamage(accidentId, visibleDamage);

      // Assert
      verify(mockAccidentApi.visibleDamage(accidentId, visibleDamage));
    });

    test('should call visibleDamageB with correct parameters', () async {
      // Arrange
      const visibleDamage = 'test';
      when(mockAccidentApi.visibleDamageB(accidentId, visibleDamage))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.visibleDamageB(accidentId, visibleDamage);

      // Assert
      verify(mockAccidentApi.visibleDamageB(accidentId, visibleDamage));
    });

    test('should call uploadFile with correct parameters', () async {
      // Arrange
      final image = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockAccidentApi.uploadFile(file: image)).thenAnswer((_) async => 1);

      // Act
      final result = await accidentRepository.uploadFile(file: image);

      // Assert
      verify(mockAccidentApi.uploadFile(file: image));
      expect(result, 1);
    });

    test('should call uploadMedia with correct parameters', () async {
      // Arrange
      const uploadedFilesId = [1, 2, 3];
      when(mockAccidentApi.uploadMedia(accidentId, uploadedFilesId))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.uploadMedia(accidentId, uploadedFilesId);

      // Assert
      verify(mockAccidentApi.uploadMedia(accidentId, uploadedFilesId));
    });

    test('should call uploadMediaB with correct parameters', () async {
      // Arrange
      const uploadedFilesId = [1, 2, 3];
      when(mockAccidentApi.uploadMediaB(accidentId, uploadedFilesId))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.uploadMediaB(accidentId, uploadedFilesId);

      // Assert
      verify(mockAccidentApi.uploadMediaB(accidentId, uploadedFilesId));
    });

    test('should call sign with correct parameters', () async {
      // Arrange
      final sign = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockAccidentApi.sign(accidentId, sign)).thenAnswer((_) async => {});

      // Act
      await accidentRepository.sign(accidentId, sign);

      // Assert
      verify(mockAccidentApi.sign(accidentId, sign));
    });

    test('should call signB with correct parameters', () async {
      // Arrange
      final sign = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockAccidentApi.signB(accidentId, sign)).thenAnswer((_) async => {});

      // Act
      await accidentRepository.signB(accidentId, sign);

      // Assert
      verify(mockAccidentApi.signB(accidentId, sign));
    });

    test('should call downloadFile with correct parameters', () async {
      // Arrange
      const path = 'test';
      const url = 'test';
      when(mockAccidentApi.downloadFile(path: path, url: url))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.downloadFile(path: path, url: url);

      // Assert
      verify(mockAccidentApi.downloadFile(path: path, url: url));
    });

    test('should call getPdf with correct parameters', () async {
      // Arrange
      const accidentDocumentPdf = 'test';
      when(mockAccidentApi.getPdf(accidentId))
          .thenAnswer((_) async => accidentDocumentPdf);

      // Act
      final result = await accidentRepository.getPdf(accidentId);

      // Assert
      verify(mockAccidentApi.getPdf(accidentId));
      expect(result, accidentDocumentPdf);
    });

    test('should call sendToInsurance with correct parameters', () async {
      // Arrange
      when(mockAccidentApi.sendToInsurance(any)).thenAnswer((_) async => {});

      // Act
      await accidentRepository.sendToInsurance(accidentId);

      // Assert
      verify(mockAccidentApi.sendToInsurance(accidentId));
    });

    test('should call getAccidentStep with correct parameters', () async {
      // Arrange
      const accidentStep = 'test';
      when(mockAccidentApi.getAccidentStep(accidentId))
          .thenAnswer((_) async => accidentStep);

      // Act
      final result = await accidentRepository.getAccidentStep(accidentId);

      // Assert
      verify(mockAccidentApi.getAccidentStep(accidentId));
      expect(result, accidentStep);
    });
  });

  group('Update Accident', () {
    test('should call updateCarB with correct parameters', () async {
      // Arrange
      when(mockAccidentApi.updateCarB(accidentId, secondDriverCarRequestModel))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.updateCarB(
          accidentId, secondDriverCarRequestModel);

      // Assert
      verify(
          mockAccidentApi.updateCarB(accidentId, secondDriverCarRequestModel));
    });

    test('should call updateDriverB with correct parameters', () async {
      // Arrange
      when(mockAccidentApi.updateDriverB(accidentId, profileRequestModel))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.updateDriverB(accidentId, profileRequestModel);

      // Assert
      verify(mockAccidentApi.updateDriverB(accidentId, profileRequestModel));
    });

    test('should call updateInsuranceCompanyB with correct parameters',
        () async {
      // Arrange
      when(mockAccidentApi.updateInsuranceCompanyB(
              accidentId, insuranceRequestModel))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.updateInsuranceCompanyB(
          accidentId, insuranceRequestModel);

      // Assert
      verify(mockAccidentApi.updateInsuranceCompanyB(
          accidentId, insuranceRequestModel));
    });

    test('should call updatePolicyHolderB with correct parameters', () async {
      // Arrange
      when(mockAccidentApi.updatePolicyHolderB(
              accidentId, policyHolderRequestModel))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.updatePolicyHolderB(
          accidentId, policyHolderRequestModel);

      // Assert
      verify(mockAccidentApi.updatePolicyHolderB(
          accidentId, policyHolderRequestModel));
    });

    test('should call getSecondDriverVehicleType with correct parameters',
        () async {
      // Arrange
      when(mockAccidentApi.getSecondDriverVehicleType(accidentId))
          .thenAnswer((_) async => VehicleType.auto);

      // Act
      final result =
          await accidentRepository.getSecondDriverVehicleType(accidentId);

      // Assert
      verify(mockAccidentApi.getSecondDriverVehicleType(accidentId));
      expect(result, VehicleType.auto);
    });

    test('should call deactivateAccident with correct parameters', () async {
      // Arrange
      when(mockAccidentApi.deactivateAccident(accidentId))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.deactivateAccident(accidentId);

      // Assert
      verify(mockAccidentApi.deactivateAccident(accidentId));
    });

    test('should call respondToNotification with correct parameters', () async {
      // Arrange
      const isAgree = true;
      when(mockAccidentApi.respondToNotification(
              accidentId: accidentId, isAgree: isAgree))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.respondToNotification(
          accidentId: accidentId, isAgree: isAgree);

      // Assert
      verify(mockAccidentApi.respondToNotification(
          accidentId: accidentId, isAgree: isAgree));
    });

    test('should call sendNotificationToUserB with correct parameters',
        () async {
      // Arrange
      const userId = 1;
      when(mockAccidentApi.sendNotificationToUserB(
              accidentId: accidentId, userId: userId))
          .thenAnswer((_) async => {});

      // Act
      await accidentRepository.sendNotificationToUserB(
          accidentId: accidentId, userId: userId);

      // Assert
      verify(mockAccidentApi.sendNotificationToUserB(
          accidentId: accidentId, userId: userId));
    });
  });
}
