// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'damaged_parts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DamagedPartsState {
  Status get status => throw _privateConstructorUsedError;
  Set<String> get carParts => throw _privateConstructorUsedError;
  Set<String> get bigCarParts => throw _privateConstructorUsedError;
  Set<String> get motorcycleParts => throw _privateConstructorUsedError;
  int get pageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DamagedPartsStateCopyWith<DamagedPartsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DamagedPartsStateCopyWith<$Res> {
  factory $DamagedPartsStateCopyWith(
          DamagedPartsState value, $Res Function(DamagedPartsState) then) =
      _$DamagedPartsStateCopyWithImpl<$Res, DamagedPartsState>;
  @useResult
  $Res call(
      {Status status,
      Set<String> carParts,
      Set<String> bigCarParts,
      Set<String> motorcycleParts,
      int pageIndex});
}

/// @nodoc
class _$DamagedPartsStateCopyWithImpl<$Res, $Val extends DamagedPartsState>
    implements $DamagedPartsStateCopyWith<$Res> {
  _$DamagedPartsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? carParts = null,
    Object? bigCarParts = null,
    Object? motorcycleParts = null,
    Object? pageIndex = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      carParts: null == carParts
          ? _value.carParts
          : carParts // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      bigCarParts: null == bigCarParts
          ? _value.bigCarParts
          : bigCarParts // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      motorcycleParts: null == motorcycleParts
          ? _value.motorcycleParts
          : motorcycleParts // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DamagedPartsStateImplCopyWith<$Res>
    implements $DamagedPartsStateCopyWith<$Res> {
  factory _$$DamagedPartsStateImplCopyWith(_$DamagedPartsStateImpl value,
          $Res Function(_$DamagedPartsStateImpl) then) =
      __$$DamagedPartsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Set<String> carParts,
      Set<String> bigCarParts,
      Set<String> motorcycleParts,
      int pageIndex});
}

/// @nodoc
class __$$DamagedPartsStateImplCopyWithImpl<$Res>
    extends _$DamagedPartsStateCopyWithImpl<$Res, _$DamagedPartsStateImpl>
    implements _$$DamagedPartsStateImplCopyWith<$Res> {
  __$$DamagedPartsStateImplCopyWithImpl(_$DamagedPartsStateImpl _value,
      $Res Function(_$DamagedPartsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? carParts = null,
    Object? bigCarParts = null,
    Object? motorcycleParts = null,
    Object? pageIndex = null,
  }) {
    return _then(_$DamagedPartsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      carParts: null == carParts
          ? _value._carParts
          : carParts // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      bigCarParts: null == bigCarParts
          ? _value._bigCarParts
          : bigCarParts // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      motorcycleParts: null == motorcycleParts
          ? _value._motorcycleParts
          : motorcycleParts // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DamagedPartsStateImpl implements _DamagedPartsState {
  const _$DamagedPartsStateImpl(
      {this.status = Status.initial,
      final Set<String> carParts = const {},
      final Set<String> bigCarParts = const {},
      final Set<String> motorcycleParts = const {},
      this.pageIndex = 0})
      : _carParts = carParts,
        _bigCarParts = bigCarParts,
        _motorcycleParts = motorcycleParts;

  @override
  @JsonKey()
  final Status status;
  final Set<String> _carParts;
  @override
  @JsonKey()
  Set<String> get carParts {
    if (_carParts is EqualUnmodifiableSetView) return _carParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_carParts);
  }

  final Set<String> _bigCarParts;
  @override
  @JsonKey()
  Set<String> get bigCarParts {
    if (_bigCarParts is EqualUnmodifiableSetView) return _bigCarParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_bigCarParts);
  }

  final Set<String> _motorcycleParts;
  @override
  @JsonKey()
  Set<String> get motorcycleParts {
    if (_motorcycleParts is EqualUnmodifiableSetView) return _motorcycleParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_motorcycleParts);
  }

  @override
  @JsonKey()
  final int pageIndex;

  @override
  String toString() {
    return 'DamagedPartsState(status: $status, carParts: $carParts, bigCarParts: $bigCarParts, motorcycleParts: $motorcycleParts, pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DamagedPartsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._carParts, _carParts) &&
            const DeepCollectionEquality()
                .equals(other._bigCarParts, _bigCarParts) &&
            const DeepCollectionEquality()
                .equals(other._motorcycleParts, _motorcycleParts) &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_carParts),
      const DeepCollectionEquality().hash(_bigCarParts),
      const DeepCollectionEquality().hash(_motorcycleParts),
      pageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DamagedPartsStateImplCopyWith<_$DamagedPartsStateImpl> get copyWith =>
      __$$DamagedPartsStateImplCopyWithImpl<_$DamagedPartsStateImpl>(
          this, _$identity);
}

abstract class _DamagedPartsState implements DamagedPartsState {
  const factory _DamagedPartsState(
      {final Status status,
      final Set<String> carParts,
      final Set<String> bigCarParts,
      final Set<String> motorcycleParts,
      final int pageIndex}) = _$DamagedPartsStateImpl;

  @override
  Status get status;
  @override
  Set<String> get carParts;
  @override
  Set<String> get bigCarParts;
  @override
  Set<String> get motorcycleParts;
  @override
  int get pageIndex;
  @override
  @JsonKey(ignore: true)
  _$$DamagedPartsStateImplCopyWith<_$DamagedPartsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
