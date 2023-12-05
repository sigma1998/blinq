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

PreMadeMessageResponseModel _$PreMadeMessageResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PreMadeMessageResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PreMadeMessageResponseModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreMadeMessageResponseModelCopyWith<PreMadeMessageResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreMadeMessageResponseModelCopyWith<$Res> {
  factory $PreMadeMessageResponseModelCopyWith(
          PreMadeMessageResponseModel value,
          $Res Function(PreMadeMessageResponseModel) then) =
      _$PreMadeMessageResponseModelCopyWithImpl<$Res,
          PreMadeMessageResponseModel>;
  @useResult
  $Res call({int? id, String? title, String? message});
}

/// @nodoc
class _$PreMadeMessageResponseModelCopyWithImpl<$Res,
        $Val extends PreMadeMessageResponseModel>
    implements $PreMadeMessageResponseModelCopyWith<$Res> {
  _$PreMadeMessageResponseModelCopyWithImpl(this._value, this._then);

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
abstract class _$$PreMadeMessageResponseModelImplCopyWith<$Res>
    implements $PreMadeMessageResponseModelCopyWith<$Res> {
  factory _$$PreMadeMessageResponseModelImplCopyWith(
          _$PreMadeMessageResponseModelImpl value,
          $Res Function(_$PreMadeMessageResponseModelImpl) then) =
      __$$PreMadeMessageResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? title, String? message});
}

/// @nodoc
class __$$PreMadeMessageResponseModelImplCopyWithImpl<$Res>
    extends _$PreMadeMessageResponseModelCopyWithImpl<$Res,
        _$PreMadeMessageResponseModelImpl>
    implements _$$PreMadeMessageResponseModelImplCopyWith<$Res> {
  __$$PreMadeMessageResponseModelImplCopyWithImpl(
      _$PreMadeMessageResponseModelImpl _value,
      $Res Function(_$PreMadeMessageResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PreMadeMessageResponseModelImpl(
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
class _$PreMadeMessageResponseModelImpl
    implements _PreMadeMessageResponseModel {
  const _$PreMadeMessageResponseModelImpl({this.id, this.title, this.message});

  factory _$PreMadeMessageResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PreMadeMessageResponseModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? message;

  @override
  String toString() {
    return 'PreMadeMessageResponseModel(id: $id, title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreMadeMessageResponseModelImpl &&
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
  _$$PreMadeMessageResponseModelImplCopyWith<_$PreMadeMessageResponseModelImpl>
      get copyWith => __$$PreMadeMessageResponseModelImplCopyWithImpl<
          _$PreMadeMessageResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreMadeMessageResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PreMadeMessageResponseModel
    implements PreMadeMessageResponseModel {
  const factory _PreMadeMessageResponseModel(
      {final int? id,
      final String? title,
      final String? message}) = _$PreMadeMessageResponseModelImpl;

  factory _PreMadeMessageResponseModel.fromJson(Map<String, dynamic> json) =
      _$PreMadeMessageResponseModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PreMadeMessageResponseModelImplCopyWith<_$PreMadeMessageResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
