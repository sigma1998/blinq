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
      driverLicense: json['driver_license'] as String?,
      driverLicenseNumber: json['driver_license_number'] as String?,
      driverLicenseExpiredDate: json['driver_license_expired_date'] as String?,
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
      'driver_license': instance.driverLicense,
      'driver_license_number': instance.driverLicenseNumber,
      'driver_license_expired_date': instance.driverLicenseExpiredDate,
    };
