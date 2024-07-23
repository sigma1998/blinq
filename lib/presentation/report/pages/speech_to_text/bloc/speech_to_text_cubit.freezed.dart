// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speech_to_text_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpeechToTextState {
  Status get status => throw _privateConstructorUsedError;
  bool get isRecording => throw _privateConstructorUsedError;
  double? get soundLevel => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpeechToTextStateCopyWith<SpeechToTextState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeechToTextStateCopyWith<$Res> {
  factory $SpeechToTextStateCopyWith(
          SpeechToTextState value, $Res Function(SpeechToTextState) then) =
      _$SpeechToTextStateCopyWithImpl<$Res, SpeechToTextState>;
  @useResult
  $Res call(
      {Status status, bool isRecording, double? soundLevel, Error? error});
}

/// @nodoc
class _$SpeechToTextStateCopyWithImpl<$Res, $Val extends SpeechToTextState>
    implements $SpeechToTextStateCopyWith<$Res> {
  _$SpeechToTextStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isRecording = null,
    Object? soundLevel = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      soundLevel: freezed == soundLevel
          ? _value.soundLevel
          : soundLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpeechToTextStateImplCopyWith<$Res>
    implements $SpeechToTextStateCopyWith<$Res> {
  factory _$$SpeechToTextStateImplCopyWith(_$SpeechToTextStateImpl value,
          $Res Function(_$SpeechToTextStateImpl) then) =
      __$$SpeechToTextStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status, bool isRecording, double? soundLevel, Error? error});
}

/// @nodoc
class __$$SpeechToTextStateImplCopyWithImpl<$Res>
    extends _$SpeechToTextStateCopyWithImpl<$Res, _$SpeechToTextStateImpl>
    implements _$$SpeechToTextStateImplCopyWith<$Res> {
  __$$SpeechToTextStateImplCopyWithImpl(_$SpeechToTextStateImpl _value,
      $Res Function(_$SpeechToTextStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isRecording = null,
    Object? soundLevel = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SpeechToTextStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      soundLevel: freezed == soundLevel
          ? _value.soundLevel
          : soundLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$SpeechToTextStateImpl implements _SpeechToTextState {
  const _$SpeechToTextStateImpl(
      {this.status = Status.initial,
      this.isRecording = false,
      this.soundLevel,
      this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final bool isRecording;
  @override
  final double? soundLevel;
  @override
  final Error? error;

  @override
  String toString() {
    return 'SpeechToTextState(status: $status, isRecording: $isRecording, soundLevel: $soundLevel, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechToTextStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.soundLevel, soundLevel) ||
                other.soundLevel == soundLevel) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, isRecording, soundLevel, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeechToTextStateImplCopyWith<_$SpeechToTextStateImpl> get copyWith =>
      __$$SpeechToTextStateImplCopyWithImpl<_$SpeechToTextStateImpl>(
          this, _$identity);
}

abstract class _SpeechToTextState implements SpeechToTextState {
  const factory _SpeechToTextState(
      {final Status status,
      final bool isRecording,
      final double? soundLevel,
      final Error? error}) = _$SpeechToTextStateImpl;

  @override
  Status get status;
  @override
  bool get isRecording;
  @override
  double? get soundLevel;
  @override
  Error? get error;
  @override
  @JsonKey(ignore: true)
  _$$SpeechToTextStateImplCopyWith<_$SpeechToTextStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
