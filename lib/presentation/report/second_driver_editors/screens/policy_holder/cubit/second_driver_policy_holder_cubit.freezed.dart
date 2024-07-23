// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'second_driver_policy_holder_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SecondDriverPolicyHolderState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SecondDriverPolicyHolderStateCopyWith<SecondDriverPolicyHolderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecondDriverPolicyHolderStateCopyWith<$Res> {
  factory $SecondDriverPolicyHolderStateCopyWith(
          SecondDriverPolicyHolderState value,
          $Res Function(SecondDriverPolicyHolderState) then) =
      _$SecondDriverPolicyHolderStateCopyWithImpl<$Res,
          SecondDriverPolicyHolderState>;
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class _$SecondDriverPolicyHolderStateCopyWithImpl<$Res,
        $Val extends SecondDriverPolicyHolderState>
    implements $SecondDriverPolicyHolderStateCopyWith<$Res> {
  _$SecondDriverPolicyHolderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecondDriverPolicyHolderStateImplCopyWith<$Res>
    implements $SecondDriverPolicyHolderStateCopyWith<$Res> {
  factory _$$SecondDriverPolicyHolderStateImplCopyWith(
          _$SecondDriverPolicyHolderStateImpl value,
          $Res Function(_$SecondDriverPolicyHolderStateImpl) then) =
      __$$SecondDriverPolicyHolderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class __$$SecondDriverPolicyHolderStateImplCopyWithImpl<$Res>
    extends _$SecondDriverPolicyHolderStateCopyWithImpl<$Res,
        _$SecondDriverPolicyHolderStateImpl>
    implements _$$SecondDriverPolicyHolderStateImplCopyWith<$Res> {
  __$$SecondDriverPolicyHolderStateImplCopyWithImpl(
      _$SecondDriverPolicyHolderStateImpl _value,
      $Res Function(_$SecondDriverPolicyHolderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$SecondDriverPolicyHolderStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$SecondDriverPolicyHolderStateImpl
    implements _SecondDriverPolicyHolderState {
  const _$SecondDriverPolicyHolderStateImpl(
      {this.status = Status.initial, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;

  @override
  String toString() {
    return 'SecondDriverPolicyHolderState(status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecondDriverPolicyHolderStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecondDriverPolicyHolderStateImplCopyWith<
          _$SecondDriverPolicyHolderStateImpl>
      get copyWith => __$$SecondDriverPolicyHolderStateImplCopyWithImpl<
          _$SecondDriverPolicyHolderStateImpl>(this, _$identity);
}

abstract class _SecondDriverPolicyHolderState
    implements SecondDriverPolicyHolderState {
  const factory _SecondDriverPolicyHolderState(
      {final Status status,
      final Error? error}) = _$SecondDriverPolicyHolderStateImpl;

  @override
  Status get status;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$SecondDriverPolicyHolderStateImplCopyWith<
          _$SecondDriverPolicyHolderStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
