// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_email_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendEmailResponse _$SendEmailResponseFromJson(Map<String, dynamic> json) {
  return _SendEmailResponse.fromJson(json);
}

/// @nodoc
mixin _$SendEmailResponse {
  bool get success => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_code')
  String get verificationCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendEmailResponseCopyWith<SendEmailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendEmailResponseCopyWith<$Res> {
  factory $SendEmailResponseCopyWith(
          SendEmailResponse value, $Res Function(SendEmailResponse) then) =
      _$SendEmailResponseCopyWithImpl<$Res, SendEmailResponse>;
  @useResult
  $Res call(
      {bool success,
      String email,
      @JsonKey(name: 'verification_code') String verificationCode});
}

/// @nodoc
class _$SendEmailResponseCopyWithImpl<$Res, $Val extends SendEmailResponse>
    implements $SendEmailResponseCopyWith<$Res> {
  _$SendEmailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? email = null,
    Object? verificationCode = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendEmailResponseImplCopyWith<$Res>
    implements $SendEmailResponseCopyWith<$Res> {
  factory _$$SendEmailResponseImplCopyWith(_$SendEmailResponseImpl value,
          $Res Function(_$SendEmailResponseImpl) then) =
      __$$SendEmailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String email,
      @JsonKey(name: 'verification_code') String verificationCode});
}

/// @nodoc
class __$$SendEmailResponseImplCopyWithImpl<$Res>
    extends _$SendEmailResponseCopyWithImpl<$Res, _$SendEmailResponseImpl>
    implements _$$SendEmailResponseImplCopyWith<$Res> {
  __$$SendEmailResponseImplCopyWithImpl(_$SendEmailResponseImpl _value,
      $Res Function(_$SendEmailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? email = null,
    Object? verificationCode = null,
  }) {
    return _then(_$SendEmailResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendEmailResponseImpl implements _SendEmailResponse {
  const _$SendEmailResponseImpl(
      {required this.success,
      required this.email,
      @JsonKey(name: 'verification_code') required this.verificationCode});

  factory _$SendEmailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendEmailResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String email;
  @override
  @JsonKey(name: 'verification_code')
  final String verificationCode;

  @override
  String toString() {
    return 'SendEmailResponse(success: $success, email: $email, verificationCode: $verificationCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEmailResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, email, verificationCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendEmailResponseImplCopyWith<_$SendEmailResponseImpl> get copyWith =>
      __$$SendEmailResponseImplCopyWithImpl<_$SendEmailResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendEmailResponseImplToJson(
      this,
    );
  }
}

abstract class _SendEmailResponse implements SendEmailResponse {
  const factory _SendEmailResponse(
      {required final bool success,
      required final String email,
      @JsonKey(name: 'verification_code')
      required final String verificationCode}) = _$SendEmailResponseImpl;

  factory _SendEmailResponse.fromJson(Map<String, dynamic> json) =
      _$SendEmailResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get email;
  @override
  @JsonKey(name: 'verification_code')
  String get verificationCode;
  @override
  @JsonKey(ignore: true)
  _$$SendEmailResponseImplCopyWith<_$SendEmailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
