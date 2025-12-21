// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premade_message_selector_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PremadeMessageSelectorState {
  Status get status => throw _privateConstructorUsedError;
  List<PreMadeMessageResponseModel> get premadeMessages =>
      throw _privateConstructorUsedError;
  PreMadeMessageResponseModel? get selectedMessage =>
      throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of PremadeMessageSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PremadeMessageSelectorStateCopyWith<PremadeMessageSelectorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremadeMessageSelectorStateCopyWith<$Res> {
  factory $PremadeMessageSelectorStateCopyWith(
          PremadeMessageSelectorState value,
          $Res Function(PremadeMessageSelectorState) then) =
      _$PremadeMessageSelectorStateCopyWithImpl<$Res,
          PremadeMessageSelectorState>;
  @useResult
  $Res call(
      {Status status,
      List<PreMadeMessageResponseModel> premadeMessages,
      PreMadeMessageResponseModel? selectedMessage,
      Error? error});

  $PreMadeMessageResponseModelCopyWith<$Res>? get selectedMessage;
}

/// @nodoc
class _$PremadeMessageSelectorStateCopyWithImpl<$Res,
        $Val extends PremadeMessageSelectorState>
    implements $PremadeMessageSelectorStateCopyWith<$Res> {
  _$PremadeMessageSelectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PremadeMessageSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? premadeMessages = null,
    Object? selectedMessage = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      premadeMessages: null == premadeMessages
          ? _value.premadeMessages
          : premadeMessages // ignore: cast_nullable_to_non_nullable
              as List<PreMadeMessageResponseModel>,
      selectedMessage: freezed == selectedMessage
          ? _value.selectedMessage
          : selectedMessage // ignore: cast_nullable_to_non_nullable
              as PreMadeMessageResponseModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ) as $Val);
  }

  /// Create a copy of PremadeMessageSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreMadeMessageResponseModelCopyWith<$Res>? get selectedMessage {
    if (_value.selectedMessage == null) {
      return null;
    }

    return $PreMadeMessageResponseModelCopyWith<$Res>(_value.selectedMessage!,
        (value) {
      return _then(_value.copyWith(selectedMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PremadeMessageSelectorStateImplCopyWith<$Res>
    implements $PremadeMessageSelectorStateCopyWith<$Res> {
  factory _$$PremadeMessageSelectorStateImplCopyWith(
          _$PremadeMessageSelectorStateImpl value,
          $Res Function(_$PremadeMessageSelectorStateImpl) then) =
      __$$PremadeMessageSelectorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      List<PreMadeMessageResponseModel> premadeMessages,
      PreMadeMessageResponseModel? selectedMessage,
      Error? error});

  @override
  $PreMadeMessageResponseModelCopyWith<$Res>? get selectedMessage;
}

/// @nodoc
class __$$PremadeMessageSelectorStateImplCopyWithImpl<$Res>
    extends _$PremadeMessageSelectorStateCopyWithImpl<$Res,
        _$PremadeMessageSelectorStateImpl>
    implements _$$PremadeMessageSelectorStateImplCopyWith<$Res> {
  __$$PremadeMessageSelectorStateImplCopyWithImpl(
      _$PremadeMessageSelectorStateImpl _value,
      $Res Function(_$PremadeMessageSelectorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PremadeMessageSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? premadeMessages = null,
    Object? selectedMessage = freezed,
    Object? error = freezed,
  }) {
    return _then(_$PremadeMessageSelectorStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      premadeMessages: null == premadeMessages
          ? _value._premadeMessages
          : premadeMessages // ignore: cast_nullable_to_non_nullable
              as List<PreMadeMessageResponseModel>,
      selectedMessage: freezed == selectedMessage
          ? _value.selectedMessage
          : selectedMessage // ignore: cast_nullable_to_non_nullable
              as PreMadeMessageResponseModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$PremadeMessageSelectorStateImpl
    implements _PremadeMessageSelectorState {
  const _$PremadeMessageSelectorStateImpl(
      {this.status = Status.initial,
      final List<PreMadeMessageResponseModel> premadeMessages = const [],
      this.selectedMessage,
      this.error})
      : _premadeMessages = premadeMessages;

  @override
  @JsonKey()
  final Status status;
  final List<PreMadeMessageResponseModel> _premadeMessages;
  @override
  @JsonKey()
  List<PreMadeMessageResponseModel> get premadeMessages {
    if (_premadeMessages is EqualUnmodifiableListView) return _premadeMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_premadeMessages);
  }

  @override
  final PreMadeMessageResponseModel? selectedMessage;
  @override
  final Error? error;

  @override
  String toString() {
    return 'PremadeMessageSelectorState(status: $status, premadeMessages: $premadeMessages, selectedMessage: $selectedMessage, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremadeMessageSelectorStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._premadeMessages, _premadeMessages) &&
            (identical(other.selectedMessage, selectedMessage) ||
                other.selectedMessage == selectedMessage) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_premadeMessages),
      selectedMessage,
      error);

  /// Create a copy of PremadeMessageSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PremadeMessageSelectorStateImplCopyWith<_$PremadeMessageSelectorStateImpl>
      get copyWith => __$$PremadeMessageSelectorStateImplCopyWithImpl<
          _$PremadeMessageSelectorStateImpl>(this, _$identity);
}

abstract class _PremadeMessageSelectorState
    implements PremadeMessageSelectorState {
  const factory _PremadeMessageSelectorState(
      {final Status status,
      final List<PreMadeMessageResponseModel> premadeMessages,
      final PreMadeMessageResponseModel? selectedMessage,
      final Error? error}) = _$PremadeMessageSelectorStateImpl;

  @override
  Status get status;
  @override
  List<PreMadeMessageResponseModel> get premadeMessages;
  @override
  PreMadeMessageResponseModel? get selectedMessage;
  @override
  Error? get error;

  /// Create a copy of PremadeMessageSelectorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PremadeMessageSelectorStateImplCopyWith<_$PremadeMessageSelectorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
