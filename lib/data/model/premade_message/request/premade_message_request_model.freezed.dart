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

PreMadeMessageRequestModel _$PreMadeMessageRequestModelFromJson(
    Map<String, dynamic> json) {
  return _PreMadeMessageRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PreMadeMessageRequestModel {
  String? get title => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreMadeMessageRequestModelCopyWith<PreMadeMessageRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreMadeMessageRequestModelCopyWith<$Res> {
  factory $PreMadeMessageRequestModelCopyWith(PreMadeMessageRequestModel value,
          $Res Function(PreMadeMessageRequestModel) then) =
      _$PreMadeMessageRequestModelCopyWithImpl<$Res,
          PreMadeMessageRequestModel>;
  @useResult
  $Res call({String? title, String? message});
}

/// @nodoc
class _$PreMadeMessageRequestModelCopyWithImpl<$Res,
        $Val extends PreMadeMessageRequestModel>
    implements $PreMadeMessageRequestModelCopyWith<$Res> {
  _$PreMadeMessageRequestModelCopyWithImpl(this._value, this._then);

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
abstract class _$$PreMadeMessageRequestModelImplCopyWith<$Res>
    implements $PreMadeMessageRequestModelCopyWith<$Res> {
  factory _$$PreMadeMessageRequestModelImplCopyWith(
          _$PreMadeMessageRequestModelImpl value,
          $Res Function(_$PreMadeMessageRequestModelImpl) then) =
      __$$PreMadeMessageRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? message});
}

/// @nodoc
class __$$PreMadeMessageRequestModelImplCopyWithImpl<$Res>
    extends _$PreMadeMessageRequestModelCopyWithImpl<$Res,
        _$PreMadeMessageRequestModelImpl>
    implements _$$PreMadeMessageRequestModelImplCopyWith<$Res> {
  __$$PreMadeMessageRequestModelImplCopyWithImpl(
      _$PreMadeMessageRequestModelImpl _value,
      $Res Function(_$PreMadeMessageRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PreMadeMessageRequestModelImpl(
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
class _$PreMadeMessageRequestModelImpl implements _PreMadeMessageRequestModel {
  const _$PreMadeMessageRequestModelImpl(
      {required this.title, required this.message});

  factory _$PreMadeMessageRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PreMadeMessageRequestModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? message;

  @override
  String toString() {
    return 'PreMadeMessageRequestModel(title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreMadeMessageRequestModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreMadeMessageRequestModelImplCopyWith<_$PreMadeMessageRequestModelImpl>
      get copyWith => __$$PreMadeMessageRequestModelImplCopyWithImpl<
          _$PreMadeMessageRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreMadeMessageRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PreMadeMessageRequestModel
    implements PreMadeMessageRequestModel {
  const factory _PreMadeMessageRequestModel(
      {required final String? title,
      required final String? message}) = _$PreMadeMessageRequestModelImpl;

  factory _PreMadeMessageRequestModel.fromJson(Map<String, dynamic> json) =
      _$PreMadeMessageRequestModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PreMadeMessageRequestModelImplCopyWith<_$PreMadeMessageRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
