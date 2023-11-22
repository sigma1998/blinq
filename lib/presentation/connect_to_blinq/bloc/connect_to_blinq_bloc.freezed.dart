// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connect_to_blinq_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectToBlinqState {
  Status get status => throw _privateConstructorUsedError;
  bool get isScanning => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectToBlinqStateCopyWith<ConnectToBlinqState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectToBlinqStateCopyWith<$Res> {
  factory $ConnectToBlinqStateCopyWith(
          ConnectToBlinqState value, $Res Function(ConnectToBlinqState) then) =
      _$ConnectToBlinqStateCopyWithImpl<$Res, ConnectToBlinqState>;
  @useResult
  $Res call({Status status, bool isScanning, Error? error});
}

/// @nodoc
class _$ConnectToBlinqStateCopyWithImpl<$Res, $Val extends ConnectToBlinqState>
    implements $ConnectToBlinqStateCopyWith<$Res> {
  _$ConnectToBlinqStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? isScanning = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectToBlinqStateImplCopyWith<$Res>
    implements $ConnectToBlinqStateCopyWith<$Res> {
  factory _$$ConnectToBlinqStateImplCopyWith(_$ConnectToBlinqStateImpl value,
          $Res Function(_$ConnectToBlinqStateImpl) then) =
      __$$ConnectToBlinqStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, bool isScanning, Error? error});
}

/// @nodoc
class __$$ConnectToBlinqStateImplCopyWithImpl<$Res>
    extends _$ConnectToBlinqStateCopyWithImpl<$Res, _$ConnectToBlinqStateImpl>
    implements _$$ConnectToBlinqStateImplCopyWith<$Res> {
  __$$ConnectToBlinqStateImplCopyWithImpl(_$ConnectToBlinqStateImpl _value,
      $Res Function(_$ConnectToBlinqStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? isScanning = null,
    Object? error = freezed,
  }) {
    return _then(_$ConnectToBlinqStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$ConnectToBlinqStateImpl implements _ConnectToBlinqState {
  const _$ConnectToBlinqStateImpl(
      {this.status = Status.initial, this.isScanning = false, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final bool isScanning;
  @override
  final Error? error;

  @override
  String toString() {
    return 'ConnectToBlinqState(status: $status, isScanning: $isScanning, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectToBlinqStateImpl &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(status), isScanning, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectToBlinqStateImplCopyWith<_$ConnectToBlinqStateImpl> get copyWith =>
      __$$ConnectToBlinqStateImplCopyWithImpl<_$ConnectToBlinqStateImpl>(
          this, _$identity);
}

abstract class _ConnectToBlinqState implements ConnectToBlinqState {
  const factory _ConnectToBlinqState(
      {final Status status,
      final bool isScanning,
      final Error? error}) = _$ConnectToBlinqStateImpl;

  @override
  Status get status;
  @override
  bool get isScanning;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$ConnectToBlinqStateImplCopyWith<_$ConnectToBlinqStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
