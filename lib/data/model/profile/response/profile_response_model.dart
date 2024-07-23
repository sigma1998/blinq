// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/car/response/car_response_model.dart';
import 'package:blinq/data/model/insurance/response/insurance_response_model.dart';
import 'package:blinq/data/model/policy_holder/response/policy_holder_response_model.dart';

part 'profile_response_model.freezed.dart';
part 'profile_response_model.g.dart';

@freezed
class ProfileResponseModel with _$ProfileResponseModel {
  //
  const ProfileResponseModel._();

  const factory ProfileResponseModel({
    int? id,
    String? image,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'birth_date') String? birthDate,
    @JsonKey(name: 'country') String? country,
    String? city,
    String? state,
    String? street,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'qr_code') String? qrCode,
    @JsonKey(name: 'driver_licenses') List<String>? driverLicense,
    @JsonKey(name: 'driver_license_number') String? driverLicenseNumber,
    @JsonKey(name: 'driver_license_country') String? driverLicenseCountry,
    @JsonKey(name: 'driver_license_expired_date')
    String? driverLicenseExpiredDate,
    @JsonKey(name: 'usersvehicledatas') CarResponseModel? car,
    @JsonKey(name: 'policy_holder') PolicyHolderResponseModel? policyHolder,
    @JsonKey() InsuranceResponseModel? insurance,
  }) = _ProfileResponseModel;

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}';

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);
}
