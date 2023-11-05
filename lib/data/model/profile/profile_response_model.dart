// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'driver_license/driver_license_type.dart';

part 'profile_response_model.freezed.dart';
part 'profile_response_model.g.dart';

@freezed
class ProfileResponseModel with _$ProfileResponseModel {
  //
  const factory ProfileResponseModel({
    int? id,
    String? image,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'birth_date') String? birthDate,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'qr_code') String? qrCode,
    @JsonKey(name: 'driver_license') DriverLicenseType? driverLicense,
    @JsonKey(name: 'driver_license_number') String? driverLicenseNumber,
    @JsonKey(name: 'driver_license_expired_date')
    String? driverLicenseExpiredDate,
  }) = _ProfileResponseModel;

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);
}
