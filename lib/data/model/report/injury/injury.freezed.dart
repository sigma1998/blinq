// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'injury.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InjuryDto _$InjuryDtoFromJson(Map<String, dynamic> json) {
  return _InjuryDto.fromJson(json);
}

/// @nodoc
mixin _$InjuryDto {
  bool get injury => throw _privateConstructorUsedError;
  @JsonKey(name: "other_damaged_vehicles")
  bool get otherDamagedVehicles => throw _privateConstructorUsedError;
  @JsonKey(name: "other_damaged_items")
  bool get otherDamagedItems => throw _privateConstructorUsedError;

  /// Serializes this InjuryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InjuryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InjuryDtoCopyWith<InjuryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InjuryDtoCopyWith<$Res> {
  factory $InjuryDtoCopyWith(InjuryDto value, $Res Function(InjuryDto) then) =
      _$InjuryDtoCopyWithImpl<$Res, InjuryDto>;
  @useResult
  $Res call(
      {bool injury,
      @JsonKey(name: "other_damaged_vehicles") bool otherDamagedVehicles,
      @JsonKey(name: "other_damaged_items") bool otherDamagedItems});
}

/// @nodoc
class _$InjuryDtoCopyWithImpl<$Res, $Val extends InjuryDto>
    implements $InjuryDtoCopyWith<$Res> {
  _$InjuryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InjuryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? injury = null,
    Object? otherDamagedVehicles = null,
    Object? otherDamagedItems = null,
  }) {
    return _then(_value.copyWith(
      injury: null == injury
          ? _value.injury
          : injury // ignore: cast_nullable_to_non_nullable
              as bool,
      otherDamagedVehicles: null == otherDamagedVehicles
          ? _value.otherDamagedVehicles
          : otherDamagedVehicles // ignore: cast_nullable_to_non_nullable
              as bool,
      otherDamagedItems: null == otherDamagedItems
          ? _value.otherDamagedItems
          : otherDamagedItems // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InjuryDtoImplCopyWith<$Res>
    implements $InjuryDtoCopyWith<$Res> {
  factory _$$InjuryDtoImplCopyWith(
          _$InjuryDtoImpl value, $Res Function(_$InjuryDtoImpl) then) =
      __$$InjuryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool injury,
      @JsonKey(name: "other_damaged_vehicles") bool otherDamagedVehicles,
      @JsonKey(name: "other_damaged_items") bool otherDamagedItems});
}

/// @nodoc
class __$$InjuryDtoImplCopyWithImpl<$Res>
    extends _$InjuryDtoCopyWithImpl<$Res, _$InjuryDtoImpl>
    implements _$$InjuryDtoImplCopyWith<$Res> {
  __$$InjuryDtoImplCopyWithImpl(
      _$InjuryDtoImpl _value, $Res Function(_$InjuryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of InjuryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? injury = null,
    Object? otherDamagedVehicles = null,
    Object? otherDamagedItems = null,
  }) {
    return _then(_$InjuryDtoImpl(
      injury: null == injury
          ? _value.injury
          : injury // ignore: cast_nullable_to_non_nullable
              as bool,
      otherDamagedVehicles: null == otherDamagedVehicles
          ? _value.otherDamagedVehicles
          : otherDamagedVehicles // ignore: cast_nullable_to_non_nullable
              as bool,
      otherDamagedItems: null == otherDamagedItems
          ? _value.otherDamagedItems
          : otherDamagedItems // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InjuryDtoImpl implements _InjuryDto {
  const _$InjuryDtoImpl(
      {required this.injury,
      @JsonKey(name: "other_damaged_vehicles")
      required this.otherDamagedVehicles,
      @JsonKey(name: "other_damaged_items") required this.otherDamagedItems});

  factory _$InjuryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InjuryDtoImplFromJson(json);

  @override
  final bool injury;
  @override
  @JsonKey(name: "other_damaged_vehicles")
  final bool otherDamagedVehicles;
  @override
  @JsonKey(name: "other_damaged_items")
  final bool otherDamagedItems;

  @override
  String toString() {
    return 'InjuryDto(injury: $injury, otherDamagedVehicles: $otherDamagedVehicles, otherDamagedItems: $otherDamagedItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InjuryDtoImpl &&
            (identical(other.injury, injury) || other.injury == injury) &&
            (identical(other.otherDamagedVehicles, otherDamagedVehicles) ||
                other.otherDamagedVehicles == otherDamagedVehicles) &&
            (identical(other.otherDamagedItems, otherDamagedItems) ||
                other.otherDamagedItems == otherDamagedItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, injury, otherDamagedVehicles, otherDamagedItems);

  /// Create a copy of InjuryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InjuryDtoImplCopyWith<_$InjuryDtoImpl> get copyWith =>
      __$$InjuryDtoImplCopyWithImpl<_$InjuryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InjuryDtoImplToJson(
      this,
    );
  }
}

abstract class _InjuryDto implements InjuryDto {
  const factory _InjuryDto(
      {required final bool injury,
      @JsonKey(name: "other_damaged_vehicles")
      required final bool otherDamagedVehicles,
      @JsonKey(name: "other_damaged_items")
      required final bool otherDamagedItems}) = _$InjuryDtoImpl;

  factory _InjuryDto.fromJson(Map<String, dynamic> json) =
      _$InjuryDtoImpl.fromJson;

  @override
  bool get injury;
  @override
  @JsonKey(name: "other_damaged_vehicles")
  bool get otherDamagedVehicles;
  @override
  @JsonKey(name: "other_damaged_items")
  bool get otherDamagedItems;

  /// Create a copy of InjuryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InjuryDtoImplCopyWith<_$InjuryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
