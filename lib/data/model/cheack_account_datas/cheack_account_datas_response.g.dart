// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheack_account_datas_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckAccountResponseImpl _$$CheckAccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckAccountResponseImpl(
      account: json['account'] as bool,
      car: json['car'] as bool,
      insurance: json['insurance'] as bool,
      policyHolder: json['policy_holder'] as bool,
    );

Map<String, dynamic> _$$CheckAccountResponseImplToJson(
        _$CheckAccountResponseImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
      'car': instance.car,
      'insurance': instance.insurance,
      'policy_holder': instance.policyHolder,
    };
