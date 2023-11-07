// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrandResponseDtoImpl _$$BrandResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BrandResponseDtoImpl(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => VehicleInfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BrandResponseDtoImplToJson(
        _$BrandResponseDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
