// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryResponseDtoImpl _$$HistoryResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryResponseDtoImpl(
      breakdowns: (json['breakdowns'] as List<dynamic>?)
              ?.map((e) =>
                  HistoryItemModelDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      accidents: (json['accidents'] as List<dynamic>?)
              ?.map((e) =>
                  HistoryItemModelDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HistoryResponseDtoImplToJson(
        _$HistoryResponseDtoImpl instance) =>
    <String, dynamic>{
      'breakdowns': instance.breakdowns,
      'accidents': instance.accidents,
    };
