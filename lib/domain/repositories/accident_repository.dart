// Project imports:
import 'dart:io';

import 'package:blinq/data/datasource/remote/accident_api.dart';
import 'package:blinq/data/model/accident/accident_time_and_location/accident_time_and_location.dart';
import 'package:blinq/data/model/accident/injury/injury.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:dio/dio.dart';

abstract class AccidentRepository {
  ///
  /// Remote API
  ///
  Future<ProfileResponseModel> fetchUserById(int id);

  Future<int> createAccident(String long, String lat);

  Future<void> adAccidentLocationAndTime(
      int accidentId, AccidentTimeAndLocationDto accidentTimeAndLocationDto);

  Future<void> accidentSketch(int accidentId, MultipartFile sketch);

  Future<int> uploadFile(
      {required File file,
      required int accidentId,
      required String format,
      required String name});

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
  Future<int> createAccident(String long, String lat) async {
    try {
      return await api.createAccident(long, lat);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentInitialImpactPoint(
      int accidentId, MultipartFile image) async {
    try {
      return await api.accidentInitialImpactPoint(accidentId, image);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> accidentInitialImpactPointB(
      int accidentId, MultipartFile image) async {
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
  Future<void> adAccidentLocationAndTime(int accidentId,
      AccidentTimeAndLocationDto accidentTimeAndLocationDto) async {
    try {
      return await api.adAccidentLocationAndTime(
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
  Future<void> damagedPointsB(
      {required MultipartFile? top,
      required MultipartFile? front,
      required MultipartFile? back,
      required MultipartFile? left,
      required MultipartFile? right,
      required int accidentId,
      required List<String> damageParts}) async {
    try {
      return await api.damagedPointsB(
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
  Future<int> uploadFile(
      {required File file,
      required int accidentId,
      required String format,
      required String name}) async {
    try {
      return await api.uploadFile(
          file: file, accidentId: accidentId, format: format, name: name);
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
}
