// Dart imports:
import 'dart:io';

// Project imports:
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/data/model/car/request/car_request_model.dart';
import 'package:blinq/data/model/cheack_account_datas/cheack_account_datas_response.dart';
import 'package:blinq/data/model/history/history_response_dto.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/vehicle/request/vehicle_request_model.dart';
import 'package:blinq/data/model/vehicle_info/brand_response.dart';
import 'package:blinq/data/model/vehicle_info/color/vehicle_color_dto.dart';
import 'package:blinq/data/model/vehicle_info/color_response.dart';

abstract class ProfileRepository {
  ///
  /// Remote API
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

  Future<void> updateInsurance(InsuranceRequestModel insurance);

  Future<void> updateMyCar(CarRequestModel carRequestModel);

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

  Future<VehicleColorDto> addColor(String color, int brandId);

  Future<CheckAccountResponse> checkAccountData();
}

class ProfileRepositoryImpl implements ProfileRepository {
  //
  final ProfileApi api;

  ProfileRepositoryImpl({required this.api});

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
  Future<ProfileResponseModel> update(ProfileRequestModel profile) async {
    try {
      return await api.update(profile).then((data) {
        return data;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfileImage(File file) async {
    try {
      return await api.updateProfileImage(file);
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Editors
  ///
  @override
  Future<void> updatePolicyHolder(PolicyHolderRequestModel policyHolder) async {
    try {
      return await api.updatePolicyHolder(policyHolder);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateCar(CarRequestModel vehicle) async {
    try {
      return await api.updateCar(vehicle);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserVehicle(UserVehicleRequestModel myVehicle) async {
    try {
      return await api.updateUserVehicle(myVehicle);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateInsurance(InsuranceRequestModel insurance) async {
    try {
      return await api.updateInsurance(insurance);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateMyCar(CarRequestModel carRequestModel) async {
    try {
      return await api.updateMyCar(carRequestModel);
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Settings
  ///

  @override
  Future<void> updateEmail(String email) async {
    try {
      return await api.updateEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateLanguage(String language) async {
    try {
      return await api.updateLanguage(language);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updatePassword(String oldPassword, String newPassword) async {
    try {
      return await api.updatePassword(oldPassword, newPassword);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> verifyEmail(String code) async {
    try {
      return await api.verifyEmail(code);
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
      return await api.fetchHistory();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteReport(int docId) async {
    try {
      await api.deleteReport(docId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> downloadReport(
      {required String url, required String localPath}) async {
    try {
      await api.downloadReport(url: url, localPath: localPath);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BrandResponseDto> fetchBrands(int page) async {
    try {
      return await api.fetchBrands(page);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ColorResponseDto> fetchColors(int page, int brandId) async {
    try {
      return await api.fetchColors(page, brandId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VehicleColorDto> addColor(String color, int brandId) async {
    try {
      return await api.addColor(color, brandId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BrandResponseDto> fetchModels(int page, int brandId) async {
    try {
      return await api.fetchModels(page, brandId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CheckAccountResponse> checkAccountData() async {
    try {
      return await api.checkAccountData();
    } catch (e) {
      rethrow;
    }
  }
}
