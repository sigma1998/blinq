// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premade_messages_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreMadeMessagesState {
  Status get status => throw _privateConstructorUsedError;
  PreMadeMessageResponseDto? get premadeMessages =>
      throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreMadeMessagesStateCopyWith<PreMadeMessagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreMadeMessagesStateCopyWith<$Res> {
  factory $PreMadeMessagesStateCopyWith(PreMadeMessagesState value,
          $Res Function(PreMadeMessagesState) then) =
      _$PreMadeMessagesStateCopyWithImpl<$Res, PreMadeMessagesState>;
  @useResult
  $Res call(
      {Status status,
      PreMadeMessageResponseDto? premadeMessages,
      Error? error});

  $PreMadeMessageResponseDtoCopyWith<$Res>? get premadeMessages;
}

/// @nodoc
class _$PreMadeMessagesStateCopyWithImpl<$Res,
        $Val extends PreMadeMessagesState>
    implements $PreMadeMessagesStateCopyWith<$Res> {
  _$PreMadeMessagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? premadeMessages = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      premadeMessages: freezed == premadeMessages
          ? _value.premadeMessages
          : premadeMessages // ignore: cast_nullable_to_non_nullable
              as PreMadeMessageResponseDto?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PreMadeMessageResponseDtoCopyWith<$Res>? get premadeMessages {
    if (_value.premadeMessages == null) {
      return null;
    }

    return $PreMadeMessageResponseDtoCopyWith<$Res>(_value.premadeMessages!,
        (value) {
      return _then(_value.copyWith(premadeMessages: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PremadeMessagesStateImplCopyWith<$Res>
    implements $PreMadeMessagesStateCopyWith<$Res> {
  factory _$$PremadeMessagesStateImplCopyWith(_$PremadeMessagesStateImpl value,
          $Res Function(_$PremadeMessagesStateImpl) then) =
      __$$PremadeMessagesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      PreMadeMessageResponseDto? premadeMessages,
      Error? error});

  @override
  $PreMadeMessageResponseDtoCopyWith<$Res>? get premadeMessages;
}

/// @nodoc
class __$$PremadeMessagesStateImplCopyWithImpl<$Res>
    extends _$PreMadeMessagesStateCopyWithImpl<$Res, _$PremadeMessagesStateImpl>
    implements _$$PremadeMessagesStateImplCopyWith<$Res> {
  __$$PremadeMessagesStateImplCopyWithImpl(_$PremadeMessagesStateImpl _value,
      $Res Function(_$PremadeMessagesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? premadeMessages = freezed,
    Object? error = freezed,
  }) {
    return _then(_$PremadeMessagesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      premadeMessages: freezed == premadeMessages
          ? _value.premadeMessages
          : premadeMessages // ignore: cast_nullable_to_non_nullable
              as PreMadeMessageResponseDto?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$PremadeMessagesStateImpl implements _PremadeMessagesState {
  const _$PremadeMessagesStateImpl(
      {this.status = Status.initial, this.premadeMessages, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final PreMadeMessageResponseDto? premadeMessages;
  @override
  final Error? error;

  @override
  String toString() {
    return 'PreMadeMessagesState(status: $status, premadeMessages: $premadeMessages, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremadeMessagesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.premadeMessages, premadeMessages) ||
                other.premadeMessages == premadeMessages) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, premadeMessages, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PremadeMessagesStateImplCopyWith<_$PremadeMessagesStateImpl>
      get copyWith =>
          __$$PremadeMessagesStateImplCopyWithImpl<_$PremadeMessagesStateImpl>(
              this, _$identity);
}

abstract class _PremadeMessagesState implements PreMadeMessagesState {
  const factory _PremadeMessagesState(
      {final Status status,
      final PreMadeMessageResponseDto? premadeMessages,
      final Error? error}) = _$PremadeMessagesStateImpl;

  @override
  Status get status;
  @override
  PreMadeMessageResponseDto? get premadeMessages;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$PremadeMessagesStateImplCopyWith<_$PremadeMessagesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
