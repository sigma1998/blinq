// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_info_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationInfoScreenState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of LocationInfoScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationInfoScreenStateCopyWith<LocationInfoScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationInfoScreenStateCopyWith<$Res> {
  factory $LocationInfoScreenStateCopyWith(LocationInfoScreenState value,
          $Res Function(LocationInfoScreenState) then) =
      _$LocationInfoScreenStateCopyWithImpl<$Res, LocationInfoScreenState>;
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class _$LocationInfoScreenStateCopyWithImpl<$Res,
        $Val extends LocationInfoScreenState>
    implements $LocationInfoScreenStateCopyWith<$Res> {
  _$LocationInfoScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationInfoScreenState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$LocationInfoScreenStateImplCopyWith<$Res>
    implements $LocationInfoScreenStateCopyWith<$Res> {
  factory _$$LocationInfoScreenStateImplCopyWith(
          _$LocationInfoScreenStateImpl value,
          $Res Function(_$LocationInfoScreenStateImpl) then) =
      __$$LocationInfoScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class __$$LocationInfoScreenStateImplCopyWithImpl<$Res>
    extends _$LocationInfoScreenStateCopyWithImpl<$Res,
        _$LocationInfoScreenStateImpl>
    implements _$$LocationInfoScreenStateImplCopyWith<$Res> {
  __$$LocationInfoScreenStateImplCopyWithImpl(
      _$LocationInfoScreenStateImpl _value,
      $Res Function(_$LocationInfoScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationInfoScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$LocationInfoScreenStateImpl(
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

class _$LocationInfoScreenStateImpl implements _LocationInfoScreenState {
  const _$LocationInfoScreenStateImpl(
      {this.status = Status.initial, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;

  @override
  String toString() {
    return 'LocationInfoScreenState(status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationInfoScreenStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  /// Create a copy of LocationInfoScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationInfoScreenStateImplCopyWith<_$LocationInfoScreenStateImpl>
      get copyWith => __$$LocationInfoScreenStateImplCopyWithImpl<
          _$LocationInfoScreenStateImpl>(this, _$identity);
}

abstract class _LocationInfoScreenState implements LocationInfoScreenState {
  const factory _LocationInfoScreenState(
      {final Status status,
      final Error? error}) = _$LocationInfoScreenStateImpl;

  @override
  Status get status;
  @override
  Error? get error;

  /// Create a copy of LocationInfoScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationInfoScreenStateImplCopyWith<_$LocationInfoScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
