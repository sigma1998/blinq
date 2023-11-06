// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailEditorState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError; //
  bool get isCodeSent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailEditorStateCopyWith<EmailEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailEditorStateCopyWith<$Res> {
  factory $EmailEditorStateCopyWith(
          EmailEditorState value, $Res Function(EmailEditorState) then) =
      _$EmailEditorStateCopyWithImpl<$Res, EmailEditorState>;
  @useResult
  $Res call({Status status, Error? error, bool isCodeSent});
}

/// @nodoc
class _$EmailEditorStateCopyWithImpl<$Res, $Val extends EmailEditorState>
    implements $EmailEditorStateCopyWith<$Res> {
  _$EmailEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isCodeSent = null,
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
      isCodeSent: null == isCodeSent
          ? _value.isCodeSent
          : isCodeSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailEditorStateImplCopyWith<$Res>
    implements $EmailEditorStateCopyWith<$Res> {
  factory _$$EmailEditorStateImplCopyWith(_$EmailEditorStateImpl value,
          $Res Function(_$EmailEditorStateImpl) then) =
      __$$EmailEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Error? error, bool isCodeSent});
}

/// @nodoc
class __$$EmailEditorStateImplCopyWithImpl<$Res>
    extends _$EmailEditorStateCopyWithImpl<$Res, _$EmailEditorStateImpl>
    implements _$$EmailEditorStateImplCopyWith<$Res> {
  __$$EmailEditorStateImplCopyWithImpl(_$EmailEditorStateImpl _value,
      $Res Function(_$EmailEditorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isCodeSent = null,
  }) {
    return _then(_$EmailEditorStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
      isCodeSent: null == isCodeSent
          ? _value.isCodeSent
          : isCodeSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EmailEditorStateImpl implements _EmailEditorState {
  const _$EmailEditorStateImpl(
      {this.status = Status.initial, this.error, this.isCodeSent = false});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;
//
  @override
  @JsonKey()
  final bool isCodeSent;

  @override
  String toString() {
    return 'EmailEditorState(status: $status, error: $error, isCodeSent: $isCodeSent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailEditorStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isCodeSent, isCodeSent) ||
                other.isCodeSent == isCodeSent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, isCodeSent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailEditorStateImplCopyWith<_$EmailEditorStateImpl> get copyWith =>
      __$$EmailEditorStateImplCopyWithImpl<_$EmailEditorStateImpl>(
          this, _$identity);
}

abstract class _EmailEditorState implements EmailEditorState {
  const factory _EmailEditorState(
      {final Status status,
      final Error? error,
      final bool isCodeSent}) = _$EmailEditorStateImpl;

  @override
  Status get status;
  @override
  Error? get error;
  @override //
  bool get isCodeSent;
  @override
  @JsonKey(ignore: true)
  _$$EmailEditorStateImplCopyWith<_$EmailEditorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
