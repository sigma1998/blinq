// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logger_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoggerState {
  List<String> get logTexts => throw _privateConstructorUsedError;
  int get numberOfMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoggerStateCopyWith<LoggerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggerStateCopyWith<$Res> {
  factory $LoggerStateCopyWith(
          LoggerState value, $Res Function(LoggerState) then) =
      _$LoggerStateCopyWithImpl<$Res, LoggerState>;
  @useResult
  $Res call({List<String> logTexts, int numberOfMessages});
}

/// @nodoc
class _$LoggerStateCopyWithImpl<$Res, $Val extends LoggerState>
    implements $LoggerStateCopyWith<$Res> {
  _$LoggerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logTexts = null,
    Object? numberOfMessages = null,
  }) {
    return _then(_value.copyWith(
      logTexts: null == logTexts
          ? _value.logTexts
          : logTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfMessages: null == numberOfMessages
          ? _value.numberOfMessages
          : numberOfMessages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoggerStateImplCopyWith<$Res>
    implements $LoggerStateCopyWith<$Res> {
  factory _$$LoggerStateImplCopyWith(
          _$LoggerStateImpl value, $Res Function(_$LoggerStateImpl) then) =
      __$$LoggerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> logTexts, int numberOfMessages});
}

/// @nodoc
class __$$LoggerStateImplCopyWithImpl<$Res>
    extends _$LoggerStateCopyWithImpl<$Res, _$LoggerStateImpl>
    implements _$$LoggerStateImplCopyWith<$Res> {
  __$$LoggerStateImplCopyWithImpl(
      _$LoggerStateImpl _value, $Res Function(_$LoggerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logTexts = null,
    Object? numberOfMessages = null,
  }) {
    return _then(_$LoggerStateImpl(
      logTexts: null == logTexts
          ? _value._logTexts
          : logTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfMessages: null == numberOfMessages
          ? _value.numberOfMessages
          : numberOfMessages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoggerStateImpl implements _LoggerState {
  _$LoggerStateImpl(
      {final List<String> logTexts = const [], this.numberOfMessages = 0})
      : _logTexts = logTexts;

  final List<String> _logTexts;
  @override
  @JsonKey()
  List<String> get logTexts {
    if (_logTexts is EqualUnmodifiableListView) return _logTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logTexts);
  }

  @override
  @JsonKey()
  final int numberOfMessages;

  @override
  String toString() {
    return 'LoggerState(logTexts: $logTexts, numberOfMessages: $numberOfMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggerStateImpl &&
            const DeepCollectionEquality().equals(other._logTexts, _logTexts) &&
            (identical(other.numberOfMessages, numberOfMessages) ||
                other.numberOfMessages == numberOfMessages));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_logTexts), numberOfMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggerStateImplCopyWith<_$LoggerStateImpl> get copyWith =>
      __$$LoggerStateImplCopyWithImpl<_$LoggerStateImpl>(this, _$identity);
}

abstract class _LoggerState implements LoggerState {
  factory _LoggerState(
      {final List<String> logTexts,
      final int numberOfMessages}) = _$LoggerStateImpl;

  @override
  List<String> get logTexts;
  @override
  int get numberOfMessages;
  @override
  @JsonKey(ignore: true)
  _$$LoggerStateImplCopyWith<_$LoggerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
