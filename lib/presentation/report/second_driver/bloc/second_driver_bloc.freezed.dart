// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'second_driver_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SecondDriverState {
  Status get status => throw _privateConstructorUsedError;
  ProfileResponseModel? get secondDriver => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SecondDriverStateCopyWith<SecondDriverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecondDriverStateCopyWith<$Res> {
  factory $SecondDriverStateCopyWith(
          SecondDriverState value, $Res Function(SecondDriverState) then) =
      _$SecondDriverStateCopyWithImpl<$Res, SecondDriverState>;
  @useResult
  $Res call({Status status, ProfileResponseModel? secondDriver, Error? error});

  $ProfileResponseModelCopyWith<$Res>? get secondDriver;
}

/// @nodoc
class _$SecondDriverStateCopyWithImpl<$Res, $Val extends SecondDriverState>
    implements $SecondDriverStateCopyWith<$Res> {
  _$SecondDriverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? secondDriver = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      secondDriver: freezed == secondDriver
          ? _value.secondDriver
          : secondDriver // ignore: cast_nullable_to_non_nullable
              as ProfileResponseModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileResponseModelCopyWith<$Res>? get secondDriver {
    if (_value.secondDriver == null) {
      return null;
    }

    return $ProfileResponseModelCopyWith<$Res>(_value.secondDriver!, (value) {
      return _then(_value.copyWith(secondDriver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SecondDriverStateImplCopyWith<$Res>
    implements $SecondDriverStateCopyWith<$Res> {
  factory _$$SecondDriverStateImplCopyWith(_$SecondDriverStateImpl value,
          $Res Function(_$SecondDriverStateImpl) then) =
      __$$SecondDriverStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, ProfileResponseModel? secondDriver, Error? error});

  @override
  $ProfileResponseModelCopyWith<$Res>? get secondDriver;
}

/// @nodoc
class __$$SecondDriverStateImplCopyWithImpl<$Res>
    extends _$SecondDriverStateCopyWithImpl<$Res, _$SecondDriverStateImpl>
    implements _$$SecondDriverStateImplCopyWith<$Res> {
  __$$SecondDriverStateImplCopyWithImpl(_$SecondDriverStateImpl _value,
      $Res Function(_$SecondDriverStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? secondDriver = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SecondDriverStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      secondDriver: freezed == secondDriver
          ? _value.secondDriver
          : secondDriver // ignore: cast_nullable_to_non_nullable
              as ProfileResponseModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$SecondDriverStateImpl implements _SecondDriverState {
  const _$SecondDriverStateImpl(
      {this.status = Status.initial, this.secondDriver, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final ProfileResponseModel? secondDriver;
  @override
  final Error? error;

  @override
  String toString() {
    return 'SecondDriverState(status: $status, secondDriver: $secondDriver, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecondDriverStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.secondDriver, secondDriver) ||
                other.secondDriver == secondDriver) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, secondDriver, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecondDriverStateImplCopyWith<_$SecondDriverStateImpl> get copyWith =>
      __$$SecondDriverStateImplCopyWithImpl<_$SecondDriverStateImpl>(
          this, _$identity);
}

abstract class _SecondDriverState implements SecondDriverState {
  const factory _SecondDriverState(
      {final Status status,
      final ProfileResponseModel? secondDriver,
      final Error? error}) = _$SecondDriverStateImpl;

  @override
  Status get status;
  @override
  ProfileResponseModel? get secondDriver;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$SecondDriverStateImplCopyWith<_$SecondDriverStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
