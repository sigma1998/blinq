// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleInfoDto _$VehicleInfoDtoFromJson(Map<String, dynamic> json) {
  return _VehicleInfoDto.fromJson(json);
}

/// @nodoc
mixin _$VehicleInfoDto {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleInfoDtoCopyWith<VehicleInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleInfoDtoCopyWith<$Res> {
  factory $VehicleInfoDtoCopyWith(
          VehicleInfoDto value, $Res Function(VehicleInfoDto) then) =
      _$VehicleInfoDtoCopyWithImpl<$Res, VehicleInfoDto>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$VehicleInfoDtoCopyWithImpl<$Res, $Val extends VehicleInfoDto>
    implements $VehicleInfoDtoCopyWith<$Res> {
  _$VehicleInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleInfoDtoImplCopyWith<$Res>
    implements $VehicleInfoDtoCopyWith<$Res> {
  factory _$$VehicleInfoDtoImplCopyWith(_$VehicleInfoDtoImpl value,
          $Res Function(_$VehicleInfoDtoImpl) then) =
      __$$VehicleInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$VehicleInfoDtoImplCopyWithImpl<$Res>
    extends _$VehicleInfoDtoCopyWithImpl<$Res, _$VehicleInfoDtoImpl>
    implements _$$VehicleInfoDtoImplCopyWith<$Res> {
  __$$VehicleInfoDtoImplCopyWithImpl(
      _$VehicleInfoDtoImpl _value, $Res Function(_$VehicleInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$VehicleInfoDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleInfoDtoImpl implements _VehicleInfoDto {
  const _$VehicleInfoDtoImpl({this.id, this.name});

  factory _$VehicleInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleInfoDtoImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'VehicleInfoDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleInfoDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleInfoDtoImplCopyWith<_$VehicleInfoDtoImpl> get copyWith =>
      __$$VehicleInfoDtoImplCopyWithImpl<_$VehicleInfoDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _VehicleInfoDto implements VehicleInfoDto {
  const factory _VehicleInfoDto({final int? id, final String? name}) =
      _$VehicleInfoDtoImpl;

  factory _VehicleInfoDto.fromJson(Map<String, dynamic> json) =
      _$VehicleInfoDtoImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$VehicleInfoDtoImplCopyWith<_$VehicleInfoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
