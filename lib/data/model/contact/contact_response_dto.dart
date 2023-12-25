// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'response/contact_response_model.dart';

part 'contact_response_dto.freezed.dart';
part 'contact_response_dto.g.dart';

@freezed
class ContactResponseDto with _$ContactResponseDto {
  //
  const factory ContactResponseDto({
    int? count,
    String? next,
    String? previous,
    List<ContactResponseModel>? results,
  }) = _ContactResponseDto;

  factory ContactResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseDtoFromJson(json);
}
