// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premade_message_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PremadeMessageRequestModel _$PremadeMessageRequestModelFromJson(
    Map<String, dynamic> json) {
  return _PremadeMessageRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PremadeMessageRequestModel {
  String? get title => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PremadeMessageRequestModelCopyWith<PremadeMessageRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremadeMessageRequestModelCopyWith<$Res> {
  factory $PremadeMessageRequestModelCopyWith(PremadeMessageRequestModel value,
          $Res Function(PremadeMessageRequestModel) then) =
      _$PremadeMessageRequestModelCopyWithImpl<$Res,
          PremadeMessageRequestModel>;
  @useResult
  $Res call({String? title, String? message});
}

/// @nodoc
class _$PremadeMessageRequestModelCopyWithImpl<$Res,
        $Val extends PremadeMessageRequestModel>
    implements $PremadeMessageRequestModelCopyWith<$Res> {
  _$PremadeMessageRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$PremadeMessageRequestModelImplCopyWith<$Res>
    implements $PremadeMessageRequestModelCopyWith<$Res> {
  factory _$$PremadeMessageRequestModelImplCopyWith(
          _$PremadeMessageRequestModelImpl value,
          $Res Function(_$PremadeMessageRequestModelImpl) then) =
      __$$PremadeMessageRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? message});
}

/// @nodoc
class __$$PremadeMessageRequestModelImplCopyWithImpl<$Res>
    extends _$PremadeMessageRequestModelCopyWithImpl<$Res,
        _$PremadeMessageRequestModelImpl>
    implements _$$PremadeMessageRequestModelImplCopyWith<$Res> {
  __$$PremadeMessageRequestModelImplCopyWithImpl(
      _$PremadeMessageRequestModelImpl _value,
      $Res Function(_$PremadeMessageRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PremadeMessageRequestModelImpl(
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
class _$PremadeMessageRequestModelImpl implements _PremadeMessageRequestModel {
  const _$PremadeMessageRequestModelImpl(
      {required this.title, required this.message});

  factory _$PremadeMessageRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PremadeMessageRequestModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? message;

  @override
  String toString() {
    return 'PremadeMessageRequestModel(title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremadeMessageRequestModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PremadeMessageRequestModelImplCopyWith<_$PremadeMessageRequestModelImpl>
      get copyWith => __$$PremadeMessageRequestModelImplCopyWithImpl<
          _$PremadeMessageRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PremadeMessageRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PremadeMessageRequestModel
    implements PremadeMessageRequestModel {
  const factory _PremadeMessageRequestModel(
      {required final String? title,
      required final String? message}) = _$PremadeMessageRequestModelImpl;

  factory _PremadeMessageRequestModel.fromJson(Map<String, dynamic> json) =
      _$PremadeMessageRequestModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PremadeMessageRequestModelImplCopyWith<_$PremadeMessageRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
