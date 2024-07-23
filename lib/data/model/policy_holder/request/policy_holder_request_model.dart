// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_holder_request_model.freezed.dart';

part 'policy_holder_request_model.g.dart';

@freezed
class PolicyHolderRequestModel with _$PolicyHolderRequestModel {
  //
  const factory PolicyHolderRequestModel(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'postal_code') String? postalCode,
      String? country,
      String? city,
      String? state,
      String? street,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      String? email,
      bool? sameAsDriver}) = _PolicyHolderRequestModel;

  factory PolicyHolderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PolicyHolderRequestModelFromJson(json);
}
