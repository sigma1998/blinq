// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'policy_holder_response_model.freezed.dart';
part 'policy_holder_response_model.g.dart';

@freezed
@HiveType(typeId: 5)
class PolicyHolderResponseModel with _$PolicyHolderResponseModel {
  //
  const PolicyHolderResponseModel._();

  const factory PolicyHolderResponseModel({
    @HiveField(0) @JsonKey(name: 'first_name') String? firstName,
    @HiveField(1) @JsonKey(name: 'last_name') String? lastName,
    @HiveField(2) @JsonKey(name: 'country') String? country,
    @HiveField(3) @JsonKey(name: 'address') String? address,
    @HiveField(4) @JsonKey(name: 'postal_code') String? postalCode,
    @HiveField(5) @JsonKey(name: 'phone_number') String? phoneNumber,
    @HiveField(6) @JsonKey(name: 'email') String? email,
  }) = _PolicyHolderResponseModel;

  String get fullName => '${firstName ?? '-'} ${lastName ?? ''}';

  factory PolicyHolderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PolicyHolderResponseModelFromJson(json);
}
