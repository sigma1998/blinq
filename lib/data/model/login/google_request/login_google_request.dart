// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_google_request.freezed.dart';
part 'login_google_request.g.dart';
@freezed
class LoginGoogleRequest with _$LoginGoogleRequest {
  const factory LoginGoogleRequest({
    required String email,
    required String displayName,
    required String id,

  }) = _LoginGoogleRequest;

  factory LoginGoogleRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginGoogleRequestFromJson(json);
}
