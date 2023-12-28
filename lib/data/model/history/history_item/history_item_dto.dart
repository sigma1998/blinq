// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_item_dto.freezed.dart';
part 'history_item_dto.g.dart';

@freezed
class HistoryItemModelDto with _$HistoryItemModelDto {
//
  const factory HistoryItemModelDto({
    int? id,
    String? type,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'accident_document_pdf') String? accidentDocumentPdf,
  }) = _HistoryItemModelDto;

  factory HistoryItemModelDto.fromJson(Map<String, dynamic> json) =>
      _$HistoryItemModelDtoFromJson(json);
}
