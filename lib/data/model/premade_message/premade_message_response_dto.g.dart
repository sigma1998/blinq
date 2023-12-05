// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premade_message_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PremadeMessageResponseDtoImpl _$$PremadeMessageResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PremadeMessageResponseDtoImpl(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) =>
              PreMadeMessageResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PremadeMessageResponseDtoImplToJson(
        _$PremadeMessageResponseDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
