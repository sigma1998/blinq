// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryItemModelDtoImpl _$$HistoryItemModelDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryItemModelDtoImpl(
      id: json['id'] as int?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      accidentDocumentPdf: json['accident_document_pdf'] as String?,
    );

Map<String, dynamic> _$$HistoryItemModelDtoImplToJson(
        _$HistoryItemModelDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'created_at': instance.createdAt,
      'accident_document_pdf': instance.accidentDocumentPdf,
    };
