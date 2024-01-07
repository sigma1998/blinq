// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/breakdown_api.dart';
import 'package:blinq/data/model/report/report_time_and_location/report_time_and_location.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'breakdown_repository_test.mocks.dart';

@GenerateMocks([BreakdownApi])
void main() {
  late MockBreakdownApi mockBreakdownApi;
  late BreakdownRepository breakdownRepository;

  const breakdownId = 1;

  const reportTimeAndLocationDto = ReportTimeAndLocationDto(
    country: 'test',
    location: 'test',
    createdAt: '22.04.2023',
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

    // @override
    // Future<void> breakdownInitialImpactPoint(
    //     int breakdownId, MultipartFile image) async {
    //   try {
    //     return await breakdownApi.breakdownInitialImpactPoint(
    //         breakdownId, image);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> breakdownInjury(int breakdownId, InjuryDto injuryDto) async {
    //   try {
    //     return await breakdownApi.breakdownInjury(breakdownId, injuryDto);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> breakdownWitnesses(int breakdownId, String witnesses) async {
    //   try {
    //     return await breakdownApi.breakdownWitnesses(breakdownId, witnesses);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<int> createBreakdown(String long, String lat) async {
    //   try {
    //     return await breakdownApi.createBreakdown(long, lat);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> damagedPoints(
    //     {required MultipartFile? top,
    //     required MultipartFile? front,
    //     required MultipartFile? back,
    //     required MultipartFile? left,
    //     required MultipartFile? right,
    //     required int breakdownId,
    //     required List<String> damageParts}) async {
    //   try {
    //     return await breakdownApi.damagedPoints(
    //         breakdownId: breakdownId,
    //         top: top,
    //         front: front,
    //         right: right,
    //         left: left,
    //         back: back,
    //         damageParts: damageParts);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> deactivateBreakdown(int breakdownId) async {
    //   try {
    //     return await breakdownApi.deactivateBreakdown(breakdownId);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<String> getBreakdownStep(int breakdownId) async {
    //   try {
    //     return await breakdownApi.getBreakdownStep(breakdownId);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<String> getPdf(int breakdownId) async {
    //   try {
    //     return await breakdownApi.getPdf(breakdownId);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> myRemarks(int breakdownId, String myRemarks) async {
    //   try {
    //     return await breakdownApi.myRemarks(breakdownId, myRemarks);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> sendCircumstances(
    //     {required int breakdownId, required List<String> list}) async {
    //   try {
    //     return await breakdownApi.sendCircumstances(
    //         list: list, breakdownId: breakdownId);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> sign(int breakdownId, MultipartFile sign) async {
    //   try {
    //     return await breakdownApi.sign(breakdownId, sign);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> uploadBreakdownSketch(
    //     {required int breakdownId, required MultipartFile sketch}) async {
    //   try {
    //     return await breakdownApi.uploadBreakdownSketch(
    //         sketch: sketch, breakdownId: breakdownId);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<int> uploadFile({required MultipartFile file}) async {
    //   try {
    //     return await breakdownApi.uploadFile(file: file);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> uploadMedia(int breakdownId, List<int> uploadedFilesId) async {
    //   try {
    //     return await breakdownApi.uploadMedia(breakdownId, uploadedFilesId);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> visibleDamage(int breakdownId, String visibleDamage) async {
    //   try {
    //     return await breakdownApi.visibleDamage(breakdownId, visibleDamage);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }
  });
}
