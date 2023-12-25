// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/vehicle_info/color/vehicle_color_dto.dart';

part 'color_response.freezed.dart';
part 'color_response.g.dart';

@freezed
class ColorResponseDto with _$ColorResponseDto {
  //
  const factory ColorResponseDto({
    int? count,
    String? next,
    String? previous,
    List<VehicleColorDto>? results
  }) = _ColorResponseDto;

  factory ColorResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ColorResponseDtoFromJson(json);
}
