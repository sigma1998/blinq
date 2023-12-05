// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactResponseDtoImpl _$$ContactResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactResponseDtoImpl(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ContactResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContactResponseDtoImplToJson(
        _$ContactResponseDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
