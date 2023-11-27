// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/accident/accident_time_and_location/accident_time_and_location.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';

abstract class AccidentApi {
  //
  Future<ProfileResponseModel> fetchUserById(int id);

  Future<void> createAccident(String long, String lat);

  Future<void> adAccidentLocationAndTime(
      int accidentId,
      AccidentTimeAndLocationDto accidentTimeAndLocationDto);
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
  Future createAccident(String long, String lat) async {
    try {
      await api.post(NetworkConstants.createReport);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> adAccidentLocationAndTime(
      int accidentId,
      AccidentTimeAndLocationDto accidentTimeAndLocationDto) async{
    try {
      await api.post(NetworkConstants.createReport);
    } catch (e) {
      rethrow;
    }
  }
}
