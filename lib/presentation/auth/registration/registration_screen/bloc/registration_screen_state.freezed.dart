// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationScreenState {
  Status get status => throw _privateConstructorUsedError;
  dynamic get firstCodeVisible => throw _privateConstructorUsedError;
  dynamic get secondCodeVisible => throw _privateConstructorUsedError;

  /// Create a copy of RegistrationScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationScreenStateCopyWith<RegistrationScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationScreenStateCopyWith<$Res> {
  factory $RegistrationScreenStateCopyWith(RegistrationScreenState value,
          $Res Function(RegistrationScreenState) then) =
      _$RegistrationScreenStateCopyWithImpl<$Res, RegistrationScreenState>;
  @useResult
  $Res call(
      {Status status, dynamic firstCodeVisible, dynamic secondCodeVisible});
}

/// @nodoc
class _$RegistrationScreenStateCopyWithImpl<$Res,
        $Val extends RegistrationScreenState>
    implements $RegistrationScreenStateCopyWith<$Res> {
  _$RegistrationScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationScreenState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$RegistrationScreenStateImplCopyWith<$Res>
    implements $RegistrationScreenStateCopyWith<$Res> {
  factory _$$RegistrationScreenStateImplCopyWith(
          _$RegistrationScreenStateImpl value,
          $Res Function(_$RegistrationScreenStateImpl) then) =
      __$$RegistrationScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status, dynamic firstCodeVisible, dynamic secondCodeVisible});
}

/// @nodoc
class __$$RegistrationScreenStateImplCopyWithImpl<$Res>
    extends _$RegistrationScreenStateCopyWithImpl<$Res,
        _$RegistrationScreenStateImpl>
    implements _$$RegistrationScreenStateImplCopyWith<$Res> {
  __$$RegistrationScreenStateImplCopyWithImpl(
      _$RegistrationScreenStateImpl _value,
      $Res Function(_$RegistrationScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? firstCodeVisible = freezed,
    Object? secondCodeVisible = freezed,
  }) {
    return _then(_$RegistrationScreenStateImpl(
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

class _$RegistrationScreenStateImpl implements _RegistrationScreenState {
  const _$RegistrationScreenStateImpl(
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
    return 'RegistrationScreenState(status: $status, firstCodeVisible: $firstCodeVisible, secondCodeVisible: $secondCodeVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationScreenStateImpl &&
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

  /// Create a copy of RegistrationScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationScreenStateImplCopyWith<_$RegistrationScreenStateImpl>
      get copyWith => __$$RegistrationScreenStateImplCopyWithImpl<
          _$RegistrationScreenStateImpl>(this, _$identity);
}

abstract class _RegistrationScreenState implements RegistrationScreenState {
  const factory _RegistrationScreenState(
      {final Status status,
      final dynamic firstCodeVisible,
      final dynamic secondCodeVisible}) = _$RegistrationScreenStateImpl;

  @override
  Status get status;
  @override
  dynamic get firstCodeVisible;
  @override
  dynamic get secondCodeVisible;

  /// Create a copy of RegistrationScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationScreenStateImplCopyWith<_$RegistrationScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
