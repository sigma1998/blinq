// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premade_message_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PreMadeMessageEditorState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreMadeMessageEditorStateCopyWith<PreMadeMessageEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreMadeMessageEditorStateCopyWith<$Res> {
  factory $PreMadeMessageEditorStateCopyWith(PreMadeMessageEditorState value,
          $Res Function(PreMadeMessageEditorState) then) =
      _$PreMadeMessageEditorStateCopyWithImpl<$Res, PreMadeMessageEditorState>;
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class _$PreMadeMessageEditorStateCopyWithImpl<$Res,
        $Val extends PreMadeMessageEditorState>
    implements $PreMadeMessageEditorStateCopyWith<$Res> {
  _$PreMadeMessageEditorStateCopyWithImpl(this._value, this._then);

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
abstract class _$$PreMadeMessageEditorStateImplCopyWith<$Res>
    implements $PreMadeMessageEditorStateCopyWith<$Res> {
  factory _$$PreMadeMessageEditorStateImplCopyWith(
          _$PreMadeMessageEditorStateImpl value,
          $Res Function(_$PreMadeMessageEditorStateImpl) then) =
      __$$PreMadeMessageEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class __$$PreMadeMessageEditorStateImplCopyWithImpl<$Res>
    extends _$PreMadeMessageEditorStateCopyWithImpl<$Res,
        _$PreMadeMessageEditorStateImpl>
    implements _$$PreMadeMessageEditorStateImplCopyWith<$Res> {
  __$$PreMadeMessageEditorStateImplCopyWithImpl(
      _$PreMadeMessageEditorStateImpl _value,
      $Res Function(_$PreMadeMessageEditorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$PreMadeMessageEditorStateImpl(
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

class _$PreMadeMessageEditorStateImpl implements _PreMadeMessageEditorState {
  const _$PreMadeMessageEditorStateImpl(
      {this.status = Status.initial, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;

  @override
  String toString() {
    return 'PreMadeMessageEditorState(status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreMadeMessageEditorStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreMadeMessageEditorStateImplCopyWith<_$PreMadeMessageEditorStateImpl>
      get copyWith => __$$PreMadeMessageEditorStateImplCopyWithImpl<
          _$PreMadeMessageEditorStateImpl>(this, _$identity);
}

abstract class _PreMadeMessageEditorState implements PreMadeMessageEditorState {
  const factory _PreMadeMessageEditorState(
      {final Status status,
      final Error? error}) = _$PreMadeMessageEditorStateImpl;

  @override
  Status get status;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$PreMadeMessageEditorStateImplCopyWith<_$PreMadeMessageEditorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
