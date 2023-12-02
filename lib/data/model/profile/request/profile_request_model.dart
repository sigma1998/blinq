// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';

part 'profile_request_model.freezed.dart';
part 'profile_request_model.g.dart';

@freezed
class ProfileRequestModel with _$ProfileRequestModel {
  //
  const factory ProfileRequestModel({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'birth_date') String? birthDate,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'driver_license') DriverLicenseType? driverLicense,
    @JsonKey(name: 'driver_license_number') String? driverLicenseNumber,
    @JsonKey(name: 'driver_license_expired_date')
    String? driverLicenseExpiredDate,
  }) = _ProfileRequestModel;

  factory ProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestModelFromJson(json);
}
