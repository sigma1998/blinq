// Project imports:

import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/accident/accident_time_and_location/accident_time_and_location.dart';
import 'package:blinq/data/model/accident/injury/injury.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:dio/dio.dart';

abstract class AccidentApi {
  //
  Future<ProfileResponseModel> fetchUserById(int id);

  Future<int> createAccident(String long, String lat);

  Future<void> adAccidentLocationAndTime(
      int accidentId, AccidentTimeAndLocationDto accidentTimeAndLocationDto);

  Future<int> uploadFile({required MultipartFile file});

  Future<void> uploadAccidentSketch(
      {required int accidentId, required MultipartFile sketch});

  ///for driver a
  Future<void> accidentInjury(int accidentId, InjuryDto injuryDto);

  Future<void> accidentWitnesses(int accidentId, String witnesses);

  Future<void> accidentInitialImpactPoint(int accidentId, MultipartFile image);

  Future<void> visibleDamage(int accidentId, String visibleDamage);

  Future<void> myRemarks(int accidentId, String visibleDamage);

  Future<void> damagedPoints(
      {required MultipartFile? top,
      required MultipartFile? front,
      required MultipartFile? back,
      required MultipartFile? left,
      required MultipartFile? right,
      required int accidentId,
      required List<String> damageParts});

  Future<void> uploadMedia(int accidentId, List<int> uploadedFilesId);

  ///for driver b
  Future<void> accidentInjuryB(int accidentId, InjuryDto injuryDto);

  Future<void> accidentWitnessesB(int accidentId, String witnesses);

  Future<void> accidentInitialImpactPointB(int accidentId, MultipartFile image);

  Future<void> visibleDamageB(int accidentId, String visibleDamage);

  Future<void> myRemarksB(int accidentId, String visibleDamage);

  Future<void> damagedPointsB(
      {required MultipartFile? top,
      required MultipartFile? front,
      required MultipartFile? back,
      required MultipartFile? left,
      required MultipartFile? right,
      required int accidentId,
      required List<String> damageParts});

  Future<void> uploadMediaB(int accidentId, List<int> uploadedFilesId);
}

class AccidentApiImpl implements AccidentApi {
  //
  final AppApi api;

  AccidentApiImpl({required this.api});

  @override
  Future<ProfileResponseModel> fetchUserById(int id) async {
    try {
      final res = await api.get('${NetworkConstants.secondDriver}$id/');
      return ProfileResponseModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> createAccident(String long, String lat) async {
    try {
      final res = await api.post(NetworkConstants.createReport,
          data: {'long': long, 'lat': lat});

      return res['accident_id'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> adAccidentLocationAndTime(int accidentId,
      AccidentTimeAndLocationDto accidentTimeAndLocationDto) async {
    try {
      await api.patch(NetworkConstants.accidentTimeAndPlace(accidentId),
          data: accidentTimeAndLocationDto.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> uploadAccidentSketch(
      {required int accidentId, required MultipartFile sketch}) async {
    try {
      await api.patch(NetworkConstants.accidentSketch(accidentId),
          data: FormData.fromMap({'sketch': sketch}));
    } catch (e) {
      rethrow;
    }
  }

  /// for driver A
  @override
  Future<void> accidentInitialImpactPoint(
      int accidentId, MultipartFile image) async {
    try {
      await api.patch(NetworkConstants.initialImpactPoint(accidentId),
          data: FormData.fromMap({'impact_to_vehicle': image}));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentInjury(int accidentId, InjuryDto injuryDto) async {
    try {
      await api.patch(NetworkConstants.injury(accidentId),
          data: injuryDto.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentWitnesses(int accidentId, String witnesses) async {
    try {
      await api.patch(NetworkConstants.witnesses(accidentId),
          data: {'witness': witnesses});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> visibleDamage(int accidentId, String visibleDamage) async {
    try {
      await api.patch(NetworkConstants.visibleDamage(accidentId),
          data: {'visible_damage': visibleDamage});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> myRemarks(int accidentId, String myRemarks) async {
    try {
      await api.patch(NetworkConstants.myRemarks(accidentId),
          data: {'remarks': myRemarks});
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
      final data = FormData.fromMap({
        'top': top,
        'back': back,
        'left': left,
        'right': right,
        'front': front,
        'damage_parts': {'list':damageParts}
      });

      await api.patch(NetworkConstants.damagePoints(accidentId), data: data);
    } catch (e) {
      rethrow;
    }
  }

  /// for driver B
  @override
  Future<void> accidentInitialImpactPointB(
      int accidentId, MultipartFile image) async {
    try {
      await api.patch(NetworkConstants.initialImpactPointB(accidentId),
          data: FormData.fromMap({'impact_to_vehicle': image}));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentInjuryB(int accidentId, InjuryDto injuryDto) async {
    try {
      await api.patch(NetworkConstants.injuryB(accidentId),
          data: injuryDto.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentWitnessesB(int accidentId, String witnesses) async {
    try {
      await api.patch(NetworkConstants.witnessesB(accidentId),
          data: {'witness': witnesses});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> visibleDamageB(int accidentId, String visibleDamage) async {
    try {
      await api.patch(NetworkConstants.visibleDamageB(accidentId),
          data: {'visible_damage': visibleDamage});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> myRemarksB(int accidentId, String myRemarks) async {
    try {
      await api.patch(NetworkConstants.myRemarksB(accidentId),
          data: {'remarks': myRemarks});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> damagedPointsB(
      {required MultipartFile? top,
      required MultipartFile? front,
      required MultipartFile? back,
      required MultipartFile? left,
      required MultipartFile? right,
      required int accidentId,
      required List<String> damageParts}) async {
    try {
      final data = FormData.fromMap({
        'top': top,
        'front': front,
        'back': back,
        'left': left,
        'right': right,
        'damage_parts': {'list':damageParts}
      });
      await api.patch(NetworkConstants.damagePointsB(accidentId), data: data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> uploadFile({required MultipartFile file}) async {
    try {
      final formData = FormData.fromMap({'file': file});
      final res = await api.post(NetworkConstants.uploadFile, data: formData);
      return res['id'] as int;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> uploadMedia(int accidentId, List<int> uploadedFilesId) async {
    try {
      await api.patch(NetworkConstants.uploadMedia(accidentId), data: {
        'file_ids': uploadedFilesId,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> uploadMediaB(int accidentId, List<int> uploadedFilesId) async {
    try {
      await api.patch(NetworkConstants.uploadMediaB(accidentId), data: {
        'file_ids': uploadedFilesId,
      });
    } catch (e) {
      rethrow;
    }
  }
}
