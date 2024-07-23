// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsuranceRequestModelImpl _$$InsuranceRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InsuranceRequestModelImpl(
      name: json['name'] as String?,
      policyNumber: json['policy_number'] as String?,
      greenCardNumber: json['green_card_number'] as String?,
      certificateValidFrom: json['certificate_valid_from'] as String?,
      certificateValidTo: json['certificate_valid_to'] as String?,
      agency: json['agency'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
      postalCode: json['postal_code'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      policyCover: json['policy_cover'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$InsuranceRequestModelImplToJson(
        _$InsuranceRequestModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'policy_number': instance.policyNumber,
      'green_card_number': instance.greenCardNumber,
      'certificate_valid_from': instance.certificateValidFrom,
      'certificate_valid_to': instance.certificateValidTo,
      'agency': instance.agency,
      'city': instance.city,
      'state': instance.state,
      'street': instance.street,
      'postal_code': instance.postalCode,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'policy_cover': instance.policyCover,
      'country': instance.country,
    };
