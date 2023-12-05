// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactResponseModelImpl _$$ContactResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactResponseModelImpl(
      id: json['id'] as int?,
      image: json['image'] as String?,
      firstName: json['name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isEmergency: json['is_emergency'] as bool?,
    );

Map<String, dynamic> _$$ContactResponseModelImplToJson(
        _$ContactResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'is_emergency': instance.isEmergency,
    };
