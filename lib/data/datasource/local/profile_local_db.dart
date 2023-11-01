// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'storage_constants.dart';

abstract class ProfileLocalStorage {
  void setToken(String token);

  String getToken();
}

class ProfileLocalStorageImpl implements ProfileLocalStorage {
  //
  @override
  String getToken() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.token, defaultValue: '');
  }

  @override
  void setToken(String token) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.token, token);
  }
}
