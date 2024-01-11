// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_color_dto.freezed.dart';
part 'vehicle_color_dto.g.dart';

@freezed
class VehicleColorDto with _$VehicleColorDto {
  //
  const factory VehicleColorDto({
    int? id,
    String? colour,
    int? brandId,
  }) = _VehicleColorDto;

  factory VehicleColorDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleColorDtoFromJson(json);
}
