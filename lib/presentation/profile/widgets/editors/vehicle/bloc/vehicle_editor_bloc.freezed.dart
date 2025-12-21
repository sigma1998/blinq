// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VehicleEditorState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of VehicleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleEditorStateCopyWith<VehicleEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleEditorStateCopyWith<$Res> {
  factory $VehicleEditorStateCopyWith(
          VehicleEditorState value, $Res Function(VehicleEditorState) then) =
      _$VehicleEditorStateCopyWithImpl<$Res, VehicleEditorState>;
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class _$VehicleEditorStateCopyWithImpl<$Res, $Val extends VehicleEditorState>
    implements $VehicleEditorStateCopyWith<$Res> {
  _$VehicleEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleEditorState
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
abstract class _$$VehicleEditorStateImplCopyWith<$Res>
    implements $VehicleEditorStateCopyWith<$Res> {
  factory _$$VehicleEditorStateImplCopyWith(_$VehicleEditorStateImpl value,
          $Res Function(_$VehicleEditorStateImpl) then) =
      __$$VehicleEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class __$$VehicleEditorStateImplCopyWithImpl<$Res>
    extends _$VehicleEditorStateCopyWithImpl<$Res, _$VehicleEditorStateImpl>
    implements _$$VehicleEditorStateImplCopyWith<$Res> {
  __$$VehicleEditorStateImplCopyWithImpl(_$VehicleEditorStateImpl _value,
      $Res Function(_$VehicleEditorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$VehicleEditorStateImpl(
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

class _$VehicleEditorStateImpl implements _VehicleEditorState {
  const _$VehicleEditorStateImpl({this.status = Status.initial, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;

  @override
  String toString() {
    return 'VehicleEditorState(status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleEditorStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  /// Create a copy of VehicleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleEditorStateImplCopyWith<_$VehicleEditorStateImpl> get copyWith =>
      __$$VehicleEditorStateImplCopyWithImpl<_$VehicleEditorStateImpl>(
          this, _$identity);
}

abstract class _VehicleEditorState implements VehicleEditorState {
  const factory _VehicleEditorState({final Status status, final Error? error}) =
      _$VehicleEditorStateImpl;

  @override
  Status get status;
  @override
  Error? get error;

  /// Create a copy of VehicleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleEditorStateImplCopyWith<_$VehicleEditorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
