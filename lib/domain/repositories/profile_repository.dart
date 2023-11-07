// Project imports:
import 'dart:io';

import 'package:blinq/data/datasource/local/profile_local_db.dart';
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/data/model/car/request/car_request_model.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/vehicle/request/vehicle_request_model.dart';

abstract class ProfileRepository {
  ///
  /// Remote API
  ///
  Future<ProfileResponseModel> fetch();
  Future<ProfileResponseModel> update(ProfileRequestModel profile);
  Future<void> updateProfileImage(File file);

  //
  Future<void> updatePolicyHolder(PolicyHolderRequestModel policyHolder);
  Future<void> updateCar(CarRequestModel vehicle);
  Future<void> updateUserVehicle(UserVehicleRequestModel myVehicle);
  Future<void> updateInsurance(InsuranceRequestModel insurance);
  Future<void> updateMyCar(UserVehicleRequestModel myVehicle);

  //
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

  ///
  /// Profile
  ///

  @override
  Future<ProfileResponseModel> fetch() async {
    try {
      return await api.fetch();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileResponseModel> update(ProfileRequestModel profile) {
    try {
      return api.update(profile).then((data) {
        localStorage.setProfile(data);
        return data;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfileImage(File file) {
    try {
      return api.updateProfileImage(file);
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Editors
  ///
  @override
  Future<void> updatePolicyHolder(PolicyHolderRequestModel policyHolder) {
    try {
      return api.updatePolicyHolder(policyHolder);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateCar(CarRequestModel vehicle) {
    try {
      return api.updateCar(vehicle);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserVehicle(UserVehicleRequestModel myVehicle) {
    try {
      return api.updateUserVehicle(myVehicle);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateInsurance(InsuranceRequestModel insurance) {
    try {
      return api.updateInsurance(insurance);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateMyCar(UserVehicleRequestModel myVehicle) {
    try {
      return api.updateUserVehicle(myVehicle);
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Settings
  ///

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
