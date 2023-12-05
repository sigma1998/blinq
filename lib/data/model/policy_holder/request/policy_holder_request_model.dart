// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_holder_request_model.freezed.dart';
part 'policy_holder_request_model.g.dart';

@freezed
class PolicyHolderRequestModel with _$PolicyHolderRequestModel {
  //
  const factory PolicyHolderRequestModel({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    String? email,
  }) = _PolicyHolderRequestModel;

  factory PolicyHolderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PolicyHolderRequestModelFromJson(json);
}
