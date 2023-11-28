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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InjuryDto _$InjuryDtoFromJson(Map<String, dynamic> json) {
  return _InjuryDto.fromJson(json);
}

/// @nodoc
mixin _$InjuryDto {
  String get country => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InjuryDtoCopyWith<InjuryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InjuryDtoCopyWith<$Res> {
  factory $InjuryDtoCopyWith(InjuryDto value, $Res Function(InjuryDto) then) =
      _$InjuryDtoCopyWithImpl<$Res, InjuryDto>;
  @useResult
  $Res call(
      {String country,
      String location,
      @JsonKey(name: "created_at") String createdAt});
}

/// @nodoc
class _$InjuryDtoCopyWithImpl<$Res, $Val extends InjuryDto>
    implements $InjuryDtoCopyWith<$Res> {
  _$InjuryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? location = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String country,
      String location,
      @JsonKey(name: "created_at") String createdAt});
}

/// @nodoc
class __$$InjuryDtoImplCopyWithImpl<$Res>
    extends _$InjuryDtoCopyWithImpl<$Res, _$InjuryDtoImpl>
    implements _$$InjuryDtoImplCopyWith<$Res> {
  __$$InjuryDtoImplCopyWithImpl(
      _$InjuryDtoImpl _value, $Res Function(_$InjuryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? location = null,
    Object? createdAt = null,
  }) {
    return _then(_$InjuryDtoImpl(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InjuryDtoImpl implements _InjuryDto {
  const _$InjuryDtoImpl(
      {required this.country,
      required this.location,
      @JsonKey(name: "created_at") required this.createdAt});

  factory _$InjuryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InjuryDtoImplFromJson(json);

  @override
  final String country;
  @override
  final String location;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;

  @override
  String toString() {
    return 'InjuryDto(country: $country, location: $location, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InjuryDtoImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, country, location, createdAt);

  @JsonKey(ignore: true)
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
          {required final String country,
          required final String location,
          @JsonKey(name: "created_at") required final String createdAt}) =
      _$InjuryDtoImpl;

  factory _InjuryDto.fromJson(Map<String, dynamic> json) =
      _$InjuryDtoImpl.fromJson;

  @override
  String get country;
  @override
  String get location;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$InjuryDtoImplCopyWith<_$InjuryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
