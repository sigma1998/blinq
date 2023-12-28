// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'brand/vehicle_info_dto.dart';

part 'brand_response.freezed.dart';
part 'brand_response.g.dart';

@freezed
class BrandResponseDto with _$BrandResponseDto {
  //
  const factory BrandResponseDto({
    int? count,
    String? next,
    String? previous,
    List<VehicleInfoDto>? results
  }) = _BrandResponseDto;

  factory BrandResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseDtoFromJson(json);
}
