// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_request_model.freezed.dart';
part 'insurance_request_model.g.dart';

@freezed
class InsuranceRequestModel with _$InsuranceRequestModel {
  //
  const factory InsuranceRequestModel({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'policy_number') String? policyNumber,
    @JsonKey(name: 'green_card_number') String? greenCardNumber,
    @JsonKey(name: 'certificate_valid_from') String? certificateValidFrom,
    @JsonKey(name: 'certificate_valid_to') String? certificateValidTo,
    @JsonKey(name: 'agency') String? agency,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'policy_cover') String? policyCover,
    @JsonKey(name: 'country') String? country,
  }) = _InsuranceRequestModel;

  factory InsuranceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceRequestModelFromJson(json);
}
