// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accident_time_and_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccidentTimeAndLocationDtoImpl _$$AccidentTimeAndLocationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AccidentTimeAndLocationDtoImpl(
      country: json['country'] as String,
      location: json['location'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$AccidentTimeAndLocationDtoImplToJson(
        _$AccidentTimeAndLocationDtoImpl instance) =>
    <String, dynamic>{
      'country': instance.country,
      'location': instance.location,
      'created_at': instance.createdAt,
    };
