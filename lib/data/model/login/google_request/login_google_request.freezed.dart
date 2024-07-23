// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_google_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginGoogleRequest _$LoginGoogleRequestFromJson(Map<String, dynamic> json) {
  return _LoginGoogleRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginGoogleRequest {
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcm_token')
  String get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_type')
  String get deviceType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginGoogleRequestCopyWith<LoginGoogleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginGoogleRequestCopyWith<$Res> {
  factory $LoginGoogleRequestCopyWith(
          LoginGoogleRequest value, $Res Function(LoginGoogleRequest) then) =
      _$LoginGoogleRequestCopyWithImpl<$Res, LoginGoogleRequest>;
  @useResult
  $Res call(
      {String email,
      String displayName,
      String id,
      @JsonKey(name: 'fcm_token') String fcmToken,
      @JsonKey(name: 'device_type') String deviceType});
}

/// @nodoc
class _$LoginGoogleRequestCopyWithImpl<$Res, $Val extends LoginGoogleRequest>
    implements $LoginGoogleRequestCopyWith<$Res> {
  _$LoginGoogleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? displayName = null,
    Object? id = null,
    Object? fcmToken = null,
    Object? deviceType = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginGoogleRequestImplCopyWith<$Res>
    implements $LoginGoogleRequestCopyWith<$Res> {
  factory _$$LoginGoogleRequestImplCopyWith(_$LoginGoogleRequestImpl value,
          $Res Function(_$LoginGoogleRequestImpl) then) =
      __$$LoginGoogleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String displayName,
      String id,
      @JsonKey(name: 'fcm_token') String fcmToken,
      @JsonKey(name: 'device_type') String deviceType});
}

/// @nodoc
class __$$LoginGoogleRequestImplCopyWithImpl<$Res>
    extends _$LoginGoogleRequestCopyWithImpl<$Res, _$LoginGoogleRequestImpl>
    implements _$$LoginGoogleRequestImplCopyWith<$Res> {
  __$$LoginGoogleRequestImplCopyWithImpl(_$LoginGoogleRequestImpl _value,
      $Res Function(_$LoginGoogleRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? displayName = null,
    Object? id = null,
    Object? fcmToken = null,
    Object? deviceType = null,
  }) {
    return _then(_$LoginGoogleRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginGoogleRequestImpl implements _LoginGoogleRequest {
  const _$LoginGoogleRequestImpl(
      {required this.email,
      required this.displayName,
      required this.id,
      @JsonKey(name: 'fcm_token') required this.fcmToken,
      @JsonKey(name: 'device_type') required this.deviceType});

  factory _$LoginGoogleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginGoogleRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String displayName;
  @override
  final String id;
  @override
  @JsonKey(name: 'fcm_token')
  final String fcmToken;
  @override
  @JsonKey(name: 'device_type')
  final String deviceType;

  @override
  String toString() {
    return 'LoginGoogleRequest(email: $email, displayName: $displayName, id: $id, fcmToken: $fcmToken, deviceType: $deviceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginGoogleRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, displayName, id, fcmToken, deviceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginGoogleRequestImplCopyWith<_$LoginGoogleRequestImpl> get copyWith =>
      __$$LoginGoogleRequestImplCopyWithImpl<_$LoginGoogleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginGoogleRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginGoogleRequest implements LoginGoogleRequest {
  const factory _LoginGoogleRequest(
          {required final String email,
          required final String displayName,
          required final String id,
          @JsonKey(name: 'fcm_token') required final String fcmToken,
          @JsonKey(name: 'device_type') required final String deviceType}) =
      _$LoginGoogleRequestImpl;

  factory _LoginGoogleRequest.fromJson(Map<String, dynamic> json) =
      _$LoginGoogleRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get displayName;
  @override
  String get id;
  @override
  @JsonKey(name: 'fcm_token')
  String get fcmToken;
  @override
  @JsonKey(name: 'device_type')
  String get deviceType;
  @override
  @JsonKey(ignore: true)
  _$$LoginGoogleRequestImplCopyWith<_$LoginGoogleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
