// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:hive/hive.dart';

part 'profile_response_model.freezed.dart';
part 'profile_response_model.g.dart';

@freezed
@HiveType(typeId: 3)
class ProfileResponseModel with _$ProfileResponseModel {
  //
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
  }) = _ProfileResponseModel;

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);
}
