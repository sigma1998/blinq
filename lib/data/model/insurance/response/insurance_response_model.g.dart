// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsuranceResponseModelImpl _$$InsuranceResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InsuranceResponseModelImpl(
      name: json['name'] as String?,
      policyNumber: json['policy_number'] as String?,
      greenCardNumber: json['green_card_number'] as String?,
      certificateValidFrom: json['certificate_valid_from'] as String?,
      certificateValidTo: json['certificate_valid_to'] as String?,
      agency: json['agency'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      policyCover: json['policy_cover'] as String?,
    );

Map<String, dynamic> _$$InsuranceResponseModelImplToJson(
        _$InsuranceResponseModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'policy_number': instance.policyNumber,
      'green_card_number': instance.greenCardNumber,
      'certificate_valid_from': instance.certificateValidFrom,
      'certificate_valid_to': instance.certificateValidTo,
      'agency': instance.agency,
      'country': instance.country,
      'address': instance.address,
      'email': instance.email,
      'policy_cover': instance.policyCover,
    };
