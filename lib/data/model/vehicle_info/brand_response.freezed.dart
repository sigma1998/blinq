// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BrandResponseDto _$BrandResponseDtoFromJson(Map<String, dynamic> json) {
  return _BrandResponseDto.fromJson(json);
}

/// @nodoc
mixin _$BrandResponseDto {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<VehicleInfoDto>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrandResponseDtoCopyWith<BrandResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandResponseDtoCopyWith<$Res> {
  factory $BrandResponseDtoCopyWith(
          BrandResponseDto value, $Res Function(BrandResponseDto) then) =
      _$BrandResponseDtoCopyWithImpl<$Res, BrandResponseDto>;
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<VehicleInfoDto>? results});
}

/// @nodoc
class _$BrandResponseDtoCopyWithImpl<$Res, $Val extends BrandResponseDto>
    implements $BrandResponseDtoCopyWith<$Res> {
  _$BrandResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<VehicleInfoDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandResponseDtoImplCopyWith<$Res>
    implements $BrandResponseDtoCopyWith<$Res> {
  factory _$$BrandResponseDtoImplCopyWith(_$BrandResponseDtoImpl value,
          $Res Function(_$BrandResponseDtoImpl) then) =
      __$$BrandResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<VehicleInfoDto>? results});
}

/// @nodoc
class __$$BrandResponseDtoImplCopyWithImpl<$Res>
    extends _$BrandResponseDtoCopyWithImpl<$Res, _$BrandResponseDtoImpl>
    implements _$$BrandResponseDtoImplCopyWith<$Res> {
  __$$BrandResponseDtoImplCopyWithImpl(_$BrandResponseDtoImpl _value,
      $Res Function(_$BrandResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$BrandResponseDtoImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<VehicleInfoDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandResponseDtoImpl implements _BrandResponseDto {
  const _$BrandResponseDtoImpl(
      {this.count,
      this.next,
      this.previous,
      final List<VehicleInfoDto>? results})
      : _results = results;

  factory _$BrandResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandResponseDtoImplFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<VehicleInfoDto>? _results;
  @override
  List<VehicleInfoDto>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BrandResponseDto(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandResponseDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandResponseDtoImplCopyWith<_$BrandResponseDtoImpl> get copyWith =>
      __$$BrandResponseDtoImplCopyWithImpl<_$BrandResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _BrandResponseDto implements BrandResponseDto {
  const factory _BrandResponseDto(
      {final int? count,
      final String? next,
      final String? previous,
      final List<VehicleInfoDto>? results}) = _$BrandResponseDtoImpl;

  factory _BrandResponseDto.fromJson(Map<String, dynamic> json) =
      _$BrandResponseDtoImpl.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<VehicleInfoDto>? get results;
  @override
  @JsonKey(ignore: true)
  _$$BrandResponseDtoImplCopyWith<_$BrandResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
