// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bottom_sheet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginBottomSheetState {
  Status get status => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;
  bool get isCodeVisible => throw _privateConstructorUsedError;

  /// Create a copy of LoginBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginBottomSheetStateCopyWith<LoginBottomSheetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginBottomSheetStateCopyWith<$Res> {
  factory $LoginBottomSheetStateCopyWith(LoginBottomSheetState value,
          $Res Function(LoginBottomSheetState) then) =
      _$LoginBottomSheetStateCopyWithImpl<$Res, LoginBottomSheetState>;
  @useResult
  $Res call({Status status, Error? error, bool isCodeVisible});
}

/// @nodoc
class _$LoginBottomSheetStateCopyWithImpl<$Res,
        $Val extends LoginBottomSheetState>
    implements $LoginBottomSheetStateCopyWith<$Res> {
  _$LoginBottomSheetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isCodeVisible = null,
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
      isCodeVisible: null == isCodeVisible
          ? _value.isCodeVisible
          : isCodeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginBottomSheetStateImplCopyWith<$Res>
    implements $LoginBottomSheetStateCopyWith<$Res> {
  factory _$$LoginBottomSheetStateImplCopyWith(
          _$LoginBottomSheetStateImpl value,
          $Res Function(_$LoginBottomSheetStateImpl) then) =
      __$$LoginBottomSheetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Error? error, bool isCodeVisible});
}

/// @nodoc
class __$$LoginBottomSheetStateImplCopyWithImpl<$Res>
    extends _$LoginBottomSheetStateCopyWithImpl<$Res,
        _$LoginBottomSheetStateImpl>
    implements _$$LoginBottomSheetStateImplCopyWith<$Res> {
  __$$LoginBottomSheetStateImplCopyWithImpl(_$LoginBottomSheetStateImpl _value,
      $Res Function(_$LoginBottomSheetStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? isCodeVisible = null,
  }) {
    return _then(_$LoginBottomSheetStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
      isCodeVisible: null == isCodeVisible
          ? _value.isCodeVisible
          : isCodeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginBottomSheetStateImpl implements _LoginBottomSheetState {
  const _$LoginBottomSheetStateImpl(
      {this.status = Status.initial, this.error, this.isCodeVisible = true});

  @override
  @JsonKey()
  final Status status;
  @override
  final Error? error;
  @override
  @JsonKey()
  final bool isCodeVisible;

  @override
  String toString() {
    return 'LoginBottomSheetState(status: $status, error: $error, isCodeVisible: $isCodeVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginBottomSheetStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isCodeVisible, isCodeVisible) ||
                other.isCodeVisible == isCodeVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, isCodeVisible);

  /// Create a copy of LoginBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginBottomSheetStateImplCopyWith<_$LoginBottomSheetStateImpl>
      get copyWith => __$$LoginBottomSheetStateImplCopyWithImpl<
          _$LoginBottomSheetStateImpl>(this, _$identity);
}

abstract class _LoginBottomSheetState implements LoginBottomSheetState {
  const factory _LoginBottomSheetState(
      {final Status status,
      final Error? error,
      final bool isCodeVisible}) = _$LoginBottomSheetStateImpl;

  @override
  Status get status;
  @override
  Error? get error;
  @override
  bool get isCodeVisible;

  /// Create a copy of LoginBottomSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginBottomSheetStateImplCopyWith<_$LoginBottomSheetStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
