// Project imports:
import 'dart:io';

import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/data/model/my_vehicle/request/my_vehicle_request_model.dart';
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/vehicle/request/vehicle_request_model.dart';
import 'package:dio/dio.dart';

abstract class ProfileApi {
  //
  Future<ProfileResponseModel> fetch();
  Future<ProfileResponseModel> update(ProfileRequestModel profile);
  Future<void> updateProfileImage(File file);

  Future<void> updatePolicyHolder(PolicyHolderRequestModel policyHolder);
  Future<void> updateVehicle(VehicleRequestModel vehicle);
  Future<void> updateMyVehicle(MyVehicleRequestModel myVehicle);
  Future<void> updateInsurance(InsuranceRequestModel vehicle);

  //

  Future<void> updatePassword(String oldPassword, String newPassword);
  Future<void> updateEmail(String email);
  Future<void> verifyEmail(String code);
  Future<void> updateLanguage(String language);
}

class ProfileApiImpl implements ProfileApi {
  //
  final AppApi api;

  ProfileApiImpl({required this.api});

  ///
  /// Profile
  ///

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
  Future<ProfileResponseModel> update(ProfileRequestModel profile) {
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
  Future<void> updateProfileImage(File file) async {
    try {
      final image = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      return api.patch(NetworkConstants.profile, data: {'image': image});
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
      return api.patch(NetworkConstants.policyHolder,
          data: policyHolder.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateVehicle(VehicleRequestModel vehicle) {
    try {
      return api.patch(NetworkConstants.vehicle, data: vehicle.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateMyVehicle(MyVehicleRequestModel myVehicle) {
    try {
      return api.patch(NetworkConstants.myVehicle, data: myVehicle.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateInsurance(InsuranceRequestModel vehicle) {
    try {
      return api.patch(NetworkConstants.insurance, data: vehicle.toJson());
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
      return api.post(NetworkConstants.changeEmail, data: {'email': email});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateLanguage(String language) {
    try {
      return api.get(NetworkConstants.changeLanguage,
          queryParameters: {'lan_code': language});
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
}
