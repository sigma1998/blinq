// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'policy_holder_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PolicyHolderEditorState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PolicyHolderEditorStateCopyWith<PolicyHolderEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolicyHolderEditorStateCopyWith<$Res> {
  factory $PolicyHolderEditorStateCopyWith(PolicyHolderEditorState value,
          $Res Function(PolicyHolderEditorState) then) =
      _$PolicyHolderEditorStateCopyWithImpl<$Res, PolicyHolderEditorState>;
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class _$PolicyHolderEditorStateCopyWithImpl<$Res,
        $Val extends PolicyHolderEditorState>
    implements $PolicyHolderEditorStateCopyWith<$Res> {
  _$PolicyHolderEditorStateCopyWithImpl(this._value, this._then);

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
abstract class _$$PolicyHolderEditorStateImplCopyWith<$Res>
    implements $PolicyHolderEditorStateCopyWith<$Res> {
  factory _$$PolicyHolderEditorStateImplCopyWith(
          _$PolicyHolderEditorStateImpl value,
          $Res Function(_$PolicyHolderEditorStateImpl) then) =
      __$$PolicyHolderEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class __$$PolicyHolderEditorStateImplCopyWithImpl<$Res>
    extends _$PolicyHolderEditorStateCopyWithImpl<$Res,
        _$PolicyHolderEditorStateImpl>
    implements _$$PolicyHolderEditorStateImplCopyWith<$Res> {
  __$$PolicyHolderEditorStateImplCopyWithImpl(
      _$PolicyHolderEditorStateImpl _value,
      $Res Function(_$PolicyHolderEditorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$PolicyHolderEditorStateImpl(
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

class _$PolicyHolderEditorStateImpl implements _PolicyHolderEditorState {
  const _$PolicyHolderEditorStateImpl(
      {this.status = Status.initial, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;

  @override
  String toString() {
    return 'PolicyHolderEditorState(status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PolicyHolderEditorStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PolicyHolderEditorStateImplCopyWith<_$PolicyHolderEditorStateImpl>
      get copyWith => __$$PolicyHolderEditorStateImplCopyWithImpl<
          _$PolicyHolderEditorStateImpl>(this, _$identity);
}

abstract class _PolicyHolderEditorState implements PolicyHolderEditorState {
  const factory _PolicyHolderEditorState(
      {final Status status,
      final Error? error}) = _$PolicyHolderEditorStateImpl;

  @override
  Status get status;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$PolicyHolderEditorStateImplCopyWith<_$PolicyHolderEditorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
