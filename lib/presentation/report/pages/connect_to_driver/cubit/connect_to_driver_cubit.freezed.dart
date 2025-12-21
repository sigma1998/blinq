// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connect_to_driver_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectToDriverState {
  Status get status => throw _privateConstructorUsedError;
  bool? get hasBlinq => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of ConnectToDriverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectToDriverStateCopyWith<ConnectToDriverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectToDriverStateCopyWith<$Res> {
  factory $ConnectToDriverStateCopyWith(ConnectToDriverState value,
          $Res Function(ConnectToDriverState) then) =
      _$ConnectToDriverStateCopyWithImpl<$Res, ConnectToDriverState>;
  @useResult
  $Res call({Status status, bool? hasBlinq, Error? error});
}

/// @nodoc
class _$ConnectToDriverStateCopyWithImpl<$Res,
        $Val extends ConnectToDriverState>
    implements $ConnectToDriverStateCopyWith<$Res> {
  _$ConnectToDriverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectToDriverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? hasBlinq = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      hasBlinq: freezed == hasBlinq
          ? _value.hasBlinq
          : hasBlinq // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectToDriverStateImplCopyWith<$Res>
    implements $ConnectToDriverStateCopyWith<$Res> {
  factory _$$ConnectToDriverStateImplCopyWith(_$ConnectToDriverStateImpl value,
          $Res Function(_$ConnectToDriverStateImpl) then) =
      __$$ConnectToDriverStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, bool? hasBlinq, Error? error});
}

/// @nodoc
class __$$ConnectToDriverStateImplCopyWithImpl<$Res>
    extends _$ConnectToDriverStateCopyWithImpl<$Res, _$ConnectToDriverStateImpl>
    implements _$$ConnectToDriverStateImplCopyWith<$Res> {
  __$$ConnectToDriverStateImplCopyWithImpl(_$ConnectToDriverStateImpl _value,
      $Res Function(_$ConnectToDriverStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectToDriverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? hasBlinq = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ConnectToDriverStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      hasBlinq: freezed == hasBlinq
          ? _value.hasBlinq
          : hasBlinq // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$ConnectToDriverStateImpl implements _ConnectToDriverState {
  const _$ConnectToDriverStateImpl(
      {this.status = Status.initial, this.hasBlinq, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final bool? hasBlinq;
  @override
  final Error? error;

  @override
  String toString() {
    return 'ConnectToDriverState(status: $status, hasBlinq: $hasBlinq, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectToDriverStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hasBlinq, hasBlinq) ||
                other.hasBlinq == hasBlinq) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, hasBlinq, error);

  /// Create a copy of ConnectToDriverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectToDriverStateImplCopyWith<_$ConnectToDriverStateImpl>
      get copyWith =>
          __$$ConnectToDriverStateImplCopyWithImpl<_$ConnectToDriverStateImpl>(
              this, _$identity);
}

abstract class _ConnectToDriverState implements ConnectToDriverState {
  const factory _ConnectToDriverState(
      {final Status status,
      final bool? hasBlinq,
      final Error? error}) = _$ConnectToDriverStateImpl;

  @override
  Status get status;
  @override
  bool? get hasBlinq;
  @override
  Error? get error;

  /// Create a copy of ConnectToDriverState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectToDriverStateImplCopyWith<_$ConnectToDriverStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
