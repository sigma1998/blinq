// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_vehicle_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyVehicleEditorState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of MyVehicleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyVehicleEditorStateCopyWith<MyVehicleEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyVehicleEditorStateCopyWith<$Res> {
  factory $MyVehicleEditorStateCopyWith(MyVehicleEditorState value,
          $Res Function(MyVehicleEditorState) then) =
      _$MyVehicleEditorStateCopyWithImpl<$Res, MyVehicleEditorState>;
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class _$MyVehicleEditorStateCopyWithImpl<$Res,
        $Val extends MyVehicleEditorState>
    implements $MyVehicleEditorStateCopyWith<$Res> {
  _$MyVehicleEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyVehicleEditorState
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
abstract class _$$MyVehicleEditorStateImplCopyWith<$Res>
    implements $MyVehicleEditorStateCopyWith<$Res> {
  factory _$$MyVehicleEditorStateImplCopyWith(_$MyVehicleEditorStateImpl value,
          $Res Function(_$MyVehicleEditorStateImpl) then) =
      __$$MyVehicleEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class __$$MyVehicleEditorStateImplCopyWithImpl<$Res>
    extends _$MyVehicleEditorStateCopyWithImpl<$Res, _$MyVehicleEditorStateImpl>
    implements _$$MyVehicleEditorStateImplCopyWith<$Res> {
  __$$MyVehicleEditorStateImplCopyWithImpl(_$MyVehicleEditorStateImpl _value,
      $Res Function(_$MyVehicleEditorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyVehicleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$MyVehicleEditorStateImpl(
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

class _$MyVehicleEditorStateImpl implements _MyVehicleEditorState {
  const _$MyVehicleEditorStateImpl({this.status = Status.initial, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;

  @override
  String toString() {
    return 'MyVehicleEditorState(status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyVehicleEditorStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  /// Create a copy of MyVehicleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyVehicleEditorStateImplCopyWith<_$MyVehicleEditorStateImpl>
      get copyWith =>
          __$$MyVehicleEditorStateImplCopyWithImpl<_$MyVehicleEditorStateImpl>(
              this, _$identity);
}

abstract class _MyVehicleEditorState implements MyVehicleEditorState {
  const factory _MyVehicleEditorState(
      {final Status status, final Error? error}) = _$MyVehicleEditorStateImpl;

  @override
  Status get status;
  @override
  Error? get error;

  /// Create a copy of MyVehicleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyVehicleEditorStateImplCopyWith<_$MyVehicleEditorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
