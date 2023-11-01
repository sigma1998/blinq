// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/profile/profile_response_model.dart';

abstract class ProfileApi {
  Future<ProfileResponseModel> fetchProfile();
}

class ProfileApiImpl implements ProfileApi {
  final AppApi api;

  ProfileApiImpl({required this.api});

  @override
  Future<ProfileResponseModel> fetchProfile() async {
    try {
      final res = await api.get(NetworkConstants.profile);
      return ProfileResponseModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
