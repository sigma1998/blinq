// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

// Project imports:
import 'package:blinq/data/model/car/response/car_response_model.dart';
import 'package:blinq/data/model/insurance/response/insurance_response_model.dart';
import 'package:blinq/data/model/policy_holder/response/policy_holder_response_model.dart';
import 'package:blinq/data/model/vehicle/response/vehicle_response_model.dart';
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';

part 'profile_response_model.freezed.dart';
part 'profile_response_model.g.dart';

@freezed
@HiveType(typeId: 3)
class ProfileResponseModel with _$ProfileResponseModel {
  //
  const ProfileResponseModel._();

  const factory ProfileResponseModel({
    int? id,
    String? image,
    @HiveField(0) @JsonKey(name: 'first_name') String? firstName,
    @HiveField(1) @JsonKey(name: 'last_name') String? lastName,
    @HiveField(2) @JsonKey(name: 'birth_date') String? birthDate,
    @HiveField(3) @JsonKey(name: 'country') String? country,
    @HiveField(4) @JsonKey(name: 'address') String? address,
    @HiveField(5) @JsonKey(name: 'phone_number') String? phoneNumber,
    @HiveField(6) @JsonKey(name: 'email') String? email,
    @HiveField(7) @JsonKey(name: 'qr_code') String? qrCode,
    @HiveField(8)
    @JsonKey(name: 'driver_license')
    DriverLicenseType? driverLicense,
    @HiveField(9)
    @JsonKey(name: 'driver_license_number')
    String? driverLicenseNumber,
    @HiveField(10)
    @JsonKey(name: 'driver_license_expired_date')
    @HiveField(11)
    String? driverLicenseExpiredDate,
    @HiveField(12) @JsonKey() CarResponseModel? car,
    @HiveField(13)
    @JsonKey(name: 'policy_holder')
    PolicyHolderResponseModel? policyHolder,
    @HiveField(14) @JsonKey() InsuranceResponseModel? insurance,
    @HiveField(15)
    @JsonKey(name: 'usersvehicledatas')
    UserVehicleResponseModel? userVehicle,
  }) = _ProfileResponseModel;

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}';

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);
}
