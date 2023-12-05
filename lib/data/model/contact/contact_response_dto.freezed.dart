// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactResponseDto _$ContactResponseDtoFromJson(Map<String, dynamic> json) {
  return _ContactResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ContactResponseDto {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<ContactResponseModel>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactResponseDtoCopyWith<ContactResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactResponseDtoCopyWith<$Res> {
  factory $ContactResponseDtoCopyWith(
          ContactResponseDto value, $Res Function(ContactResponseDto) then) =
      _$ContactResponseDtoCopyWithImpl<$Res, ContactResponseDto>;
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<ContactResponseModel>? results});
}

/// @nodoc
class _$ContactResponseDtoCopyWithImpl<$Res, $Val extends ContactResponseDto>
    implements $ContactResponseDtoCopyWith<$Res> {
  _$ContactResponseDtoCopyWithImpl(this._value, this._then);

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
              as List<ContactResponseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactResponseDtoImplCopyWith<$Res>
    implements $ContactResponseDtoCopyWith<$Res> {
  factory _$$ContactResponseDtoImplCopyWith(_$ContactResponseDtoImpl value,
          $Res Function(_$ContactResponseDtoImpl) then) =
      __$$ContactResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<ContactResponseModel>? results});
}

/// @nodoc
class __$$ContactResponseDtoImplCopyWithImpl<$Res>
    extends _$ContactResponseDtoCopyWithImpl<$Res, _$ContactResponseDtoImpl>
    implements _$$ContactResponseDtoImplCopyWith<$Res> {
  __$$ContactResponseDtoImplCopyWithImpl(_$ContactResponseDtoImpl _value,
      $Res Function(_$ContactResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$ContactResponseDtoImpl(
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
              as List<ContactResponseModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactResponseDtoImpl implements _ContactResponseDto {
  const _$ContactResponseDtoImpl(
      {this.count,
      this.next,
      this.previous,
      final List<ContactResponseModel>? results})
      : _results = results;

  factory _$ContactResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactResponseDtoImplFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<ContactResponseModel>? _results;
  @override
  List<ContactResponseModel>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContactResponseDto(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactResponseDtoImpl &&
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
  _$$ContactResponseDtoImplCopyWith<_$ContactResponseDtoImpl> get copyWith =>
      __$$ContactResponseDtoImplCopyWithImpl<_$ContactResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ContactResponseDto implements ContactResponseDto {
  const factory _ContactResponseDto(
      {final int? count,
      final String? next,
      final String? previous,
      final List<ContactResponseModel>? results}) = _$ContactResponseDtoImpl;

  factory _ContactResponseDto.fromJson(Map<String, dynamic> json) =
      _$ContactResponseDtoImpl.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<ContactResponseModel>? get results;
  @override
  @JsonKey(ignore: true)
  _$$ContactResponseDtoImplCopyWith<_$ContactResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
