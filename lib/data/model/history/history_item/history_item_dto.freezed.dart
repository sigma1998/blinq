// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryItemModelDto _$HistoryItemModelDtoFromJson(Map<String, dynamic> json) {
  return _HistoryItemModelDto.fromJson(json);
}

/// @nodoc
mixin _$HistoryItemModelDto {
  int? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'accident_document_pdf')
  String? get accidentDocumentPdf => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryItemModelDtoCopyWith<HistoryItemModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryItemModelDtoCopyWith<$Res> {
  factory $HistoryItemModelDtoCopyWith(
          HistoryItemModelDto value, $Res Function(HistoryItemModelDto) then) =
      _$HistoryItemModelDtoCopyWithImpl<$Res, HistoryItemModelDto>;
  @useResult
  $Res call(
      {int? id,
      String? type,
      String? status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'accident_document_pdf') String? accidentDocumentPdf});
}

/// @nodoc
class _$HistoryItemModelDtoCopyWithImpl<$Res, $Val extends HistoryItemModelDto>
    implements $HistoryItemModelDtoCopyWith<$Res> {
  _$HistoryItemModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? accidentDocumentPdf = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      accidentDocumentPdf: freezed == accidentDocumentPdf
          ? _value.accidentDocumentPdf
          : accidentDocumentPdf // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryItemModelDtoImplCopyWith<$Res>
    implements $HistoryItemModelDtoCopyWith<$Res> {
  factory _$$HistoryItemModelDtoImplCopyWith(_$HistoryItemModelDtoImpl value,
          $Res Function(_$HistoryItemModelDtoImpl) then) =
      __$$HistoryItemModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? type,
      String? status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'accident_document_pdf') String? accidentDocumentPdf});
}

/// @nodoc
class __$$HistoryItemModelDtoImplCopyWithImpl<$Res>
    extends _$HistoryItemModelDtoCopyWithImpl<$Res, _$HistoryItemModelDtoImpl>
    implements _$$HistoryItemModelDtoImplCopyWith<$Res> {
  __$$HistoryItemModelDtoImplCopyWithImpl(_$HistoryItemModelDtoImpl _value,
      $Res Function(_$HistoryItemModelDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? accidentDocumentPdf = freezed,
  }) {
    return _then(_$HistoryItemModelDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      accidentDocumentPdf: freezed == accidentDocumentPdf
          ? _value.accidentDocumentPdf
          : accidentDocumentPdf // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryItemModelDtoImpl implements _HistoryItemModelDto {
  const _$HistoryItemModelDtoImpl(
      {this.id,
      this.type,
      this.status,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'accident_document_pdf') this.accidentDocumentPdf});

  factory _$HistoryItemModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryItemModelDtoImplFromJson(json);

  @override
  final int? id;
  @override
  final String? type;
  @override
  final String? status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'accident_document_pdf')
  final String? accidentDocumentPdf;

  @override
  String toString() {
    return 'HistoryItemModelDto(id: $id, type: $type, status: $status, createdAt: $createdAt, accidentDocumentPdf: $accidentDocumentPdf)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryItemModelDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.accidentDocumentPdf, accidentDocumentPdf) ||
                other.accidentDocumentPdf == accidentDocumentPdf));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, status, createdAt, accidentDocumentPdf);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryItemModelDtoImplCopyWith<_$HistoryItemModelDtoImpl> get copyWith =>
      __$$HistoryItemModelDtoImplCopyWithImpl<_$HistoryItemModelDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryItemModelDtoImplToJson(
      this,
    );
  }
}

abstract class _HistoryItemModelDto implements HistoryItemModelDto {
  const factory _HistoryItemModelDto(
      {final int? id,
      final String? type,
      final String? status,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'accident_document_pdf')
      final String? accidentDocumentPdf}) = _$HistoryItemModelDtoImpl;

  factory _HistoryItemModelDto.fromJson(Map<String, dynamic> json) =
      _$HistoryItemModelDtoImpl.fromJson;

  @override
  int? get id;
  @override
  String? get type;
  @override
  String? get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'accident_document_pdf')
  String? get accidentDocumentPdf;
  @override
  @JsonKey(ignore: true)
  _$$HistoryItemModelDtoImplCopyWith<_$HistoryItemModelDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
