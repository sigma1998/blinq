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
import 'package:blinq/data/datasource/remote/breakdown_api.dart';
import 'package:blinq/data/model/report/injury/injury.dart';
import 'package:blinq/data/model/report/report_time_and_location/report_time_and_location.dart';
import 'accident_api_test.mocks.dart';

@GenerateMocks([AppApi])
void main() {
  late MockAppApi mockApiService;
  late BreakdownApi breakdownApi;

  const breakdownId = 1;

  final file = File('assets/images/error_profile_image.png');

  const reportTimeAndLocationDto = ReportTimeAndLocationDto(
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
    breakdownApi = BreakdownApiImpl(api: mockApiService);
  });

  group('Breakdown Api', () {
    test('should call addBreakdownLocationAndTime with correct parameters',
        () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await breakdownApi.addBreakdownLocationAndTime(
        breakdownId,
        reportTimeAndLocationDto,
      );

      // Assert
      verify(mockApiService.patch(any, data: anyNamed('data')));
    });

    test('should call breakdownInitialImpactPoint with correct parameters',
        () async {
      // Arrange
      final image = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.patch(
        NetworkConstants.initialImpactPointBreakdown(breakdownId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await breakdownApi.breakdownInitialImpactPoint(
        breakdownId,
        image,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.initialImpactPointBreakdown(breakdownId),
        data: anyNamed('data'),
      ));
    });

    test('should call breakdownInjury with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await breakdownApi.breakdownInjury(
        breakdownId,
        injuryDto,
      );

      // Assert
      verify(mockApiService.patch(any, data: anyNamed('data')));
    });

    test('should call breakdownWitnesses with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await breakdownApi.breakdownWitnesses(
        breakdownId,
        'test',
      );

      // Assert
      verify(mockApiService.patch(any, data: anyNamed('data')));
    });

    test('should call createBreakdown with correct parameters', () async {
      // Arrange
      const long = '41.3111';
      const lat = '69.2796';
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => {'breakdown_id': breakdownId});

      // Act
      final result = await breakdownApi.createBreakdown(long, lat);

      // Assert
      expect(result, breakdownId);
      verify(mockApiService.post(any, data: anyNamed('data')));
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

      when(mockApiService.patch(
        NetworkConstants.damagePointsBreakdown(breakdownId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await breakdownApi.damagedPoints(
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        breakdownId: breakdownId,
        damageParts: ['test'],
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.damagePointsBreakdown(breakdownId),
        data: anyNamed('data'),
      ));
    });

    test('should call deactivateBreakdown with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await breakdownApi.deactivateBreakdown(breakdownId);

      // Assert
      verify(mockApiService.patch(any, data: anyNamed('data')));
    });

    test('should call getBreakdownStep with correct parameters', () async {
      // Arrange
      const endpoint = 'test';
      when(mockApiService.get(any))
          .thenAnswer((_) async => {'endpoint': endpoint});

      // Act
      final result = await breakdownApi.getBreakdownStep(breakdownId);

      // Assert
      expect(result, endpoint);
      verify(mockApiService.get(
        NetworkConstants.getBreakdownStatus(breakdownId),
      ));
    });

    test('should call getPdf with correct parameters', () async {
      // Arrange
      const accidentDocumentPdf = 'test';
      when(mockApiService.get(any)).thenAnswer(
          (_) async => {'accident_document_pdf': accidentDocumentPdf});

      // Act
      final result = await breakdownApi.getPdf(breakdownId);

      // Assert
      expect(result, accidentDocumentPdf);
      verify(mockApiService.get(
        NetworkConstants.getBreakdownPdf(breakdownId),
      ));
    });

    test('should call myRemarks with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await breakdownApi.myRemarks(
        breakdownId,
        'test',
      );

      // Assert
      verify(mockApiService.patch(any, data: anyNamed('data')));
    });

    test('should call sendCircumstances with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(
        NetworkConstants.breakdownCircumstances(breakdownId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await breakdownApi.sendCircumstances(
        breakdownId: breakdownId,
        list: ['test'],
      );

      // Assert
      verify(mockApiService
          .patch(NetworkConstants.breakdownCircumstances(breakdownId), data: {
        'circumstance': {
          'A': ['test']
        }
      }));
    });

    test('should call sign with correct parameters', () async {
      // Arrange
      final sign = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.patch(
        NetworkConstants.signBreakdown(breakdownId),
        data: anyNamed('data'),
      )).thenAnswer((_) async => {});

      // Act
      await breakdownApi.sign(
        breakdownId,
        sign,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.signBreakdown(breakdownId),
        data: anyNamed('data'),
      ));
    });

    test('should call uploadBreakdownSketch with correct parameters', () async {
      // Arrange
      final sketch = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await breakdownApi.uploadBreakdownSketch(
        breakdownId: breakdownId,
        sketch: sketch,
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.breakdownSketch(breakdownId),
        data: anyNamed('data'),
      ));
    });

    test('should call uploadFile with correct parameters', () async {
      // Arrange
      final image = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);

      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => {'id': 1});

      // Act
      await breakdownApi.uploadFile(file: image);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.uploadFile,
        data: anyNamed('data'),
      ));
    });

    test('should call uploadMedia with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await breakdownApi.uploadMedia(
        breakdownId,
        [1, 2, 3],
      );

      // Assert
      verify(mockApiService.patch(
        NetworkConstants.uploadMediaBreakdown(breakdownId),
        data: {
          'file_ids': [1, 2, 3]
        },
      ));
    });

    test('should call visibleDamage with correct parameters', () async {
      // Arrange
      when(mockApiService.patch(any, data: anyNamed('data')))
          .thenAnswer((_) async => {});

      // Act
      await breakdownApi.visibleDamage(
        breakdownId,
        'test',
      );

      // Assert
      verify(mockApiService.patch(any, data: anyNamed('data')));
    });
  });
}
