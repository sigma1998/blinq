// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'insurance_response_model.freezed.dart';
part 'insurance_response_model.g.dart';

@freezed
@HiveType(typeId: 6)
class InsuranceResponseModel with _$InsuranceResponseModel {
  //
  const factory InsuranceResponseModel({
    @HiveField(0) @JsonKey(name: 'name') String? name,
    @HiveField(1) @JsonKey(name: 'policy_number') String? policyNumber,
    @HiveField(2) @JsonKey(name: 'green_card_number') String? greenCardNumber,
    @HiveField(3)
    @JsonKey(name: 'certificate_valid_from')
    String? certificateValidFrom,
    @HiveField(4)
    @JsonKey(name: 'certificate_valid_to')
    String? certificateValidTo,
    @HiveField(5) @JsonKey(name: 'agency') String? agency,
    @HiveField(6) @JsonKey(name: 'country') String? country,
    @HiveField(7) @JsonKey(name: 'address') String? address,
    @HiveField(8) @JsonKey(name: 'email') String? email,
    @HiveField(9) @JsonKey(name: 'policy_cover') String? policyCover,
  }) = _InsuranceResponseModel;

  factory InsuranceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceResponseModelFromJson(json);
}
