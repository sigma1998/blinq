// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_request_dto.freezed.dart';
part 'registration_request_dto.g.dart';

@freezed
class RegistrationRequestDto with _$RegistrationRequestDto {
  const factory RegistrationRequestDto({
    required String email,
    required String password,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
  }) = _RegistrationRequestDto;

  factory RegistrationRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestDtoFromJson(json);
}
