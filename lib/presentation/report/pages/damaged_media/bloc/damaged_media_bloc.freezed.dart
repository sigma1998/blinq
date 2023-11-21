// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'damaged_media_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DamagedMediaState {
  Status get status => throw _privateConstructorUsedError;
  List<File> get files => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DamagedMediaStateCopyWith<DamagedMediaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DamagedMediaStateCopyWith<$Res> {
  factory $DamagedMediaStateCopyWith(
          DamagedMediaState value, $Res Function(DamagedMediaState) then) =
      _$DamagedMediaStateCopyWithImpl<$Res, DamagedMediaState>;
  @useResult
  $Res call({Status status, List<File> files, Error? error});
}

/// @nodoc
class _$DamagedMediaStateCopyWithImpl<$Res, $Val extends DamagedMediaState>
    implements $DamagedMediaStateCopyWith<$Res> {
  _$DamagedMediaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? files = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DamagedMediaStateImplCopyWith<$Res>
    implements $DamagedMediaStateCopyWith<$Res> {
  factory _$$DamagedMediaStateImplCopyWith(_$DamagedMediaStateImpl value,
          $Res Function(_$DamagedMediaStateImpl) then) =
      __$$DamagedMediaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, List<File> files, Error? error});
}

/// @nodoc
class __$$DamagedMediaStateImplCopyWithImpl<$Res>
    extends _$DamagedMediaStateCopyWithImpl<$Res, _$DamagedMediaStateImpl>
    implements _$$DamagedMediaStateImplCopyWith<$Res> {
  __$$DamagedMediaStateImplCopyWithImpl(_$DamagedMediaStateImpl _value,
      $Res Function(_$DamagedMediaStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? files = null,
    Object? error = freezed,
  }) {
    return _then(_$DamagedMediaStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$DamagedMediaStateImpl implements _DamagedMediaState {
  const _$DamagedMediaStateImpl(
      {this.status = Status.initial,
      final List<File> files = const [],
      this.error})
      : _files = files;

  @override
  @JsonKey()
  final Status status;
  final List<File> _files;
  @override
  @JsonKey()
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final Error? error;

  @override
  String toString() {
    return 'DamagedMediaState(status: $status, files: $files, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DamagedMediaStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_files), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DamagedMediaStateImplCopyWith<_$DamagedMediaStateImpl> get copyWith =>
      __$$DamagedMediaStateImplCopyWithImpl<_$DamagedMediaStateImpl>(
          this, _$identity);
}

abstract class _DamagedMediaState implements DamagedMediaState {
  const factory _DamagedMediaState(
      {final Status status,
      final List<File> files,
      final Error? error}) = _$DamagedMediaStateImpl;

  @override
  Status get status;
  @override
  List<File> get files;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$DamagedMediaStateImplCopyWith<_$DamagedMediaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
