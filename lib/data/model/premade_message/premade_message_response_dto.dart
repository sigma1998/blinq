// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'premade_message_response_dto.freezed.dart';
part 'premade_message_response_dto.g.dart';

@freezed
@HiveType(typeId: 11)
class PremadeMessageResponseDto with _$PremadeMessageResponseDto {
  //
  const factory PremadeMessageResponseDto({
    @HiveField(0) int? count,
    @HiveField(1) String? next,
    @HiveField(2) String? previous,
    @HiveField(3) List<PremadeMessageResponseDto>? results,
  }) = _PremadeMessageResponseDto;

  factory PremadeMessageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PremadeMessageResponseDtoFromJson(json);
}
