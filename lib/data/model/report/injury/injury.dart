// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'injury.freezed.dart';

part 'injury.g.dart';

@freezed
class InjuryDto with _$InjuryDto {
  const factory InjuryDto({
    required bool injury,
    @JsonKey(name: "other_damaged_vehicles") required bool otherDamagedVehicles,
    @JsonKey(name: "other_damaged_items") required bool otherDamagedItems,
  }) = _InjuryDto;

  factory InjuryDto.fromJson(Map<String, dynamic> json) =>
      _$InjuryDtoFromJson(json);
}
