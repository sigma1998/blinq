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
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      driverLicense: $enumDecodeNullable(
          _$DriverLicenseTypeEnumMap, json['driver_license']),
      driverLicenseNumber: json['driver_license_number'] as String?,
      driverLicenseExpiredDate: json['driver_license_expired_date'] as String?,
    );

Map<String, dynamic> _$$ProfileRequestModelImplToJson(
        _$ProfileRequestModelImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birth_date': instance.birthDate,
      'country': instance.country,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'driver_license': _$DriverLicenseTypeEnumMap[instance.driverLicense],
      'driver_license_number': instance.driverLicenseNumber,
      'driver_license_expired_date': instance.driverLicenseExpiredDate,
    };

const _$DriverLicenseTypeEnumMap = {
  DriverLicenseType.am: 'AM',
  DriverLicenseType.a1: 'A1',
  DriverLicenseType.a2: 'A2',
  DriverLicenseType.a: 'A',
  DriverLicenseType.b1: 'B1',
  DriverLicenseType.b: 'B',
  DriverLicenseType.c1: 'C1',
  DriverLicenseType.c: 'C',
  DriverLicenseType.d1: 'D1',
  DriverLicenseType.d: 'D',
  DriverLicenseType.be: 'C1E',
  DriverLicenseType.c1e: 'CE',
  DriverLicenseType.ce: 'D1E',
  DriverLicenseType.d1e: 'DE',
  DriverLicenseType.de: 'T',
};
