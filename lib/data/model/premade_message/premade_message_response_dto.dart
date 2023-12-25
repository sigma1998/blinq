// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';

part 'premade_message_response_dto.freezed.dart';
part 'premade_message_response_dto.g.dart';

@freezed
class PreMadeMessageResponseDto with _$PreMadeMessageResponseDto {
  //
  const factory PreMadeMessageResponseDto({
    int? count,
    String? next,
    String? previous,
    List<PreMadeMessageResponseModel>? results,
  }) = _PremadeMessageResponseDto;

  factory PreMadeMessageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PreMadeMessageResponseDtoFromJson(json);
}
