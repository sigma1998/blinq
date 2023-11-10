// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'response/contact_response_model.dart';

part 'contact_response_dto.freezed.dart';
part 'contact_response_dto.g.dart';

@freezed
@HiveType(typeId: 9)
class ContactResponseDto with _$ContactResponseDto {
  //
  const factory ContactResponseDto({
    @HiveField(0) int? count,
    @HiveField(1) String? next,
    @HiveField(2) String? previous,
    @HiveField(3) List<ContactResponseModel>? results,
  }) = _ContactResponseDto;

  factory ContactResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseDtoFromJson(json);
}
