// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/breakdown_api.dart';
import 'package:blinq/data/model/report/injury/injury.dart';
import 'package:blinq/data/model/report/report_time_and_location/report_time_and_location.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'breakdown_repository_test.mocks.dart';

@GenerateMocks([BreakdownApi])
void main() {
  late MockBreakdownApi mockBreakdownApi;
  late BreakdownRepository breakdownRepository;

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
    mockBreakdownApi = MockBreakdownApi();
    breakdownRepository = BreakdownRepositoryImpl(
      breakdownApi: mockBreakdownApi,
    );
  });

  group('Breakdown Repository', () {
    test('should call addBreakdownLocationAndTime with correct parameters',
        () async {
      // Arrange
      when(mockBreakdownApi.addBreakdownLocationAndTime(any, any))
          .thenAnswer((_) async => {});

      // Act
      await breakdownRepository.addBreakdownLocationAndTime(
        breakdownId,
        reportTimeAndLocationDto,
      );

      // Assert
      verify(mockBreakdownApi.addBreakdownLocationAndTime(
        breakdownId,
        reportTimeAndLocationDto,
      ));
    });

    test('should call breakdownInitialImpactPoint with correct parameters',
        () async {
      // Arrange
      final image = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      when(mockBreakdownApi.breakdownInitialImpactPoint(any, any))
          .thenAnswer((_) async => {});

      // Act
      await breakdownRepository.breakdownInitialImpactPoint(
        breakdownId,
        image,
      );

      // Assert
      verify(mockBreakdownApi.breakdownInitialImpactPoint(
        breakdownId,
        image,
      ));
    });

    test('should call breakdownInjury with correct parameters', () async {
      // Arrange
      when(mockBreakdownApi.breakdownInjury(any, any))
          .thenAnswer((_) async => {});

      // Act
      await breakdownRepository.breakdownInjury(
        breakdownId,
        injuryDto,
      );

      // Assert
      verify(mockBreakdownApi.breakdownInjury(
        breakdownId,
        injuryDto,
      ));
    });

    test('should call breakdownWitnesses with correct parameters', () async {
      // Arrange
      when(mockBreakdownApi.breakdownWitnesses(any, any))
          .thenAnswer((_) async => {});

      // Act
      await breakdownRepository.breakdownWitnesses(
        breakdownId,
        'test',
      );

      // Assert
      verify(mockBreakdownApi.breakdownWitnesses(
        breakdownId,
        'test',
      ));
    });

    test('should call createBreakdown with correct parameters', () async {
      // Arrange
      const long = '41.3111';
      const lat = '69.2796';
      when(mockBreakdownApi.createBreakdown(any, any))
          .thenAnswer((_) async => breakdownId);

      // Act
      await breakdownRepository.createBreakdown(long, lat);

      // Assert
      verify(mockBreakdownApi.createBreakdown(long, lat));
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

      when(mockBreakdownApi.damagedPoints(
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        breakdownId: breakdownId,
        damageParts: ['test'],
      )).thenAnswer((_) async => {});

      // Act
      await breakdownRepository.damagedPoints(
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        breakdownId: breakdownId,
        damageParts: ['test'],
      );

      // Assert
      verify(mockBreakdownApi.damagedPoints(
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        breakdownId: breakdownId,
        damageParts: ['test'],
      ));
    });

    test('should call deactivateBreakdown with correct parameters', () async {
      // Arrange
      when(mockBreakdownApi.deactivateBreakdown(any))
          .thenAnswer((_) async => {});

      // Act
      await breakdownRepository.deactivateBreakdown(breakdownId);

      // Assert
      verify(mockBreakdownApi.deactivateBreakdown(breakdownId));
    });

    test('should call getBreakdownStep with correct parameters', () async {
      // Arrange
      const endpoint = 'test';
      when(mockBreakdownApi.getBreakdownStep(any))
          .thenAnswer((_) async => endpoint);

      // Act
      final result = await breakdownRepository.getBreakdownStep(breakdownId);

      // Assert
      verify(mockBreakdownApi.getBreakdownStep(breakdownId));
      expect(result, endpoint);
    });

    test('should call getPdf with correct parameters', () async {
      // Arrange
      const accidentDocumentPdf = 'test';
      when(mockBreakdownApi.getPdf(any)).thenAnswer((_) async => 'test');

      // Act
      final result = await breakdownRepository.getPdf(breakdownId);

      // Assert
      verify(mockBreakdownApi.getPdf(breakdownId));
      expect(result, accidentDocumentPdf);
    });

    test('should call myRemarks with correct parameters', () async {
      // Arrange
      when(mockBreakdownApi.myRemarks(any, any)).thenAnswer((_) async => {});

      // Act
      await breakdownRepository.myRemarks(breakdownId, 'test');

      // Assert
      verify(mockBreakdownApi.myRemarks(breakdownId, 'test'));
    });

    test('should call sendCircumstances with correct parameters', () async {
      // Arrange
      when(mockBreakdownApi.sendCircumstances(
        breakdownId: breakdownId,
        list: ['test'],
      )).thenAnswer((_) async => {});

      // Act
      await breakdownRepository.sendCircumstances(
        breakdownId: breakdownId,
        list: ['test'],
      );

      // Assert
      verify(mockBreakdownApi.sendCircumstances(
        breakdownId: breakdownId,
        list: ['test'],
      ));
    });

    test('should call sign with correct parameters', () async {
      // Arrange
      final sign = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      when(mockBreakdownApi.sign(any, any)).thenAnswer((_) async => {});

      // Act
      await breakdownRepository.sign(breakdownId, sign);

      // Assert
      verify(mockBreakdownApi.sign(breakdownId, sign));
    });

    test('should call uploadBreakdownSketch with correct parameters', () async {
      // Arrange
      final sketch = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      when(mockBreakdownApi.uploadBreakdownSketch(
        sketch: sketch,
        breakdownId: breakdownId,
      )).thenAnswer((_) async => {});

      // Act
      await breakdownRepository.uploadBreakdownSketch(
        sketch: sketch,
        breakdownId: breakdownId,
      );

      // Assert
      verify(mockBreakdownApi.uploadBreakdownSketch(
        sketch: sketch,
        breakdownId: breakdownId,
      ));
    });

    test('should call uploadFile with correct parameters', () async {
      // Arrange
      final image = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      when(mockBreakdownApi.uploadFile(file: image)).thenAnswer((_) async => 1);

      // Act
      await breakdownRepository.uploadFile(file: image);

      // Assert
      verify(mockBreakdownApi.uploadFile(file: image));
    });

    test('should call uploadMedia with correct parameters', () async {
      // Arrange
      when(mockBreakdownApi.uploadMedia(
        breakdownId,
        [1],
      )).thenAnswer((_) async => {});

      // Act
      await breakdownRepository.uploadMedia(
        breakdownId,
        [1],
      );

      // Assert
      verify(mockBreakdownApi.uploadMedia(
        breakdownId,
        [1],
      ));
    });

    test('should call visibleDamage with correct parameters', () async {
      // Arrange
      when(mockBreakdownApi.visibleDamage(any, any))
          .thenAnswer((_) async => {});

      // Act
      await breakdownRepository.visibleDamage(breakdownId, 'test');

      // Assert
      verify(mockBreakdownApi.visibleDamage(breakdownId, 'test'));
    });
  });
}
