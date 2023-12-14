// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_time_and_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportTimeAndLocationDto _$ReportTimeAndLocationDtoFromJson(
    Map<String, dynamic> json) {
  return _AccidentTimeAndLocationDto.fromJson(json);
}

/// @nodoc
mixin _$ReportTimeAndLocationDto {
  String get country => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportTimeAndLocationDtoCopyWith<ReportTimeAndLocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportTimeAndLocationDtoCopyWith<$Res> {
  factory $ReportTimeAndLocationDtoCopyWith(ReportTimeAndLocationDto value,
          $Res Function(ReportTimeAndLocationDto) then) =
      _$ReportTimeAndLocationDtoCopyWithImpl<$Res, ReportTimeAndLocationDto>;
  @useResult
  $Res call(
      {String country,
      String location,
      @JsonKey(name: "created_at") String createdAt});
}

/// @nodoc
class _$ReportTimeAndLocationDtoCopyWithImpl<$Res,
        $Val extends ReportTimeAndLocationDto>
    implements $ReportTimeAndLocationDtoCopyWith<$Res> {
  _$ReportTimeAndLocationDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$AccidentTimeAndLocationDtoImplCopyWith<$Res>
    implements $ReportTimeAndLocationDtoCopyWith<$Res> {
  factory _$$AccidentTimeAndLocationDtoImplCopyWith(
          _$AccidentTimeAndLocationDtoImpl value,
          $Res Function(_$AccidentTimeAndLocationDtoImpl) then) =
      __$$AccidentTimeAndLocationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String country,
      String location,
      @JsonKey(name: "created_at") String createdAt});
}

/// @nodoc
class __$$AccidentTimeAndLocationDtoImplCopyWithImpl<$Res>
    extends _$ReportTimeAndLocationDtoCopyWithImpl<$Res,
        _$AccidentTimeAndLocationDtoImpl>
    implements _$$AccidentTimeAndLocationDtoImplCopyWith<$Res> {
  __$$AccidentTimeAndLocationDtoImplCopyWithImpl(
      _$AccidentTimeAndLocationDtoImpl _value,
      $Res Function(_$AccidentTimeAndLocationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? location = null,
    Object? createdAt = null,
  }) {
    return _then(_$AccidentTimeAndLocationDtoImpl(
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
class _$AccidentTimeAndLocationDtoImpl implements _AccidentTimeAndLocationDto {
  const _$AccidentTimeAndLocationDtoImpl(
      {required this.country,
      required this.location,
      @JsonKey(name: "created_at") required this.createdAt});

  factory _$AccidentTimeAndLocationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AccidentTimeAndLocationDtoImplFromJson(json);

  @override
  final String country;
  @override
  final String location;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;

  @override
  String toString() {
    return 'ReportTimeAndLocationDto(country: $country, location: $location, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccidentTimeAndLocationDtoImpl &&
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
  _$$AccidentTimeAndLocationDtoImplCopyWith<_$AccidentTimeAndLocationDtoImpl>
      get copyWith => __$$AccidentTimeAndLocationDtoImplCopyWithImpl<
          _$AccidentTimeAndLocationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccidentTimeAndLocationDtoImplToJson(
      this,
    );
  }
}

abstract class _AccidentTimeAndLocationDto implements ReportTimeAndLocationDto {
  const factory _AccidentTimeAndLocationDto(
          {required final String country,
          required final String location,
          @JsonKey(name: "created_at") required final String createdAt}) =
      _$AccidentTimeAndLocationDtoImpl;

  factory _AccidentTimeAndLocationDto.fromJson(Map<String, dynamic> json) =
      _$AccidentTimeAndLocationDtoImpl.fromJson;

  @override
  String get country;
  @override
  String get location;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AccidentTimeAndLocationDtoImplCopyWith<_$AccidentTimeAndLocationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
