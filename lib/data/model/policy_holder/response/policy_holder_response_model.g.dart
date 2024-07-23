// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_holder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PolicyHolderResponseModelImpl _$$PolicyHolderResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PolicyHolderResponseModelImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
      address: json['address'] as String?,
      postalCode: json['postal_code'] as String?,
      phoneEmail: json['phone_email'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$$PolicyHolderResponseModelImplToJson(
        _$PolicyHolderResponseModelImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'street': instance.street,
      'address': instance.address,
      'postal_code': instance.postalCode,
      'phone_email': instance.phoneEmail,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
    };
