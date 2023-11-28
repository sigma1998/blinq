// ignore_for_file: invalid_annotation_target


import 'package:freezed_annotation/freezed_annotation.dart';

part 'injury.freezed.dart';
part 'injury.g.dart';

@freezed
class InjuryDto with _$InjuryDto {
  const factory InjuryDto({
    required String country,
    required String location,
    @JsonKey(name: "created_at") required String createdAt,
  }) = _InjuryDto;

  factory InjuryDto.fromJson(Map<String, dynamic> json) =>
      _$InjuryDtoFromJson(json);
}
