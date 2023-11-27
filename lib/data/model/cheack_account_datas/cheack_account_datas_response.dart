// ignore_for_file: invalid_annotation_target


import 'package:freezed_annotation/freezed_annotation.dart';

part 'cheack_account_datas_response.freezed.dart';
part 'cheack_account_datas_response.g.dart';

@freezed
class CheckAccountResponse with _$CheckAccountResponse {
  const factory CheckAccountResponse({
    required bool account,
    required bool car,
    required bool insurance,
    @JsonKey(name: "policy_holder") required bool policyHolder,
  }) = _CheckAccountResponse;

  factory CheckAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckAccountResponseFromJson(json);
}
