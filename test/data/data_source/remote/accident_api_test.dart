// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/datasource/remote/accident_api.dart';
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/report/injury/injury.dart';
import 'package:blinq/data/model/report/report_time_and_location/report_time_and_location.dart';
import 'accident_api_test.mocks.dart';

@GenerateMocks([AppApi])
void main() {
  late MockAppApi mockApiService;
  late AccidentApi accidentApi;

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

  setUp(() {
    mockApiService = MockAppApi();
    accidentApi = AccidentApiImpl(api: mockApiService);
  });

  group('Accident', () {
    test('should call fetchUserById with correct parameters', () async {
      // Arrange
      when(mockApiService.get(any))
          .thenAnswer((_) async => profileResponseModel.toJson());

      // Act
      final result = await accidentApi.fetchUserById(1);

      // Assert
      expect(result, isA<ProfileResponseModel>());
      verify(mockApiService.get(NetworkConstants.getDriverB(1)));
    });

    test('should call addDriverB with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => profileResponseModel.toJson());

      // Act
      await accidentApi.addDriverB(
        accidentId: accidentId,
        secondDriverId: 2,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.connectBDriver(1),
        data: {'user': 2},
      ));
    });

    test('should call createAccident with correct parameters', () async {
      // Arrange
      const long = '41.3111';
      const lat = '69.2796';
      when(mockApiService.post(
        NetworkConstants.createAccident,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {'accident_id': accidentId});

      // Act
      final result = await accidentApi.createAccident(long, lat);

      // Assert
      expect(result, accidentId);
      verify(mockApiService.post(
        NetworkConstants.createAccident,
        data: {'long': long, 'lat': lat},
      ));
    });

    test('should call addAccidentLocationAndTime with correct parameters',
        () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await accidentApi.addAccidentLocationAndTime(
        accidentId,
        accidentTimeAndLocationDto,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.accidentTimeAndPlace(accidentId),
        data: accidentTimeAndLocationDto.toJson(),
      ));
    });

    test('should call uploadAccidentSketch with correct parameters', () async {
      // Arrange
      final sketch = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      when(mockApiService.patch(
        NetworkConstants.accidentSketch(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.uploadAccidentSketch(
        accidentId: accidentId,
        sketch: sketch,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.accidentSketch(accidentId),
        data: anyNamed('data'),
      ));
    });

    test('should call sendCircumstances with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.accidentCircumstances(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.sendCircumstances(
        accidentId: accidentId,
        a: ['a'],
        b: ['b'],
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.accidentCircumstances(accidentId),
        data: {
          'circumstance': {
            'A': ['a'],
            'B': ['b']
          }
        },
      ));
    });
  });

  group('Accident Driver A', () {
    test('should call accidentImpactPoint with correct parameters', () {
      // Arrange
      final impactPoint = MultipartFile.fromFileSync(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.patch(
        NetworkConstants.initialImpactPoint(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      accidentApi.accidentInitialImpactPoint(
        accidentId,
        impactPoint,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.initialImpactPoint(accidentId),
        data: anyNamed('data'),
      ));
    });

    test('should call accidentInjury with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await accidentApi.accidentInjury(accidentId, injuryDto);

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.injury(accidentId),
        data: injuryDto.toJson(),
      ));
    });

    test('should call accidentWitnesses with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.witnesses(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.accidentWitnesses(accidentId, 'witnesses');

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.witnesses(accidentId),
        data: {'witness': 'witnesses'},
      ));
    });

    test('should call visibleDamage with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.visibleDamage(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.visibleDamage(accidentId, 'visibleDamage');

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.visibleDamage(accidentId),
        data: {'visible_damage': 'visibleDamage'},
      ));
    });

    test('should call myRemarks with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.myRemarks(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.myRemarks(accidentId, 'myRemarks');

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.myRemarks(accidentId),
        data: {'remarks': 'myRemarks'},
      ));
    });

    test('should call damagedPoints with correct parameters', () async {
      // Arrange
      final top = MultipartFile.fromFileSync(file.path,
          filename: file.path.split('/').last);
      final front = MultipartFile.fromFileSync(file.path,
          filename: file.path.split('/').last);
      final back = MultipartFile.fromFileSync(file.path,
          filename: file.path.split('/').last);
      final left = MultipartFile.fromFileSync(file.path,
          filename: file.path.split('/').last);
      final right = MultipartFile.fromFileSync(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.patch(
        NetworkConstants.damagePoints(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.damagedPoints(
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        accidentId: accidentId,
        damageParts: ['damageParts'],
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.damagePoints(accidentId),
        data: anyNamed('data'),
      ));
    });
  });

  group('Accident Driver B', () {
    test('should call connectToNoBlinqDriver with correct parameters',
        () async {
      // Arrange
      when(mockApiService.post(
        NetworkConstants.connectToNoBlinqDriver(accidentId),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.connectToNoBlinqDriver(accidentId);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.connectToNoBlinqDriver(accidentId),
      ));
    });

    test('should call accidentInitialImpactPointB', () async {
      // Arrange
      final image = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.patch(
        NetworkConstants.initialImpactPointB(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.accidentInitialImpactPointB(
        accidentId,
        image,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.initialImpactPointB(accidentId),
        data: anyNamed('data'),
      ));
    });

    test('should call accidentInjuryB', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.injuryB(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.accidentInjuryB(
        accidentId,
        injuryDto,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.injuryB(accidentId),
        data: injuryDto.toJson(),
      ));
    });

    test('should call accidentWitnessesB with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.witnessesB(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.accidentWitnessesB(
        accidentId,
        'witnesses',
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.witnessesB(accidentId),
        data: {'witness': 'witnesses'},
      ));
    });

    test('should call visibleDamageB with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.visibleDamageB(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.visibleDamageB(
        accidentId,
        'visibleDamage',
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.visibleDamageB(accidentId),
        data: {'visible_damage': 'visibleDamage'},
      ));
    });

    test('should call myRemarksB with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.myRemarksB(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.myRemarksB(
        accidentId,
        'myRemarks',
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.myRemarksB(accidentId),
        data: {'remarks': 'myRemarks'},
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

      when(mockApiService.patch(
        NetworkConstants.damagePointsB(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.damagedPointsB(
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        accidentId: accidentId,
        damageParts: ['damageParts'],
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.damagePointsB(accidentId),
        data: anyNamed('data'),
      ));
    });

    test('should call uploadFile with correct parameters', () async {
      // Arrange
      final image = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.post(
        NetworkConstants.uploadFile,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {'id': 1});

      // Act
      final result = await accidentApi.uploadFile(file: image);

      // Assert
      expect(result, 1);
      verify(mockApiService.post(
        NetworkConstants.uploadFile,
        data: anyNamed('data'),
      ));
    });

    test('should call uploadMedia with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.uploadMedia(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.uploadMedia(
        accidentId,
        [1],
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.uploadMedia(accidentId),
        data: anyNamed('data'),
      ));
    });

    test('should call uploadMediaB with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.uploadMediaB(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.uploadMediaB(
        accidentId,
        [1],
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.uploadMediaB(accidentId),
        data: anyNamed('data'),
      ));
    });

    test('should call sign with correct parameters', () async {
      // Arrange
      final sign = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.patch(
        NetworkConstants.sign(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.sign(
        accidentId,
        sign,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.sign(accidentId),
        data: anyNamed('data'),
      ));
    });

    test('should call signB with correct parameters', () async {
      // Arrange
      final sign = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.patch(
        NetworkConstants.signB(accidentId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await accidentApi.signB(
        accidentId,
        sign,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.signB(accidentId),
        data: anyNamed('data'),
      ));
    });

    test('should call downloadFile with correct parameters', () async {
      // Arrange
      const path = 'test';
      const url = 'test';
      when(mockApiService.download(any, any)).thenAnswer((_) async => {});

      // Act
      await accidentApi.downloadFile(
        path: path,
        url: url,
      );

      // Assert
      verify(mockApiService.download(url, path));
    });
  });

  test('should call getPdf with correct parameters', () async {
    // Arrange
    const accidentDocumentPdf = 'test';
    when(mockApiService.get(any)).thenAnswer(
        (_) async => {'accident_document_pdf': accidentDocumentPdf});

    // Act
    final result = await accidentApi.getPdf(accidentId);

    // Assert
    expect(result, accidentDocumentPdf);
    verify(mockApiService.get(
      NetworkConstants.getAccidentPdf(accidentId),
    ));
  });

  test('should call sendToInsurance with correct parameters', () async {
    // Arrange
    when(mockApiService.get(
      NetworkConstants.sendToInsurance,
      queryParameters: {'id': accidentId},
    )).thenAnswer((_) async => {});

    // Act
    await accidentApi.sendToInsurance(accidentId);

    // Assert
    verify(mockApiService.get(
      NetworkConstants.sendToInsurance,
      queryParameters: {'id': accidentId},
    ));
  });

  test('should call getAccidentStep with correct parameters', () async {
    // Arrange
    const endpoint = 'test';
    when(mockApiService.get(any))
        .thenAnswer((_) async => {'endpoint': endpoint});

    // Act
    final result = await accidentApi.getAccidentStep(accidentId);

    // Assert
    expect(result, endpoint);
    verify(mockApiService.get(NetworkConstants.accidentStatus(accidentId)));
  });
}
