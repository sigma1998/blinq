// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_request_model.freezed.dart';
part 'contact_request_model.g.dart';

@freezed
class ContactRequestModel with _$ContactRequestModel {
  //
  const factory ContactRequestModel({
    @JsonKey(name: 'name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'is_emergency') String? isEmergency,
  }) = _ContactRequestModel;

  factory ContactRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ContactRequestModelFromJson(json);
}
