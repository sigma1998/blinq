// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_license_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverLicenseDtoImpl _$$DriverLicenseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DriverLicenseDtoImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      licenseNumber: json['licenseNumber'] as String,
      licenseType: json['licenseType'] as String,
    );

Map<String, dynamic> _$$DriverLicenseDtoImplToJson(
        _$DriverLicenseDtoImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'issueDate': instance.issueDate?.toIso8601String(),
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'licenseNumber': instance.licenseNumber,
      'licenseType': instance.licenseType,
    };
