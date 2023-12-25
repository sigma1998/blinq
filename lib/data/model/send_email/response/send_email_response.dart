// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_email_response.freezed.dart';
part 'send_email_response.g.dart';

@freezed
class SendEmailResponse with _$SendEmailResponse {
  const factory SendEmailResponse({
    required bool success,
    required String email,
    @JsonKey(name: 'verification_code') required String verificationCode,
  }) = _SendEmailResponse;

  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseFromJson(json);
}
