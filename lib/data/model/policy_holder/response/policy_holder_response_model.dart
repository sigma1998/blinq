// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_holder_response_model.freezed.dart';
part 'policy_holder_response_model.g.dart';

@freezed
class PolicyHolderResponseModel with _$PolicyHolderResponseModel {
  //
  const PolicyHolderResponseModel._();

  const factory PolicyHolderResponseModel({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'email') String? email,
  }) = _PolicyHolderResponseModel;

  String get fullName => '${firstName ?? '-'} ${lastName ?? ''}';

  factory PolicyHolderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PolicyHolderResponseModelFromJson(json);
}
