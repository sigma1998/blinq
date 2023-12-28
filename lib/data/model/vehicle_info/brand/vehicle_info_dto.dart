// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_info_dto.freezed.dart';
part 'vehicle_info_dto.g.dart';

@freezed
class VehicleInfoDto with _$VehicleInfoDto {
  //
  const factory VehicleInfoDto({
    int? id,
    String? name,
  }) = _VehicleInfoDto;

  factory VehicleInfoDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleInfoDtoFromJson(json);
}
