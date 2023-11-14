// Project imports:
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/core/network/api_service.dart';

abstract class AccidentApi {
  //
  Future<ProfileResponseModel> fetchUserById(int id);
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
}
