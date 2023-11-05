// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordEditorState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError; //
  String get oldPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get passwordConfirm => throw _privateConstructorUsedError; //
  bool get isCodeVisible => throw _privateConstructorUsedError;
  bool get isConfirmCodeVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordEditorStateCopyWith<PasswordEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordEditorStateCopyWith<$Res> {
  factory $PasswordEditorStateCopyWith(
          PasswordEditorState value, $Res Function(PasswordEditorState) then) =
      _$PasswordEditorStateCopyWithImpl<$Res, PasswordEditorState>;
  @useResult
  $Res call(
      {Status status,
      Error? error,
      String oldPassword,
      String newPassword,
      String passwordConfirm,
      bool isCodeVisible,
      bool isConfirmCodeVisible});
}

/// @nodoc
class _$PasswordEditorStateCopyWithImpl<$Res, $Val extends PasswordEditorState>
    implements $PasswordEditorStateCopyWith<$Res> {
  _$PasswordEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? oldPassword = null,
    Object? newPassword = null,
    Object? passwordConfirm = null,
    Object? isCodeVisible = null,
    Object? isConfirmCodeVisible = null,
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
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirm: null == passwordConfirm
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      isCodeVisible: null == isCodeVisible
          ? _value.isCodeVisible
          : isCodeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmCodeVisible: null == isConfirmCodeVisible
          ? _value.isConfirmCodeVisible
          : isConfirmCodeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordEditorStateImplCopyWith<$Res>
    implements $PasswordEditorStateCopyWith<$Res> {
  factory _$$PasswordEditorStateImplCopyWith(_$PasswordEditorStateImpl value,
          $Res Function(_$PasswordEditorStateImpl) then) =
      __$$PasswordEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Error? error,
      String oldPassword,
      String newPassword,
      String passwordConfirm,
      bool isCodeVisible,
      bool isConfirmCodeVisible});
}

/// @nodoc
class __$$PasswordEditorStateImplCopyWithImpl<$Res>
    extends _$PasswordEditorStateCopyWithImpl<$Res, _$PasswordEditorStateImpl>
    implements _$$PasswordEditorStateImplCopyWith<$Res> {
  __$$PasswordEditorStateImplCopyWithImpl(_$PasswordEditorStateImpl _value,
      $Res Function(_$PasswordEditorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? oldPassword = null,
    Object? newPassword = null,
    Object? passwordConfirm = null,
    Object? isCodeVisible = null,
    Object? isConfirmCodeVisible = null,
  }) {
    return _then(_$PasswordEditorStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirm: null == passwordConfirm
          ? _value.passwordConfirm
          : passwordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
      isCodeVisible: null == isCodeVisible
          ? _value.isCodeVisible
          : isCodeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmCodeVisible: null == isConfirmCodeVisible
          ? _value.isConfirmCodeVisible
          : isConfirmCodeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PasswordEditorStateImpl implements _PasswordEditorState {
  const _$PasswordEditorStateImpl(
      {this.status = Status.initial,
      this.error,
      this.oldPassword = '',
      this.newPassword = '',
      this.passwordConfirm = '',
      this.isCodeVisible = true,
      this.isConfirmCodeVisible = true});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;
//
  @override
  @JsonKey()
  final String oldPassword;
  @override
  @JsonKey()
  final String newPassword;
  @override
  @JsonKey()
  final String passwordConfirm;
//
  @override
  @JsonKey()
  final bool isCodeVisible;
  @override
  @JsonKey()
  final bool isConfirmCodeVisible;

  @override
  String toString() {
    return 'PasswordEditorState(status: $status, error: $error, oldPassword: $oldPassword, newPassword: $newPassword, passwordConfirm: $passwordConfirm, isCodeVisible: $isCodeVisible, isConfirmCodeVisible: $isConfirmCodeVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordEditorStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.passwordConfirm, passwordConfirm) ||
                other.passwordConfirm == passwordConfirm) &&
            (identical(other.isCodeVisible, isCodeVisible) ||
                other.isCodeVisible == isCodeVisible) &&
            (identical(other.isConfirmCodeVisible, isConfirmCodeVisible) ||
                other.isConfirmCodeVisible == isConfirmCodeVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, oldPassword,
      newPassword, passwordConfirm, isCodeVisible, isConfirmCodeVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordEditorStateImplCopyWith<_$PasswordEditorStateImpl> get copyWith =>
      __$$PasswordEditorStateImplCopyWithImpl<_$PasswordEditorStateImpl>(
          this, _$identity);
}

abstract class _PasswordEditorState implements PasswordEditorState {
  const factory _PasswordEditorState(
      {final Status status,
      final Error? error,
      final String oldPassword,
      final String newPassword,
      final String passwordConfirm,
      final bool isCodeVisible,
      final bool isConfirmCodeVisible}) = _$PasswordEditorStateImpl;

  @override
  Status get status;
  @override
  Error? get error;
  @override //
  String get oldPassword;
  @override
  String get newPassword;
  @override
  String get passwordConfirm;
  @override //
  bool get isCodeVisible;
  @override
  bool get isConfirmCodeVisible;
  @override
  @JsonKey(ignore: true)
  _$$PasswordEditorStateImplCopyWith<_$PasswordEditorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
