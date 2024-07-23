// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileRequestModelImpl _$$ProfileRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileRequestModelImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      birthDate: json['birth_date'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      state: json['state'] as String?,
      postalCode: json['postal_code'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      driverLicense: (json['driver_licenses'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      driverLicenseNumber: json['driver_license_number'] as String?,
      driverLicenseCountry: json['driver_license_country'] as String?,
      driverLicenseExpiredDate: json['driver_license_expired_date'] as String?,
    );

Map<String, dynamic> _$$ProfileRequestModelImplToJson(
        _$ProfileRequestModelImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birth_date': instance.birthDate,
      'country': instance.country,
      'city': instance.city,
      'street': instance.street,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'driver_licenses': instance.driverLicense,
      'driver_license_number': instance.driverLicenseNumber,
      'driver_license_country': instance.driverLicenseCountry,
      'driver_license_expired_date': instance.driverLicenseExpiredDate,
    };
