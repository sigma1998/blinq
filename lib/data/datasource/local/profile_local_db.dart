// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'package:blinq/data/model/profile/profile_response_model.dart';
import 'storage_constants.dart';

abstract class ProfileLocalStorage {
  //
  void setProfile(ProfileResponseModel profile);
  ProfileResponseModel getProfile();

  //
  void setLanguage(String language);
  String getLanguage();
}

class ProfileLocalStorageImpl implements ProfileLocalStorage {
  //
  @override
  ProfileResponseModel getProfile() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.profile);
  }

  @override
  void setProfile(ProfileResponseModel token) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.token, token);
  }

  //

  @override
  String getLanguage() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.language);
  }

  @override
  void setLanguage(String language) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.language, language);
  }
}
