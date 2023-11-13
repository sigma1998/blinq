// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactRequestModelImpl _$$ContactRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactRequestModelImpl(
      firstName: json['name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isEmergency: json['is_emergency'] as String?,
    );

Map<String, dynamic> _$$ContactRequestModelImplToJson(
        _$ContactRequestModelImpl instance) =>
    <String, dynamic>{
      'name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'is_emergency': instance.isEmergency,
    };
