// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_color_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleColorDto _$VehicleColorDtoFromJson(Map<String, dynamic> json) {
  return _VehicleColorDto.fromJson(json);
}

/// @nodoc
mixin _$VehicleColorDto {
  int? get id => throw _privateConstructorUsedError;
  String? get colour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleColorDtoCopyWith<VehicleColorDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleColorDtoCopyWith<$Res> {
  factory $VehicleColorDtoCopyWith(
          VehicleColorDto value, $Res Function(VehicleColorDto) then) =
      _$VehicleColorDtoCopyWithImpl<$Res, VehicleColorDto>;
  @useResult
  $Res call({int? id, String? colour});
}

/// @nodoc
class _$VehicleColorDtoCopyWithImpl<$Res, $Val extends VehicleColorDto>
    implements $VehicleColorDtoCopyWith<$Res> {
  _$VehicleColorDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? colour = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      colour: freezed == colour
          ? _value.colour
          : colour // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleColorDtoImplCopyWith<$Res>
    implements $VehicleColorDtoCopyWith<$Res> {
  factory _$$VehicleColorDtoImplCopyWith(_$VehicleColorDtoImpl value,
          $Res Function(_$VehicleColorDtoImpl) then) =
      __$$VehicleColorDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? colour});
}

/// @nodoc
class __$$VehicleColorDtoImplCopyWithImpl<$Res>
    extends _$VehicleColorDtoCopyWithImpl<$Res, _$VehicleColorDtoImpl>
    implements _$$VehicleColorDtoImplCopyWith<$Res> {
  __$$VehicleColorDtoImplCopyWithImpl(
      _$VehicleColorDtoImpl _value, $Res Function(_$VehicleColorDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? colour = freezed,
  }) {
    return _then(_$VehicleColorDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      colour: freezed == colour
          ? _value.colour
          : colour // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleColorDtoImpl implements _VehicleColorDto {
  const _$VehicleColorDtoImpl({this.id, this.colour});

  factory _$VehicleColorDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleColorDtoImplFromJson(json);

  @override
  final int? id;
  @override
  final String? colour;

  @override
  String toString() {
    return 'VehicleColorDto(id: $id, colour: $colour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleColorDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.colour, colour) || other.colour == colour));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, colour);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleColorDtoImplCopyWith<_$VehicleColorDtoImpl> get copyWith =>
      __$$VehicleColorDtoImplCopyWithImpl<_$VehicleColorDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleColorDtoImplToJson(
      this,
    );
  }
}

abstract class _VehicleColorDto implements VehicleColorDto {
  const factory _VehicleColorDto({final int? id, final String? colour}) =
      _$VehicleColorDtoImpl;

  factory _VehicleColorDto.fromJson(Map<String, dynamic> json) =
      _$VehicleColorDtoImpl.fromJson;

  @override
  int? get id;
  @override
  String? get colour;
  @override
  @JsonKey(ignore: true)
  _$$VehicleColorDtoImplCopyWith<_$VehicleColorDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
