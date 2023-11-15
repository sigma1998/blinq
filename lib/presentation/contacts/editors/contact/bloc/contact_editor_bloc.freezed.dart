// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactEditorState {
  Status get status => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactEditorStateCopyWith<ContactEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactEditorStateCopyWith<$Res> {
  factory $ContactEditorStateCopyWith(
          ContactEditorState value, $Res Function(ContactEditorState) then) =
      _$ContactEditorStateCopyWithImpl<$Res, ContactEditorState>;
  @useResult
  $Res call({Status status, File? image, Error? error});
}

/// @nodoc
class _$ContactEditorStateCopyWithImpl<$Res, $Val extends ContactEditorState>
    implements $ContactEditorStateCopyWith<$Res> {
  _$ContactEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? image = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactEditorStateImplCopyWith<$Res>
    implements $ContactEditorStateCopyWith<$Res> {
  factory _$$ContactEditorStateImplCopyWith(_$ContactEditorStateImpl value,
          $Res Function(_$ContactEditorStateImpl) then) =
      __$$ContactEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, File? image, Error? error});
}

/// @nodoc
class __$$ContactEditorStateImplCopyWithImpl<$Res>
    extends _$ContactEditorStateCopyWithImpl<$Res, _$ContactEditorStateImpl>
    implements _$$ContactEditorStateImplCopyWith<$Res> {
  __$$ContactEditorStateImplCopyWithImpl(_$ContactEditorStateImpl _value,
      $Res Function(_$ContactEditorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? image = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ContactEditorStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$ContactEditorStateImpl implements _ContactEditorState {
  const _$ContactEditorStateImpl(
      {this.status = Status.initial, this.image, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final File? image;
  @override
  final Error? error;

  @override
  String toString() {
    return 'ContactEditorState(status: $status, image: $image, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactEditorStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, image, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactEditorStateImplCopyWith<_$ContactEditorStateImpl> get copyWith =>
      __$$ContactEditorStateImplCopyWithImpl<_$ContactEditorStateImpl>(
          this, _$identity);
}

abstract class _ContactEditorState implements ContactEditorState {
  const factory _ContactEditorState(
      {final Status status,
      final File? image,
      final Error? error}) = _$ContactEditorStateImpl;

  @override
  Status get status;
  @override
  File? get image;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$ContactEditorStateImplCopyWith<_$ContactEditorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
