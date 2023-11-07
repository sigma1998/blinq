// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ColorResponseDto _$ColorResponseDtoFromJson(Map<String, dynamic> json) {
  return _ColorResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ColorResponseDto {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<VehicleColorDto>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorResponseDtoCopyWith<ColorResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorResponseDtoCopyWith<$Res> {
  factory $ColorResponseDtoCopyWith(
          ColorResponseDto value, $Res Function(ColorResponseDto) then) =
      _$ColorResponseDtoCopyWithImpl<$Res, ColorResponseDto>;
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<VehicleColorDto>? results});
}

/// @nodoc
class _$ColorResponseDtoCopyWithImpl<$Res, $Val extends ColorResponseDto>
    implements $ColorResponseDtoCopyWith<$Res> {
  _$ColorResponseDtoCopyWithImpl(this._value, this._then);

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
              as List<VehicleColorDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorResponseDtoImplCopyWith<$Res>
    implements $ColorResponseDtoCopyWith<$Res> {
  factory _$$ColorResponseDtoImplCopyWith(_$ColorResponseDtoImpl value,
          $Res Function(_$ColorResponseDtoImpl) then) =
      __$$ColorResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<VehicleColorDto>? results});
}

/// @nodoc
class __$$ColorResponseDtoImplCopyWithImpl<$Res>
    extends _$ColorResponseDtoCopyWithImpl<$Res, _$ColorResponseDtoImpl>
    implements _$$ColorResponseDtoImplCopyWith<$Res> {
  __$$ColorResponseDtoImplCopyWithImpl(_$ColorResponseDtoImpl _value,
      $Res Function(_$ColorResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$ColorResponseDtoImpl(
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
              as List<VehicleColorDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorResponseDtoImpl implements _ColorResponseDto {
  const _$ColorResponseDtoImpl(
      {this.count,
      this.next,
      this.previous,
      final List<VehicleColorDto>? results})
      : _results = results;

  factory _$ColorResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorResponseDtoImplFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<VehicleColorDto>? _results;
  @override
  List<VehicleColorDto>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ColorResponseDto(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorResponseDtoImpl &&
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
  _$$ColorResponseDtoImplCopyWith<_$ColorResponseDtoImpl> get copyWith =>
      __$$ColorResponseDtoImplCopyWithImpl<_$ColorResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ColorResponseDto implements ColorResponseDto {
  const factory _ColorResponseDto(
      {final int? count,
      final String? next,
      final String? previous,
      final List<VehicleColorDto>? results}) = _$ColorResponseDtoImpl;

  factory _ColorResponseDto.fromJson(Map<String, dynamic> json) =
      _$ColorResponseDtoImpl.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<VehicleColorDto>? get results;
  @override
  @JsonKey(ignore: true)
  _$$ColorResponseDtoImplCopyWith<_$ColorResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
