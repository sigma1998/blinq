// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_response_model.freezed.dart';
part 'insurance_response_model.g.dart';

@freezed
class InsuranceResponseModel with _$InsuranceResponseModel {
  //
  const factory InsuranceResponseModel({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'policy_number') String? policyNumber,
    @JsonKey(name: 'green_card_number') String? greenCardNumber,
    @JsonKey(name: 'certificate_valid_from') String? certificateValidFrom,
    @JsonKey(name: 'certificate_valid_to') String? certificateValidTo,
    @JsonKey(name: 'agency') String? agency,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'policy_cover') String? policyCover,
  }) = _InsuranceResponseModel;

  factory InsuranceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceResponseModelFromJson(json);
}
