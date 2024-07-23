// Project imports:

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/accident_api.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/report/injury/injury.dart';
import 'package:blinq/data/model/report/report_time_and_location/report_time_and_location.dart';
import 'package:blinq/data/model/second_driver/car/request/second_driver_car_request_model.dart';

abstract class AccidentRepository {
  ///
  /// Remote API
  ///
  Future<ProfileResponseModel> fetchUserById(int id);

  Future<void> addDriverB({
    required int accidentId,
    required int secondDriverId,
  });

  Future<int> createAccident(String long, String lat);

  Future<void> addAccidentLocationAndTime(
    int accidentId,
    ReportTimeAndLocationDto accidentTimeAndLocationDto,
  );

  Future<void> accidentSketch(int accidentId, MultipartFile sketch);

  Future<int> uploadFile({required MultipartFile file});

  Future<void> sendCircumstances({
    required int accidentId,
    required List<String> a,
    required List<String> b,
  });

  ///
  /// Driver A
  ///
  Future<void> accidentInjury(int accidentId, InjuryDto injuryDto);

  Future<void> accidentWitnesses(int accidentId, String witnesses);

  Future<void> accidentInitialImpactPoint(int accidentId, MultipartFile image);

  Future<void> visibleDamage(int accidentId, String visibleDamage);

  Future<void> myRemarks(int accidentId, String visibleDamage);

  Future<void> damagedPoints({
    required MultipartFile? top,
    required MultipartFile? front,
    required MultipartFile? back,
    required MultipartFile? left,
    required MultipartFile? right,
    required int accidentId,
    required List<String> damageParts,
  });

  Future<void> uploadMedia(int accidentId, List<int> uploadedFilesId);

  Future<void> sign(int accidentId, MultipartFile sign);

  ///
  /// Driver B
  ///
  Future<void> connectToNoBlinqDriver(int accidentId);

  Future<void> accidentInjuryB(int accidentId, InjuryDto injuryDto);

  Future<void> accidentWitnessesB(int accidentId, String witnesses);

  Future<void> accidentInitialImpactPointB(int accidentId, MultipartFile image);

  Future<void> visibleDamageB(int accidentId, String visibleDamage);

  Future<void> myRemarksB(int accidentId, String visibleDamage);

  Future<void> damagedPointsB({
    required MultipartFile? top,
    required MultipartFile? front,
    required MultipartFile? back,
    required MultipartFile? left,
    required MultipartFile? right,
    required int accidentId,
    required List<String> damageParts,
  });

  Future<void> uploadMediaB(int accidentId, List<int> uploadedFilesId);

  Future<void> signB(int accidentId, MultipartFile sign);

  Future<String> getPdf(int accidentId);

  Future<void> downloadFile({required String path, required String url});

  Future<void> sendToInsurance(int accidentId);

  Future<String> getAccidentStep(int accidentId);

  Future<void> updateCarB(
    int accidentId,
    SecondDriverCarRequestModel secondDriverCarRequestModel,
  );

  Future<void> updateDriverB(
    int accidentId,
    ProfileRequestModel profileRequestModel,
  );

  Future<void> updatePolicyHolderB(
    int accidentId,
    PolicyHolderRequestModel policyHolderRequestModel,
  );

  Future<void> updateInsuranceCompanyB(
    int accidentId,
    InsuranceRequestModel insuranceRequestModel,
  );

  Future<VehicleType> getSecondDriverVehicleType(int accidentId);

  Future<void> deactivateAccident(int accidentId);

  Future<void> sendNotificationToUserB(
      {required int accidentId, required int userId});

  Future<void> respondToNotification(
      {required int accidentId, required bool isAgree});

  Future<PolicyHolderRequestModel?> sameAsDriver({required int accidentId, required bool sameAsDriver});
}

class AccidentRepositoryImpl implements AccidentRepository {
  //
  final AccidentApi api;

  AccidentRepositoryImpl({required this.api});

