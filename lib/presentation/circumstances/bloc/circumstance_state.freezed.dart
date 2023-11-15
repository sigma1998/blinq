// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circumstance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CircumstanceState {
  Set<String> get driverA => throw _privateConstructorUsedError;
  Set<String> get driverB => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CircumstanceStateCopyWith<CircumstanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircumstanceStateCopyWith<$Res> {
  factory $CircumstanceStateCopyWith(
          CircumstanceState value, $Res Function(CircumstanceState) then) =
      _$CircumstanceStateCopyWithImpl<$Res, CircumstanceState>;
  @useResult
  $Res call({Set<String> driverA, Set<String> driverB});
}

/// @nodoc
class _$CircumstanceStateCopyWithImpl<$Res, $Val extends CircumstanceState>
    implements $CircumstanceStateCopyWith<$Res> {
  _$CircumstanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverA = null,
    Object? driverB = null,
  }) {
    return _then(_value.copyWith(
      driverA: null == driverA
          ? _value.driverA
          : driverA // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      driverB: null == driverB
          ? _value.driverB
          : driverB // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircumstanceStateImplCopyWith<$Res>
    implements $CircumstanceStateCopyWith<$Res> {
  factory _$$CircumstanceStateImplCopyWith(_$CircumstanceStateImpl value,
          $Res Function(_$CircumstanceStateImpl) then) =
      __$$CircumstanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<String> driverA, Set<String> driverB});
}

/// @nodoc
class __$$CircumstanceStateImplCopyWithImpl<$Res>
    extends _$CircumstanceStateCopyWithImpl<$Res, _$CircumstanceStateImpl>
    implements _$$CircumstanceStateImplCopyWith<$Res> {
  __$$CircumstanceStateImplCopyWithImpl(_$CircumstanceStateImpl _value,
      $Res Function(_$CircumstanceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverA = null,
    Object? driverB = null,
  }) {
    return _then(_$CircumstanceStateImpl(
      driverA: null == driverA
          ? _value._driverA
          : driverA // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      driverB: null == driverB
          ? _value._driverB
          : driverB // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$CircumstanceStateImpl implements _CircumstanceState {
  const _$CircumstanceStateImpl(
      {final Set<String> driverA = const {},
      final Set<String> driverB = const {}})
      : _driverA = driverA,
        _driverB = driverB;

  final Set<String> _driverA;
  @override
  @JsonKey()
  Set<String> get driverA {
    if (_driverA is EqualUnmodifiableSetView) return _driverA;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_driverA);
  }

  final Set<String> _driverB;
  @override
  @JsonKey()
  Set<String> get driverB {
    if (_driverB is EqualUnmodifiableSetView) return _driverB;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_driverB);
  }

  @override
  String toString() {
    return 'CircumstanceState(driverA: $driverA, driverB: $driverB)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircumstanceStateImpl &&
            const DeepCollectionEquality().equals(other._driverA, _driverA) &&
            const DeepCollectionEquality().equals(other._driverB, _driverB));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_driverA),
      const DeepCollectionEquality().hash(_driverB));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CircumstanceStateImplCopyWith<_$CircumstanceStateImpl> get copyWith =>
      __$$CircumstanceStateImplCopyWithImpl<_$CircumstanceStateImpl>(
          this, _$identity);
}

abstract class _CircumstanceState implements CircumstanceState {
  const factory _CircumstanceState(
      {final Set<String> driverA,
      final Set<String> driverB}) = _$CircumstanceStateImpl;

  @override
  Set<String> get driverA;
  @override
  Set<String> get driverB;
  @override
  @JsonKey(ignore: true)
  _$$CircumstanceStateImplCopyWith<_$CircumstanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
