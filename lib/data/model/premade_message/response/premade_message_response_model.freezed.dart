// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premade_message_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PremadeMessageResponseModel _$PremadeMessageResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PremadeMessageResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PremadeMessageResponseModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PremadeMessageResponseModelCopyWith<PremadeMessageResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremadeMessageResponseModelCopyWith<$Res> {
  factory $PremadeMessageResponseModelCopyWith(
          PremadeMessageResponseModel value,
          $Res Function(PremadeMessageResponseModel) then) =
      _$PremadeMessageResponseModelCopyWithImpl<$Res,
          PremadeMessageResponseModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(2) String? title,
      @HiveField(3) String? message});
}

/// @nodoc
class _$PremadeMessageResponseModelCopyWithImpl<$Res,
        $Val extends PremadeMessageResponseModel>
    implements $PremadeMessageResponseModelCopyWith<$Res> {
  _$PremadeMessageResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PremadeMessageResponseModelImplCopyWith<$Res>
    implements $PremadeMessageResponseModelCopyWith<$Res> {
  factory _$$PremadeMessageResponseModelImplCopyWith(
          _$PremadeMessageResponseModelImpl value,
          $Res Function(_$PremadeMessageResponseModelImpl) then) =
      __$$PremadeMessageResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(2) String? title,
      @HiveField(3) String? message});
}

/// @nodoc
class __$$PremadeMessageResponseModelImplCopyWithImpl<$Res>
    extends _$PremadeMessageResponseModelCopyWithImpl<$Res,
        _$PremadeMessageResponseModelImpl>
    implements _$$PremadeMessageResponseModelImplCopyWith<$Res> {
  __$$PremadeMessageResponseModelImplCopyWithImpl(
      _$PremadeMessageResponseModelImpl _value,
      $Res Function(_$PremadeMessageResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PremadeMessageResponseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PremadeMessageResponseModelImpl
    implements _PremadeMessageResponseModel {
  const _$PremadeMessageResponseModelImpl(
      {@HiveField(0) this.id,
      @HiveField(2) this.title,
      @HiveField(3) this.message});

  factory _$PremadeMessageResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PremadeMessageResponseModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(2)
  final String? title;
  @override
  @HiveField(3)
  final String? message;

  @override
  String toString() {
    return 'PremadeMessageResponseModel(id: $id, title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremadeMessageResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PremadeMessageResponseModelImplCopyWith<_$PremadeMessageResponseModelImpl>
      get copyWith => __$$PremadeMessageResponseModelImplCopyWithImpl<
          _$PremadeMessageResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PremadeMessageResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PremadeMessageResponseModel
    implements PremadeMessageResponseModel {
  const factory _PremadeMessageResponseModel(
      {@HiveField(0) final int? id,
      @HiveField(2) final String? title,
      @HiveField(3) final String? message}) = _$PremadeMessageResponseModelImpl;

  factory _PremadeMessageResponseModel.fromJson(Map<String, dynamic> json) =
      _$PremadeMessageResponseModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(2)
  String? get title;
  @override
  @HiveField(3)
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PremadeMessageResponseModelImplCopyWith<_$PremadeMessageResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
