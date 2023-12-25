// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/report/injury/injury.dart';
import 'package:blinq/data/model/report/report_time_and_location/report_time_and_location.dart';

abstract class BreakdownApi {
  Future<int> createBreakdown(String long, String lat);

  Future<String> getBreakdownStep(int breakdownId);

  Future<void> addBreakdownLocationAndTime(
      int breakdownId, ReportTimeAndLocationDto reportTimeAndLocationDto);

  Future<void> sendCircumstances(
      {required int breakdownId, required List<String> list});

  Future<String> getPdf(int breakdownId);

  Future<int> uploadFile({required MultipartFile file});

  Future<void> uploadBreakdownSketch(
      {required int breakdownId, required MultipartFile sketch});

  Future<void> breakdownInjury(int breakdownId, InjuryDto injuryDto);

  Future<void> breakdownWitnesses(int breakdownId, String witnesses);

  Future<void> breakdownInitialImpactPoint(
      int breakdownId, MultipartFile image);

  Future<void> visibleDamage(int breakdownId, String visibleDamage);

  Future<void> myRemarks(int breakdownId, String myRemarks);

  Future<void> damagedPoints(
      {required MultipartFile? top,
      required MultipartFile? front,
      required MultipartFile? back,
      required MultipartFile? left,
      required MultipartFile? right,
      required int breakdownId,
      required List<String> damageParts});

  Future<void> uploadMedia(int breakdownId, List<int> uploadedFilesId);

  Future<void> sign(int breakdownId, MultipartFile sign);

  Future<void> deactivateBreakdown(int breakdownId);
}

class BreakdownApiImpl implements BreakdownApi {
  //
  final AppApi api;

  BreakdownApiImpl({required this.api});

  @override
  Future<void> addBreakdownLocationAndTime(int breakdownId,
      ReportTimeAndLocationDto reportTimeAndLocationDto) async {
    try {
      await api.patch(NetworkConstants.breakdownTimeAndPlace(breakdownId),
          data: reportTimeAndLocationDto.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> breakdownInitialImpactPoint(
      int breakdownId, MultipartFile image) async {
    try {
      await api.patch(NetworkConstants.initialImpactPointBreakdown(breakdownId),
          data: FormData.fromMap({'impact_to_vehicle': image}));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> breakdownInjury(int breakdownId, InjuryDto injuryDto) async {
    try {
      await api.patch(NetworkConstants.injuryBreakdown(breakdownId),
          data: injuryDto.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> breakdownWitnesses(int breakdownId, String witnesses) async {
    try {
      await api.patch(NetworkConstants.witnessesBreakdown(breakdownId),
          data: {'witness': witnesses});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> createBreakdown(String long, String lat) async {
    try {
      final res = await api.post(NetworkConstants.createBreakdown,
          data: {'long': long, 'lat': lat});

      return res['breakdown_id'];
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
      required int breakdownId,
      required List<String> damageParts}) async {
    try {
      String s = '[';
      for (var element in damageParts) {
        s += '"$element",';
      }
      s = s.reverse().replaceFirst(',', '').reverse();
      s += ']';

      final data = FormData.fromMap({
        'top': top,
        'back': back,
        'left': left,
        'right': right,
        'front': front,
        'damage_parts': '{"list": $s}'
      });

      await api.patch(NetworkConstants.damagePointsBreakdown(breakdownId),
          data: data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deactivateBreakdown(int breakdownId) async {
    try {
      await api.patch(NetworkConstants.deactivateBreakdown(breakdownId),
          data: {'status': 'rejected'});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getBreakdownStep(int breakdownId) async {
    try {
      final res = await api.get(NetworkConstants.getBreakdownStatus(breakdownId));
      return res['endpoint'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getPdf(int breakdownId) async {
    try {
      final res = await api.get(NetworkConstants.getBreakdownPdf(breakdownId));
      return res['accident_document_pdf'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> myRemarks(int breakdownId, String myRemarks) async {
    try {
      await api.patch(NetworkConstants.myRemarksBreakdown(breakdownId),
          data: {'remarks': myRemarks});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendCircumstances(
      {required int breakdownId, required List<String> list}) async {
    try {
      await api
          .patch(NetworkConstants.breakdownCircumstances(breakdownId), data: {
        'circumstance': {'A': list}
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sign(int breakdownId, MultipartFile sign) async {
    try {
      await api.patch(NetworkConstants.signBreakdown(breakdownId),
          data: FormData.fromMap({'sign': sign}));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> uploadBreakdownSketch(
      {required int breakdownId, required MultipartFile sketch}) async {
    try {
      await api.patch(NetworkConstants.breakdownSketch(breakdownId),
          data: FormData.fromMap({'sketch': sketch}));
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
  Future<void> uploadMedia(int breakdownId, List<int> uploadedFilesId) async {
    try {
      await api
          .patch(NetworkConstants.uploadMediaBreakdown(breakdownId), data: {
        'file_ids': uploadedFilesId,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> visibleDamage(int breakdownId, String visibleDamage) async {
    try {
      await api.patch(NetworkConstants.visibleDamageBreakdown(breakdownId),
          data: {'visible_damage': visibleDamage});
    } catch (e) {
      rethrow;
    }
  }
}
