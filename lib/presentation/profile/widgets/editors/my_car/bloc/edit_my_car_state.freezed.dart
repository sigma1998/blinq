// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_my_car_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditMyCarState {
  Status get status => throw _privateConstructorUsedError;

  /// Create a copy of EditMyCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditMyCarStateCopyWith<EditMyCarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMyCarStateCopyWith<$Res> {
  factory $EditMyCarStateCopyWith(
          EditMyCarState value, $Res Function(EditMyCarState) then) =
      _$EditMyCarStateCopyWithImpl<$Res, EditMyCarState>;
  @useResult
  $Res call({Status status});
}

/// @nodoc
class _$EditMyCarStateCopyWithImpl<$Res, $Val extends EditMyCarState>
    implements $EditMyCarStateCopyWith<$Res> {
  _$EditMyCarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditMyCarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditMyCarStateImplCopyWith<$Res>
    implements $EditMyCarStateCopyWith<$Res> {
  factory _$$EditMyCarStateImplCopyWith(_$EditMyCarStateImpl value,
          $Res Function(_$EditMyCarStateImpl) then) =
      __$$EditMyCarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status});
}

/// @nodoc
class __$$EditMyCarStateImplCopyWithImpl<$Res>
    extends _$EditMyCarStateCopyWithImpl<$Res, _$EditMyCarStateImpl>
    implements _$$EditMyCarStateImplCopyWith<$Res> {
  __$$EditMyCarStateImplCopyWithImpl(
      _$EditMyCarStateImpl _value, $Res Function(_$EditMyCarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditMyCarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$EditMyCarStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$EditMyCarStateImpl implements _EditMyCarState {
  const _$EditMyCarStateImpl({this.status = Status.initial});

  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'EditMyCarState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditMyCarStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of EditMyCarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditMyCarStateImplCopyWith<_$EditMyCarStateImpl> get copyWith =>
      __$$EditMyCarStateImplCopyWithImpl<_$EditMyCarStateImpl>(
          this, _$identity);
}

abstract class _EditMyCarState implements EditMyCarState {
  const factory _EditMyCarState({final Status status}) = _$EditMyCarStateImpl;

  @override
  Status get status;

  /// Create a copy of EditMyCarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditMyCarStateImplCopyWith<_$EditMyCarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
