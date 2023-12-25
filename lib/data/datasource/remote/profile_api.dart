// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/car/request/car_request_model.dart';
import 'package:blinq/data/model/cheack_account_datas/cheack_account_datas_response.dart';
import 'package:blinq/data/model/history/history_response_dto.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/vehicle/request/vehicle_request_model.dart';
import 'package:blinq/data/model/vehicle_info/brand_response.dart';
import 'package:blinq/data/model/vehicle_info/color_response.dart';

abstract class ProfileApi {
  //

  ///
  /// Profile
  ///

  Future<ProfileResponseModel> fetch();

  Future<ProfileResponseModel> update(ProfileRequestModel profile);

  Future<void> updateProfileImage(File file);

  ///
  /// Editors
  ///

  Future<void> updatePolicyHolder(PolicyHolderRequestModel policyHolder);

  Future<void> updateCar(CarRequestModel vehicle);

  Future<void> updateUserVehicle(UserVehicleRequestModel myVehicle);

  Future<void> updateInsurance(InsuranceRequestModel vehicle);

  Future<void> updateMyCar(CarRequestModel myCar);

  ///
  /// Settings
  ///

  Future<void> updatePassword(String oldPassword, String newPassword);

  Future<void> updateEmail(String email);

  Future<void> verifyEmail(String code);

  Future<void> updateLanguage(String language);

  ///
  /// Reports
  ///

  Future<HistoryResponseDto> fetchHistory();

  Future<void> deleteReport(int docId);

  Future<void> downloadReport({required String url, required String localPath});

  Future<BrandResponseDto> fetchBrands(int page);

  Future<BrandResponseDto> fetchModels(int page, int brandId);

  Future<ColorResponseDto> fetchColors(int page, int brandId);

  /// chech profile data
  Future<CheckAccountResponse> checkAccountData();
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
      final res = await api.get(NetworkConstants.profileData);
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
      var formData = FormData.fromMap({'image': image});
      return api.patch(NetworkConstants.profile, data: formData);
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
  Future<void> updateCar(CarRequestModel vehicle) {
    try {
      return api.patch(NetworkConstants.car, data: vehicle.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserVehicle(UserVehicleRequestModel myVehicle) {
    try {
      return api.patch(NetworkConstants.userVehicle, data: myVehicle.toJson());
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

  @override
  Future<void> updateMyCar(CarRequestModel myCar) {
    try {
      return api.patch(NetworkConstants.car, data: myCar.toJson());
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
      return api.post(NetworkConstants.verifyEmail,
          data: {'verification_code': code});
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Reports
  ///

  @override
  Future<HistoryResponseDto> fetchHistory() async {
    try {
      final res = await api.get(NetworkConstants.history);
      return HistoryResponseDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteReport(int docId) async {
    try {
      await api.delete('${NetworkConstants.deleteReport}/$docId/');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> downloadReport(
      {required String url, required String localPath}) async {
    try {
      await api.download(url, localPath, onReceiveProgress: (count, total) {
        debugPrint('$count / $total');
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BrandResponseDto> fetchBrands(int page) async {
    try {
      final res = await api
          .get(NetworkConstants.brands, queryParameters: {'page': page});

      return BrandResponseDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ColorResponseDto> fetchColors(int page, int brandId) async {
    final res = await api.get(NetworkConstants.colors,
        queryParameters: {'page': page, 'brand_id': brandId});

    return ColorResponseDto.fromJson(res);
  }

  @override
  Future<BrandResponseDto> fetchModels(int page, int brandId) async {
    final res = await api.get(NetworkConstants.models,
        queryParameters: {'page': page, 'brand_id': brandId});

    return BrandResponseDto.fromJson(res);
  }

  @override
  Future<CheckAccountResponse> checkAccountData() async {
    final res = await api.get(
      NetworkConstants.checkAccountData,
    );

    return CheckAccountResponse.fromJson(res);
  }
}
