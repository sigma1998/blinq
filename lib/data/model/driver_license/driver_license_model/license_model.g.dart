// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LicenseModelImpl _$$LicenseModelImplFromJson(Map<String, dynamic> json) =>
    _$LicenseModelImpl(
      id: (json['id'] as num?)?.toInt(),
      driverLicense: json['driver_license'] as String?,
    );

Map<String, dynamic> _$$LicenseModelImplToJson(_$LicenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_license': instance.driverLicense,
    };
