// Project imports:
import 'package:blinq/data/datasource/local/profile_local_db.dart';
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/data/model/profile/profile_response_model.dart';

abstract class ProfileRepository {
  ///
  /// Remote API
  ///
  Future<ProfileResponseModel> fetch();
  Future<ProfileResponseModel> update(ProfileResponseModel profile);

  Future<void> updatePassword(String oldPassword, String newPassword);
  Future<void> updateEmail(String email);
  Future<void> verifyEmail(String code);
  Future<void> updateLanguage(String language);

  ///
  /// Local storage
  ///

  ProfileResponseModel getProfile();
  void setProfile(ProfileResponseModel profile);

  String getLanguage();
  void setLanguage(String language);
}

class ProfileRepositoryImpl implements ProfileRepository {
  //
  final ProfileApi api;
  final ProfileLocalStorage localStorage;

  ProfileRepositoryImpl({required this.api, required this.localStorage});

  @override
  Future<ProfileResponseModel> fetch() async {
    try {
      return await api.fetch();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileResponseModel> update(ProfileResponseModel profile) {
    try {
      return api.update(profile).then((data) {
        localStorage.setProfile(data);
        return data;
      });
    } catch (e) {
      rethrow;
    }
  }

  //

  @override
  Future<void> updateEmail(String email) {
    try {
      return api.updateEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateLanguage(String language) {
    try {
      return api
          .updateLanguage(language)
          .then((_) => localStorage.setLanguage(language));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updatePassword(String oldPassword, String newPassword) {
    try {
      return api.updatePassword(oldPassword, newPassword);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> verifyEmail(String code) {
    try {
      return api.verifyEmail(code);
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Local storage
  ///

  @override
  ProfileResponseModel getProfile() => localStorage.getProfile();

  @override
  void setProfile(ProfileResponseModel profile) =>
      localStorage.setProfile(profile);

  @override
  String getLanguage() => localStorage.getLanguage();

  @override
  void setLanguage(String language) => localStorage.setLanguage(language);
}
