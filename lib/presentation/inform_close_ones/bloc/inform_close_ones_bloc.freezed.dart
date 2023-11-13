// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inform_close_ones_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InformCloseOnesState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InformCloseOnesStateCopyWith<InformCloseOnesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformCloseOnesStateCopyWith<$Res> {
  factory $InformCloseOnesStateCopyWith(InformCloseOnesState value,
          $Res Function(InformCloseOnesState) then) =
      _$InformCloseOnesStateCopyWithImpl<$Res, InformCloseOnesState>;
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class _$InformCloseOnesStateCopyWithImpl<$Res,
        $Val extends InformCloseOnesState>
    implements $InformCloseOnesStateCopyWith<$Res> {
  _$InformCloseOnesStateCopyWithImpl(this._value, this._then);

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
abstract class _$$InformCloseOnesStateImplCopyWith<$Res>
    implements $InformCloseOnesStateCopyWith<$Res> {
  factory _$$InformCloseOnesStateImplCopyWith(_$InformCloseOnesStateImpl value,
          $Res Function(_$InformCloseOnesStateImpl) then) =
      __$$InformCloseOnesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Error? error});
}

/// @nodoc
class __$$InformCloseOnesStateImplCopyWithImpl<$Res>
    extends _$InformCloseOnesStateCopyWithImpl<$Res, _$InformCloseOnesStateImpl>
    implements _$$InformCloseOnesStateImplCopyWith<$Res> {
  __$$InformCloseOnesStateImplCopyWithImpl(_$InformCloseOnesStateImpl _value,
      $Res Function(_$InformCloseOnesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$InformCloseOnesStateImpl(
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

class _$InformCloseOnesStateImpl implements _InformCloseOnesState {
  const _$InformCloseOnesStateImpl({this.status = Status.initial, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;

  @override
  String toString() {
    return 'InformCloseOnesState(status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InformCloseOnesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InformCloseOnesStateImplCopyWith<_$InformCloseOnesStateImpl>
      get copyWith =>
          __$$InformCloseOnesStateImplCopyWithImpl<_$InformCloseOnesStateImpl>(
              this, _$identity);
}

abstract class _InformCloseOnesState implements InformCloseOnesState {
  const factory _InformCloseOnesState(
      {final Status status, final Error? error}) = _$InformCloseOnesStateImpl;

  @override
  Status get status;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$InformCloseOnesStateImplCopyWith<_$InformCloseOnesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
