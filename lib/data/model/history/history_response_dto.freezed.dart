// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryResponseDto _$HistoryResponseDtoFromJson(Map<String, dynamic> json) {
  return _HistoryResponseDto.fromJson(json);
}

/// @nodoc
mixin _$HistoryResponseDto {
  List<HistoryItemModelDto> get breakdowns =>
      throw _privateConstructorUsedError;
  List<HistoryItemModelDto> get accidents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryResponseDtoCopyWith<HistoryResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryResponseDtoCopyWith<$Res> {
  factory $HistoryResponseDtoCopyWith(
          HistoryResponseDto value, $Res Function(HistoryResponseDto) then) =
      _$HistoryResponseDtoCopyWithImpl<$Res, HistoryResponseDto>;
  @useResult
  $Res call(
      {List<HistoryItemModelDto> breakdowns,
      List<HistoryItemModelDto> accidents});
}

/// @nodoc
class _$HistoryResponseDtoCopyWithImpl<$Res, $Val extends HistoryResponseDto>
    implements $HistoryResponseDtoCopyWith<$Res> {
  _$HistoryResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breakdowns = null,
    Object? accidents = null,
  }) {
    return _then(_value.copyWith(
      breakdowns: null == breakdowns
          ? _value.breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as List<HistoryItemModelDto>,
      accidents: null == accidents
          ? _value.accidents
          : accidents // ignore: cast_nullable_to_non_nullable
              as List<HistoryItemModelDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryResponseDtoImplCopyWith<$Res>
    implements $HistoryResponseDtoCopyWith<$Res> {
  factory _$$HistoryResponseDtoImplCopyWith(_$HistoryResponseDtoImpl value,
          $Res Function(_$HistoryResponseDtoImpl) then) =
      __$$HistoryResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HistoryItemModelDto> breakdowns,
      List<HistoryItemModelDto> accidents});
}

/// @nodoc
class __$$HistoryResponseDtoImplCopyWithImpl<$Res>
    extends _$HistoryResponseDtoCopyWithImpl<$Res, _$HistoryResponseDtoImpl>
    implements _$$HistoryResponseDtoImplCopyWith<$Res> {
  __$$HistoryResponseDtoImplCopyWithImpl(_$HistoryResponseDtoImpl _value,
      $Res Function(_$HistoryResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breakdowns = null,
    Object? accidents = null,
  }) {
    return _then(_$HistoryResponseDtoImpl(
      breakdowns: null == breakdowns
          ? _value._breakdowns
          : breakdowns // ignore: cast_nullable_to_non_nullable
              as List<HistoryItemModelDto>,
      accidents: null == accidents
          ? _value._accidents
          : accidents // ignore: cast_nullable_to_non_nullable
              as List<HistoryItemModelDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryResponseDtoImpl implements _HistoryResponseDto {
  const _$HistoryResponseDtoImpl(
      {final List<HistoryItemModelDto> breakdowns = const [],
      final List<HistoryItemModelDto> accidents = const []})
      : _breakdowns = breakdowns,
        _accidents = accidents;

  factory _$HistoryResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryResponseDtoImplFromJson(json);

  final List<HistoryItemModelDto> _breakdowns;
  @override
  @JsonKey()
  List<HistoryItemModelDto> get breakdowns {
    if (_breakdowns is EqualUnmodifiableListView) return _breakdowns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breakdowns);
  }

  final List<HistoryItemModelDto> _accidents;
  @override
  @JsonKey()
  List<HistoryItemModelDto> get accidents {
    if (_accidents is EqualUnmodifiableListView) return _accidents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accidents);
  }

  @override
  String toString() {
    return 'HistoryResponseDto(breakdowns: $breakdowns, accidents: $accidents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryResponseDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._breakdowns, _breakdowns) &&
            const DeepCollectionEquality()
                .equals(other._accidents, _accidents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_breakdowns),
      const DeepCollectionEquality().hash(_accidents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryResponseDtoImplCopyWith<_$HistoryResponseDtoImpl> get copyWith =>
      __$$HistoryResponseDtoImplCopyWithImpl<_$HistoryResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _HistoryResponseDto implements HistoryResponseDto {
  const factory _HistoryResponseDto(
      {final List<HistoryItemModelDto> breakdowns,
      final List<HistoryItemModelDto> accidents}) = _$HistoryResponseDtoImpl;

  factory _HistoryResponseDto.fromJson(Map<String, dynamic> json) =
      _$HistoryResponseDtoImpl.fromJson;

  @override
  List<HistoryItemModelDto> get breakdowns;
  @override
  List<HistoryItemModelDto> get accidents;
  @override
  @JsonKey(ignore: true)
  _$$HistoryResponseDtoImplCopyWith<_$HistoryResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
