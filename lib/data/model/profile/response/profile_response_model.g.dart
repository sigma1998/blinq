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
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      qrCode: json['qr_code'] as String?,
      driverLicense: $enumDecodeNullable(
          _$DriverLicenseTypeEnumMap, json['driver_license']),
      driverLicenseNumber: json['driver_license_number'] as String?,
      driverLicenseExpiredDate: json['driver_license_expired_date'] as String?,
      car: json['car'] == null
          ? null
          : CarResponseModel.fromJson(json['car'] as Map<String, dynamic>),
      policyHolder: json['policy_holder'] == null
          ? null
          : PolicyHolderResponseModel.fromJson(
              json['policy_holder'] as Map<String, dynamic>),
      insurance: json['insurance'] == null
          ? null
          : InsuranceResponseModel.fromJson(
              json['insurance'] as Map<String, dynamic>),
      userVehicle: json['usersvehicledatas'] == null
          ? null
          : UserVehicleResponseModel.fromJson(
              json['usersvehicledatas'] as Map<String, dynamic>),
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
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'qr_code': instance.qrCode,
      'driver_license': _$DriverLicenseTypeEnumMap[instance.driverLicense],
      'driver_license_number': instance.driverLicenseNumber,
      'driver_license_expired_date': instance.driverLicenseExpiredDate,
      'car': instance.car,
      'policy_holder': instance.policyHolder,
      'insurance': instance.insurance,
      'usersvehicledatas': instance.userVehicle,
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
