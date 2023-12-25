// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'history_item/history_item_dto.dart';

part 'history_response_dto.freezed.dart';
part 'history_response_dto.g.dart';

@freezed
class HistoryResponseDto with _$HistoryResponseDto {
//
  const factory HistoryResponseDto({
    @Default([]) List<HistoryItemModelDto> breakdowns,
    @Default([]) List<HistoryItemModelDto> accidents,
  }) = _HistoryResponseDto;

  factory HistoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseDtoFromJson(json);
}



