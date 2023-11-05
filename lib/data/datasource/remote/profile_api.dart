// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/profile/profile_response_model.dart';

abstract class ProfileApi {
  //
  Future<ProfileResponseModel> fetch();
  Future<ProfileResponseModel> update(ProfileResponseModel profile);

  Future<void> updatePassword(String oldPassword, String newPassword);
  Future<void> updateEmail(String email);
  Future<void> verifyEmail(String code);
  Future<void> updateLanguage(String language);
}

class ProfileApiImpl implements ProfileApi {
  //
  final AppApi api;

  ProfileApiImpl({required this.api});

  //

  @override
  Future<ProfileResponseModel> fetch() async {
    try {
      final res = await api.get(NetworkConstants.profile);
      return ProfileResponseModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileResponseModel> update(ProfileResponseModel profile) {
    try {
      return api
          .patch(NetworkConstants.profile, data: profile.toJson())
          .then((data) {
        return ProfileResponseModel.fromJson(data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateEmail(String email) {
    try {
      return api.post(NetworkConstants.changeEmail, data: {'email': email});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateLanguage(String language) {
    try {
      return api
          .post(NetworkConstants.changeLanguage, data: {'language': language});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updatePassword(String oldPassword, String newPassword) {
    try {
      return api.post(NetworkConstants.changePassword,
          data: {'old_password': oldPassword, 'new_password': newPassword});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> verifyEmail(String code) {
    try {
      return api.post(NetworkConstants.changeEmail, data: {'code': code});
    } catch (e) {
      rethrow;
    }
  }

  //
}
