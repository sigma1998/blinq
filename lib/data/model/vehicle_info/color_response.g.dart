// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ColorResponseDtoImpl _$$ColorResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ColorResponseDtoImpl(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => VehicleColorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ColorResponseDtoImplToJson(
        _$ColorResponseDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
