// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactEditState {
  Status get status => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactEditStateCopyWith<ContactEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactEditStateCopyWith<$Res> {
  factory $ContactEditStateCopyWith(
          ContactEditState value, $Res Function(ContactEditState) then) =
      _$ContactEditStateCopyWithImpl<$Res, ContactEditState>;
  @useResult
  $Res call({Status status, File? image, Error? error});
}

/// @nodoc
class _$ContactEditStateCopyWithImpl<$Res, $Val extends ContactEditState>
    implements $ContactEditStateCopyWith<$Res> {
  _$ContactEditStateCopyWithImpl(this._value, this._then);

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
abstract class _$$ContactEditStateImplCopyWith<$Res>
    implements $ContactEditStateCopyWith<$Res> {
  factory _$$ContactEditStateImplCopyWith(_$ContactEditStateImpl value,
          $Res Function(_$ContactEditStateImpl) then) =
      __$$ContactEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, File? image, Error? error});
}

/// @nodoc
class __$$ContactEditStateImplCopyWithImpl<$Res>
    extends _$ContactEditStateCopyWithImpl<$Res, _$ContactEditStateImpl>
    implements _$$ContactEditStateImplCopyWith<$Res> {
  __$$ContactEditStateImplCopyWithImpl(_$ContactEditStateImpl _value,
      $Res Function(_$ContactEditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? image = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ContactEditStateImpl(
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

class _$ContactEditStateImpl implements _ContactEditState {
  const _$ContactEditStateImpl(
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
    return 'ContactEditState(status: $status, image: $image, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactEditStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, image, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactEditStateImplCopyWith<_$ContactEditStateImpl> get copyWith =>
      __$$ContactEditStateImplCopyWithImpl<_$ContactEditStateImpl>(
          this, _$identity);
}

abstract class _ContactEditState implements ContactEditState {
  const factory _ContactEditState(
      {final Status status,
      final File? image,
      final Error? error}) = _$ContactEditStateImpl;

  @override
  Status get status;
  @override
  File? get image;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$ContactEditStateImplCopyWith<_$ContactEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
