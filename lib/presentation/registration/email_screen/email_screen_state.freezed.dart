// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailScreenState {
  Status get status => throw _privateConstructorUsedError;
  SendEmailResponse? get sendEmailResponse =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailScreenStateCopyWith<EmailScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailScreenStateCopyWith<$Res> {
  factory $EmailScreenStateCopyWith(
          EmailScreenState value, $Res Function(EmailScreenState) then) =
      _$EmailScreenStateCopyWithImpl<$Res, EmailScreenState>;
  @useResult
  $Res call({Status status, SendEmailResponse? sendEmailResponse});

  $SendEmailResponseCopyWith<$Res>? get sendEmailResponse;
}

/// @nodoc
class _$EmailScreenStateCopyWithImpl<$Res, $Val extends EmailScreenState>
    implements $EmailScreenStateCopyWith<$Res> {
  _$EmailScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sendEmailResponse = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      sendEmailResponse: freezed == sendEmailResponse
          ? _value.sendEmailResponse
          : sendEmailResponse // ignore: cast_nullable_to_non_nullable
              as SendEmailResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SendEmailResponseCopyWith<$Res>? get sendEmailResponse {
    if (_value.sendEmailResponse == null) {
      return null;
    }

    return $SendEmailResponseCopyWith<$Res>(_value.sendEmailResponse!, (value) {
      return _then(_value.copyWith(sendEmailResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmailScreenStateImplCopyWith<$Res>
    implements $EmailScreenStateCopyWith<$Res> {
  factory _$$EmailScreenStateImplCopyWith(_$EmailScreenStateImpl value,
          $Res Function(_$EmailScreenStateImpl) then) =
      __$$EmailScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, SendEmailResponse? sendEmailResponse});

  @override
  $SendEmailResponseCopyWith<$Res>? get sendEmailResponse;
}

/// @nodoc
class __$$EmailScreenStateImplCopyWithImpl<$Res>
    extends _$EmailScreenStateCopyWithImpl<$Res, _$EmailScreenStateImpl>
    implements _$$EmailScreenStateImplCopyWith<$Res> {
  __$$EmailScreenStateImplCopyWithImpl(_$EmailScreenStateImpl _value,
      $Res Function(_$EmailScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sendEmailResponse = freezed,
  }) {
    return _then(_$EmailScreenStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      sendEmailResponse: freezed == sendEmailResponse
          ? _value.sendEmailResponse
          : sendEmailResponse // ignore: cast_nullable_to_non_nullable
              as SendEmailResponse?,
    ));
  }
}

/// @nodoc

class _$EmailScreenStateImpl implements _EmailScreenState {
  const _$EmailScreenStateImpl(
      {this.status = Status.initial, this.sendEmailResponse});

  @override
  @JsonKey()
  final Status status;
  @override
  final SendEmailResponse? sendEmailResponse;

  @override
  String toString() {
    return 'EmailScreenState(status: $status, sendEmailResponse: $sendEmailResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailScreenStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sendEmailResponse, sendEmailResponse) ||
                other.sendEmailResponse == sendEmailResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, sendEmailResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailScreenStateImplCopyWith<_$EmailScreenStateImpl> get copyWith =>
      __$$EmailScreenStateImplCopyWithImpl<_$EmailScreenStateImpl>(
          this, _$identity);
}

abstract class _EmailScreenState implements EmailScreenState {
  const factory _EmailScreenState(
      {final Status status,
      final SendEmailResponse? sendEmailResponse}) = _$EmailScreenStateImpl;

  @override
  Status get status;
  @override
  SendEmailResponse? get sendEmailResponse;
  @override
  @JsonKey(ignore: true)
  _$$EmailScreenStateImplCopyWith<_$EmailScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
