// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injury.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InjuryDtoImpl _$$InjuryDtoImplFromJson(Map<String, dynamic> json) =>
    _$InjuryDtoImpl(
      country: json['country'] as String,
      location: json['location'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$InjuryDtoImplToJson(_$InjuryDtoImpl instance) =>
    <String, dynamic>{
      'country': instance.country,
      'location': instance.location,
      'created_at': instance.createdAt,
    };
