// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendEmailResponseImpl _$$SendEmailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SendEmailResponseImpl(
      success: json['success'] as bool,
      email: json['email'] as String,
      verificationCode: json['verification_code'] as String,
    );

Map<String, dynamic> _$$SendEmailResponseImplToJson(
        _$SendEmailResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'email': instance.email,
      'verification_code': instance.verificationCode,
    };
