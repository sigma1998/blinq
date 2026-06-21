// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'package:blinq/data/model/user/user_status.dart';
import 'storage_constants.dart';

abstract class AuthLocalStorage {
  void setUserStatus(UserStatus userStatus);

  UserStatus getUserStatus();

  void setToken(String token);

  String getToken();

  void setFirebaseToken(String token);

  String? getFirebaseToken();

  void setRefreshToken(String token);

  String getRefreshToken();

  void setUserName(String name);

  String getUserName();

  void setUserId(int? id);

  int? getUserId();

  void setUserPhone(String phone);

  String getUserPhone();

  void clearAll();
}

class AuthLocalStorageImpl implements AuthLocalStorage {
  //
  @override
  UserStatus getUserStatus() {
    final box = Hive.box(StorageConstants.userStatusBox);
    if (box.isEmpty) {
      return UserStatus.newUser;
    }
    return box.getAt(0);
  }

  @override
  void setUserStatus(UserStatus userStatus) {
    final box = Hive.box(StorageConstants.userStatusBox);
    if (box.isEmpty) {
      box.add(userStatus);
    } else {
      box.putAt(0, userStatus);
    }
  }

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

  @override
  String getRefreshToken() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.refreshToken, defaultValue: '');
  }

  @override
  void setRefreshToken(String token) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.refreshToken, token);
  }

  @override
  int? getUserId() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.userId, defaultValue: null);
  }

  @override
  void setUserId(int? id) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.userId, id);
  }

  @override
  String getUserName() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.userName, defaultValue: "");
  }

  @override
  void setUserName(String name) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.userName, name);
  }

  @override
  String getUserPhone() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.userPhone, defaultValue: "");
  }

  @override
  void setUserPhone(String phone) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.userPhone, phone);
  }

  @override
  String? getFirebaseToken() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.firebaseToken, defaultValue: null);
  }

  @override
  void setFirebaseToken(String token) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.firebaseToken, token);
  }

  @override
  void clearAll() {
    final box = Hive.box(StorageConstants.appBox);
    box.clear();
    final statusBox = Hive.box(StorageConstants.userStatusBox);
    statusBox.clear();
  }
}
