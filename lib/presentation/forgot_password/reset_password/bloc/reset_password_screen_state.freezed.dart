// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPasswordScreenState {
  Status get status => throw _privateConstructorUsedError;
  dynamic get firstCodeVisible => throw _privateConstructorUsedError;
  dynamic get secondCodeVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordScreenStateCopyWith<ResetPasswordScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordScreenStateCopyWith<$Res> {
  factory $ResetPasswordScreenStateCopyWith(ResetPasswordScreenState value,
          $Res Function(ResetPasswordScreenState) then) =
      _$ResetPasswordScreenStateCopyWithImpl<$Res, ResetPasswordScreenState>;
  @useResult
  $Res call(
      {Status status, dynamic firstCodeVisible, dynamic secondCodeVisible});
}

/// @nodoc
class _$ResetPasswordScreenStateCopyWithImpl<$Res,
        $Val extends ResetPasswordScreenState>
    implements $ResetPasswordScreenStateCopyWith<$Res> {
  _$ResetPasswordScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? firstCodeVisible = freezed,
    Object? secondCodeVisible = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      firstCodeVisible: freezed == firstCodeVisible
          ? _value.firstCodeVisible
          : firstCodeVisible // ignore: cast_nullable_to_non_nullable
              as dynamic,
      secondCodeVisible: freezed == secondCodeVisible
          ? _value.secondCodeVisible
          : secondCodeVisible // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordScreenStateImplCopyWith<$Res>
    implements $ResetPasswordScreenStateCopyWith<$Res> {
  factory _$$ResetPasswordScreenStateImplCopyWith(
          _$ResetPasswordScreenStateImpl value,
          $Res Function(_$ResetPasswordScreenStateImpl) then) =
      __$$ResetPasswordScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status, dynamic firstCodeVisible, dynamic secondCodeVisible});
}

/// @nodoc
class __$$ResetPasswordScreenStateImplCopyWithImpl<$Res>
    extends _$ResetPasswordScreenStateCopyWithImpl<$Res,
        _$ResetPasswordScreenStateImpl>
    implements _$$ResetPasswordScreenStateImplCopyWith<$Res> {
  __$$ResetPasswordScreenStateImplCopyWithImpl(
      _$ResetPasswordScreenStateImpl _value,
      $Res Function(_$ResetPasswordScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? firstCodeVisible = freezed,
    Object? secondCodeVisible = freezed,
  }) {
    return _then(_$ResetPasswordScreenStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      firstCodeVisible: freezed == firstCodeVisible
          ? _value.firstCodeVisible!
          : firstCodeVisible,
      secondCodeVisible: freezed == secondCodeVisible
          ? _value.secondCodeVisible!
          : secondCodeVisible,
    ));
  }
}

/// @nodoc

class _$ResetPasswordScreenStateImpl implements _ResetPasswordScreenState {
  const _$ResetPasswordScreenStateImpl(
      {this.status = Status.initial,
      this.firstCodeVisible = true,
      this.secondCodeVisible = true});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final dynamic firstCodeVisible;
  @override
  @JsonKey()
  final dynamic secondCodeVisible;

  @override
  String toString() {
    return 'ResetPasswordScreenState(status: $status, firstCodeVisible: $firstCodeVisible, secondCodeVisible: $secondCodeVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordScreenStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.firstCodeVisible, firstCodeVisible) &&
            const DeepCollectionEquality()
                .equals(other.secondCodeVisible, secondCodeVisible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(firstCodeVisible),
      const DeepCollectionEquality().hash(secondCodeVisible));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordScreenStateImplCopyWith<_$ResetPasswordScreenStateImpl>
      get copyWith => __$$ResetPasswordScreenStateImplCopyWithImpl<
          _$ResetPasswordScreenStateImpl>(this, _$identity);
}

abstract class _ResetPasswordScreenState implements ResetPasswordScreenState {
  const factory _ResetPasswordScreenState(
      {final Status status,
      final dynamic firstCodeVisible,
      final dynamic secondCodeVisible}) = _$ResetPasswordScreenStateImpl;

  @override
  Status get status;
  @override
  dynamic get firstCodeVisible;
  @override
  dynamic get secondCodeVisible;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordScreenStateImplCopyWith<_$ResetPasswordScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
