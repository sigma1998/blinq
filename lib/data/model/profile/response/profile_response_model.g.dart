// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileResponseModelImpl _$$ProfileResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileResponseModelImpl(
      id: json['id'] as int?,
      image: json['image'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      birthDate: json['birth_date'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
      postalCode: json['postal_code'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      qrCode: json['qr_code'] as String?,
      driverLicense: (json['driver_licenses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      driverLicenseNumber: json['driver_license_number'] as String?,
      driverLicenseCountry: json['driver_license_country'] as String?,
      driverLicenseExpiredDate: json['driver_license_expired_date'] as String?,
      car: json['usersvehicledatas'] == null
          ? null
          : CarResponseModel.fromJson(
              json['usersvehicledatas'] as Map<String, dynamic>),
      policyHolder: json['policy_holder'] == null
          ? null
          : PolicyHolderResponseModel.fromJson(
              json['policy_holder'] as Map<String, dynamic>),
      insurance: json['insurance'] == null
          ? null
          : InsuranceResponseModel.fromJson(
              json['insurance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileResponseModelImplToJson(
        _$ProfileResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birth_date': instance.birthDate,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'street': instance.street,
      'postal_code': instance.postalCode,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'qr_code': instance.qrCode,
      'driver_licenses': instance.driverLicense,
      'driver_license_number': instance.driverLicenseNumber,
      'driver_license_country': instance.driverLicenseCountry,
      'driver_license_expired_date': instance.driverLicenseExpiredDate,
      'usersvehicledatas': instance.car,
      'policy_holder': instance.policyHolder,
      'insurance': instance.insurance,
    };
