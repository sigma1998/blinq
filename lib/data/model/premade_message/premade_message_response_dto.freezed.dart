// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premade_message_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PreMadeMessageResponseDto _$PreMadeMessageResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _PremadeMessageResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PreMadeMessageResponseDto {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<PreMadeMessageResponseModel>? get results =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreMadeMessageResponseDtoCopyWith<PreMadeMessageResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreMadeMessageResponseDtoCopyWith<$Res> {
  factory $PreMadeMessageResponseDtoCopyWith(PreMadeMessageResponseDto value,
          $Res Function(PreMadeMessageResponseDto) then) =
      _$PreMadeMessageResponseDtoCopyWithImpl<$Res, PreMadeMessageResponseDto>;
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<PreMadeMessageResponseModel>? results});
}

/// @nodoc
class _$PreMadeMessageResponseDtoCopyWithImpl<$Res,
        $Val extends PreMadeMessageResponseDto>
    implements $PreMadeMessageResponseDtoCopyWith<$Res> {
  _$PreMadeMessageResponseDtoCopyWithImpl(this._value, this._then);

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
              as List<PreMadeMessageResponseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PremadeMessageResponseDtoImplCopyWith<$Res>
    implements $PreMadeMessageResponseDtoCopyWith<$Res> {
  factory _$$PremadeMessageResponseDtoImplCopyWith(
          _$PremadeMessageResponseDtoImpl value,
          $Res Function(_$PremadeMessageResponseDtoImpl) then) =
      __$$PremadeMessageResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<PreMadeMessageResponseModel>? results});
}

/// @nodoc
class __$$PremadeMessageResponseDtoImplCopyWithImpl<$Res>
    extends _$PreMadeMessageResponseDtoCopyWithImpl<$Res,
        _$PremadeMessageResponseDtoImpl>
    implements _$$PremadeMessageResponseDtoImplCopyWith<$Res> {
  __$$PremadeMessageResponseDtoImplCopyWithImpl(
      _$PremadeMessageResponseDtoImpl _value,
      $Res Function(_$PremadeMessageResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$PremadeMessageResponseDtoImpl(
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
              as List<PreMadeMessageResponseModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PremadeMessageResponseDtoImpl implements _PremadeMessageResponseDto {
  const _$PremadeMessageResponseDtoImpl(
      {this.count,
      this.next,
      this.previous,
      final List<PreMadeMessageResponseModel>? results})
      : _results = results;

  factory _$PremadeMessageResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PremadeMessageResponseDtoImplFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<PreMadeMessageResponseModel>? _results;
  @override
  List<PreMadeMessageResponseModel>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PreMadeMessageResponseDto(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremadeMessageResponseDtoImpl &&
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
  _$$PremadeMessageResponseDtoImplCopyWith<_$PremadeMessageResponseDtoImpl>
      get copyWith => __$$PremadeMessageResponseDtoImplCopyWithImpl<
          _$PremadeMessageResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PremadeMessageResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _PremadeMessageResponseDto implements PreMadeMessageResponseDto {
  const factory _PremadeMessageResponseDto(
          {final int? count,
          final String? next,
          final String? previous,
          final List<PreMadeMessageResponseModel>? results}) =
      _$PremadeMessageResponseDtoImpl;

  factory _PremadeMessageResponseDto.fromJson(Map<String, dynamic> json) =
      _$PremadeMessageResponseDtoImpl.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<PreMadeMessageResponseModel>? get results;
  @override
  @JsonKey(ignore: true)
  _$$PremadeMessageResponseDtoImplCopyWith<_$PremadeMessageResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