  @override
  Future<ProfileResponseModel> fetchUserById(int id) async {
    try {
      return await api.fetchUserById(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addDriverB({
    required int accidentId,
    required int secondDriverId,
  }) async {
    try {
      await api.addDriverB(
        accidentId: accidentId,
        secondDriverId: secondDriverId,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> createAccident(String long, String lat) async {
    try {
      return await api.createAccident(long, lat);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentInitialImpactPoint(
    int accidentId,
    MultipartFile image,
  ) async {
    try {
      return await api.accidentInitialImpactPoint(accidentId, image);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentInitialImpactPointB(
    int accidentId,
    MultipartFile image,
  ) async {
    try {
      return await api.accidentInitialImpactPointB(accidentId, image);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentInjury(int accidentId, InjuryDto injuryDto) async {
    try {
      return await api.accidentInjury(accidentId, injuryDto);
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Driver b
  ///

  @override
  Future<void> connectToNoBlinqDriver(int accidentId) async {
    try {
      return await api.connectToNoBlinqDriver(accidentId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentInjuryB(int accidentId, InjuryDto injuryDto) async {
    try {
      return await api.accidentInjuryB(accidentId, injuryDto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentWitnesses(int accidentId, String witnesses) async {
    try {
      return await api.accidentWitnesses(accidentId, witnesses);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentWitnessesB(int accidentId, String witnesses) async {
    try {
      return await api.accidentWitnesses(accidentId, witnesses);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addAccidentLocationAndTime(int accidentId,
      ReportTimeAndLocationDto accidentTimeAndLocationDto) async {
    try {
      return await api.addAccidentLocationAndTime(
          accidentId, accidentTimeAndLocationDto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentSketch(int accidentId, MultipartFile sketch) async {
    try {
      return await api.uploadAccidentSketch(
          accidentId: accidentId, sketch: sketch);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendCircumstances(
      {required int accidentId,
      required List<String> a,
      required List<String> b}) async {
    try {
      await api.sendCircumstances(accidentId: accidentId, a: a, b: b);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> damagedPoints(
      {required MultipartFile? top,
      required MultipartFile? front,
      required MultipartFile? back,
      required MultipartFile? left,
      required MultipartFile? right,
      required int accidentId,
      required List<String> damageParts}) async {
    try {
      return await api.damagedPoints(
          accidentId: accidentId,
          top: top,
          front: front,
          back: back,
          left: left,
          right: right,
          damageParts: damageParts);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> damagedPointsB({
    required MultipartFile? top,
    required MultipartFile? front,
    required MultipartFile? back,
    required MultipartFile? left,
    required MultipartFile? right,
    required int accidentId,
    required List<String> damageParts,
  }) async {
    try {
      return await api.damagedPointsB(
        accidentId: accidentId,
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        damageParts: damageParts,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> myRemarks(int accidentId, String visibleDamage) async {
    try {
      return await api.myRemarks(accidentId, visibleDamage);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> myRemarksB(int accidentId, String visibleDamage) async {
    try {
      return await api.myRemarksB(accidentId, visibleDamage);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> visibleDamage(int accidentId, String visibleDamage) async {
    try {
      return await api.visibleDamage(accidentId, visibleDamage);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> visibleDamageB(int accidentId, String visibleDamage) async {
    try {
      return await api.visibleDamageB(accidentId, visibleDamage);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> uploadFile({required MultipartFile file}) async {
    try {
      return await api.uploadFile(file: file);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> uploadMedia(int accidentId, List<int> uploadedFilesId) async {
    try {
      return await api.uploadMedia(accidentId, uploadedFilesId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> uploadMediaB(int accidentId, List<int> uploadedFilesId) async {
    try {
      return await api.uploadMediaB(accidentId, uploadedFilesId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sign(int accidentId, MultipartFile sign) async {
    try {
      await api.sign(accidentId, sign);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signB(int accidentId, MultipartFile sign) async {
    try {
      await api.signB(accidentId, sign);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> downloadFile({required String path, required String url}) async {
    try {
      await api.downloadFile(path: path, url: url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getPdf(int accidentId) async {
    try {
      return await api.getPdf(accidentId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendToInsurance(int accidentId) async {
    try {
      await api.sendToInsurance(
        accidentId,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getAccidentStep(int accidentId) async {
    try {
      return await api.getAccidentStep(accidentId);
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Update
  ///

  @override
  Future<void> updateCarB(
    int accidentId,
    SecondDriverCarRequestModel secondDriverCarRequestModel,
  ) async {
    try {
      return await api.updateCarB(accidentId, secondDriverCarRequestModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateDriverB(
    int accidentId,
    ProfileRequestModel profileRequestModel,
  ) async {
    try {
      return await api.updateDriverB(accidentId, profileRequestModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateInsuranceCompanyB(
    int accidentId,
    InsuranceRequestModel insuranceRequestModel,
  ) async {
    try {
      return await api.updateInsuranceCompanyB(
          accidentId, insuranceRequestModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updatePolicyHolderB(
    int accidentId,
    PolicyHolderRequestModel policyHolderRequestModel,
  ) async {
    try {
      return await api.updatePolicyHolderB(
          accidentId, policyHolderRequestModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VehicleType> getSecondDriverVehicleType(int accidentId) async {
    try {
      return await api.getSecondDriverVehicleType(accidentId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deactivateAccident(int accidentId) async {
    try {
      await api.deactivateAccident(accidentId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> respondToNotification(
      {required int accidentId, required bool isAgree}) async {
    try {
      await api.respondToNotification(accidentId: accidentId, isAgree: isAgree);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendNotificationToUserB(
      {required int accidentId, required int userId}) async {
    try {
      await api.sendNotificationToUserB(accidentId: accidentId, userId: userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PolicyHolderRequestModel?> sameAsDriver({required int accidentId, required bool sameAsDriver}) async {
    return await api.sameAsDriver(accidentId: accidentId, sameAsDriver: sameAsDriver);
  }
}
