// ignore_for_file: invalid_annotation_target


import 'package:freezed_annotation/freezed_annotation.dart';

part 'accident_time_and_location.freezed.dart';
part 'accident_time_and_location.g.dart';

@freezed
class AccidentTimeAndLocationDto with _$AccidentTimeAndLocationDto {
  const factory AccidentTimeAndLocationDto({
    required String country,
    required String location,
    @JsonKey(name: "created_at") required String createdAt,
  }) = _AccidentTimeAndLocationDto;

  factory AccidentTimeAndLocationDto.fromJson(Map<String, dynamic> json) =>
      _$AccidentTimeAndLocationDtoFromJson(json);
}
