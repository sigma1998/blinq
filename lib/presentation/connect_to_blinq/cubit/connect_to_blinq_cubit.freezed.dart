// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connect_to_blinq_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectToBlinqState {
  DeviceConnectionState get boardConnectionState =>
      throw _privateConstructorUsedError;
  BleConnectionState get bleConnectionState =>
      throw _privateConstructorUsedError;
  List<DiscoveredDevice> get scannedBleDevices =>
      throw _privateConstructorUsedError;
  List<DiscoveredDevice> get savedBleDevices =>
      throw _privateConstructorUsedError;
  int get pairedState => throw _privateConstructorUsedError;
  bool get scanning => throw _privateConstructorUsedError;
  String get stateTexts => throw _privateConstructorUsedError;
  List<String> get receivedData => throw _privateConstructorUsedError;
  int get connectAttempt => throw _privateConstructorUsedError;
  DiscoveredDevice? get recentlyConnected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectToBlinqStateCopyWith<ConnectToBlinqState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectToBlinqStateCopyWith<$Res> {
  factory $ConnectToBlinqStateCopyWith(
          ConnectToBlinqState value, $Res Function(ConnectToBlinqState) then) =
      _$ConnectToBlinqStateCopyWithImpl<$Res, ConnectToBlinqState>;
  @useResult
  $Res call(
      {DeviceConnectionState boardConnectionState,
      BleConnectionState bleConnectionState,
      List<DiscoveredDevice> scannedBleDevices,
      List<DiscoveredDevice> savedBleDevices,
      int pairedState,
      bool scanning,
      String stateTexts,
      List<String> receivedData,
      int connectAttempt,
      DiscoveredDevice? recentlyConnected});
}

/// @nodoc
class _$ConnectToBlinqStateCopyWithImpl<$Res, $Val extends ConnectToBlinqState>
    implements $ConnectToBlinqStateCopyWith<$Res> {
  _$ConnectToBlinqStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardConnectionState = null,
    Object? bleConnectionState = null,
    Object? scannedBleDevices = null,
    Object? savedBleDevices = null,
    Object? pairedState = null,
    Object? scanning = null,
    Object? stateTexts = null,
    Object? receivedData = null,
    Object? connectAttempt = null,
    Object? recentlyConnected = freezed,
  }) {
    return _then(_value.copyWith(
      boardConnectionState: null == boardConnectionState
          ? _value.boardConnectionState
          : boardConnectionState // ignore: cast_nullable_to_non_nullable
              as DeviceConnectionState,
      bleConnectionState: null == bleConnectionState
          ? _value.bleConnectionState
          : bleConnectionState // ignore: cast_nullable_to_non_nullable
              as BleConnectionState,
      scannedBleDevices: null == scannedBleDevices
          ? _value.scannedBleDevices
          : scannedBleDevices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
      savedBleDevices: null == savedBleDevices
          ? _value.savedBleDevices
          : savedBleDevices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
      pairedState: null == pairedState
          ? _value.pairedState
          : pairedState // ignore: cast_nullable_to_non_nullable
              as int,
      scanning: null == scanning
          ? _value.scanning
          : scanning // ignore: cast_nullable_to_non_nullable
              as bool,
      stateTexts: null == stateTexts
          ? _value.stateTexts
          : stateTexts // ignore: cast_nullable_to_non_nullable
              as String,
      receivedData: null == receivedData
          ? _value.receivedData
          : receivedData // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectAttempt: null == connectAttempt
          ? _value.connectAttempt
          : connectAttempt // ignore: cast_nullable_to_non_nullable
              as int,
      recentlyConnected: freezed == recentlyConnected
          ? _value.recentlyConnected
          : recentlyConnected // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectToBlinqStateImplCopyWith<$Res>
    implements $ConnectToBlinqStateCopyWith<$Res> {
  factory _$$ConnectToBlinqStateImplCopyWith(_$ConnectToBlinqStateImpl value,
          $Res Function(_$ConnectToBlinqStateImpl) then) =
      __$$ConnectToBlinqStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeviceConnectionState boardConnectionState,
      BleConnectionState bleConnectionState,
      List<DiscoveredDevice> scannedBleDevices,
      List<DiscoveredDevice> savedBleDevices,
      int pairedState,
      bool scanning,
      String stateTexts,
      List<String> receivedData,
      int connectAttempt,
      DiscoveredDevice? recentlyConnected});
}

/// @nodoc
class __$$ConnectToBlinqStateImplCopyWithImpl<$Res>
    extends _$ConnectToBlinqStateCopyWithImpl<$Res, _$ConnectToBlinqStateImpl>
    implements _$$ConnectToBlinqStateImplCopyWith<$Res> {
  __$$ConnectToBlinqStateImplCopyWithImpl(_$ConnectToBlinqStateImpl _value,
      $Res Function(_$ConnectToBlinqStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardConnectionState = null,
    Object? bleConnectionState = null,
    Object? scannedBleDevices = null,
    Object? savedBleDevices = null,
    Object? pairedState = null,
    Object? scanning = null,
    Object? stateTexts = null,
    Object? receivedData = null,
    Object? connectAttempt = null,
    Object? recentlyConnected = freezed,
  }) {
    return _then(_$ConnectToBlinqStateImpl(
      boardConnectionState: null == boardConnectionState
          ? _value.boardConnectionState
          : boardConnectionState // ignore: cast_nullable_to_non_nullable
              as DeviceConnectionState,
      bleConnectionState: null == bleConnectionState
          ? _value.bleConnectionState
          : bleConnectionState // ignore: cast_nullable_to_non_nullable
              as BleConnectionState,
      scannedBleDevices: null == scannedBleDevices
          ? _value._scannedBleDevices
          : scannedBleDevices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
      savedBleDevices: null == savedBleDevices
          ? _value._savedBleDevices
          : savedBleDevices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
      pairedState: null == pairedState
          ? _value.pairedState
          : pairedState // ignore: cast_nullable_to_non_nullable
              as int,
      scanning: null == scanning
          ? _value.scanning
          : scanning // ignore: cast_nullable_to_non_nullable
              as bool,
      stateTexts: null == stateTexts
          ? _value.stateTexts
          : stateTexts // ignore: cast_nullable_to_non_nullable
              as String,
      receivedData: null == receivedData
          ? _value._receivedData
          : receivedData // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectAttempt: null == connectAttempt
          ? _value.connectAttempt
          : connectAttempt // ignore: cast_nullable_to_non_nullable
              as int,
      recentlyConnected: freezed == recentlyConnected
          ? _value.recentlyConnected
          : recentlyConnected // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice?,
    ));
  }
}

/// @nodoc

class _$ConnectToBlinqStateImpl implements _ConnectToBlinqState {
  _$ConnectToBlinqStateImpl(
      {this.boardConnectionState = DeviceConnectionState.disconnected,
      this.bleConnectionState = BleConnectionState.disconnected,
      final List<DiscoveredDevice> scannedBleDevices = const [],
      final List<DiscoveredDevice> savedBleDevices = const [],
      this.pairedState = kNa,
      this.scanning = false,
      this.stateTexts = 'N/A',
      final List<String> receivedData = const [],
      this.connectAttempt = 0,
      this.recentlyConnected})
      : _scannedBleDevices = scannedBleDevices,
        _savedBleDevices = savedBleDevices,
        _receivedData = receivedData;

  @override
  @JsonKey()
  final DeviceConnectionState boardConnectionState;
  @override
  @JsonKey()
  final BleConnectionState bleConnectionState;
  final List<DiscoveredDevice> _scannedBleDevices;
  @override
  @JsonKey()
  List<DiscoveredDevice> get scannedBleDevices {
    if (_scannedBleDevices is EqualUnmodifiableListView)
      return _scannedBleDevices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scannedBleDevices);
  }

  final List<DiscoveredDevice> _savedBleDevices;
  @override
  @JsonKey()
  List<DiscoveredDevice> get savedBleDevices {
    if (_savedBleDevices is EqualUnmodifiableListView) return _savedBleDevices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedBleDevices);
  }

  @override
  @JsonKey()
  final int pairedState;
  @override
  @JsonKey()
  final bool scanning;
  @override
  @JsonKey()
  final String stateTexts;
  final List<String> _receivedData;
  @override
  @JsonKey()
  List<String> get receivedData {
    if (_receivedData is EqualUnmodifiableListView) return _receivedData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receivedData);
  }

  @override
  @JsonKey()
  final int connectAttempt;
  @override
  final DiscoveredDevice? recentlyConnected;

  @override
  String toString() {
    return 'ConnectToBlinqState(boardConnectionState: $boardConnectionState, bleConnectionState: $bleConnectionState, scannedBleDevices: $scannedBleDevices, savedBleDevices: $savedBleDevices, pairedState: $pairedState, scanning: $scanning, stateTexts: $stateTexts, receivedData: $receivedData, connectAttempt: $connectAttempt, recentlyConnected: $recentlyConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectToBlinqStateImpl &&
            (identical(other.boardConnectionState, boardConnectionState) ||
                other.boardConnectionState == boardConnectionState) &&
            (identical(other.bleConnectionState, bleConnectionState) ||
                other.bleConnectionState == bleConnectionState) &&
            const DeepCollectionEquality()
                .equals(other._scannedBleDevices, _scannedBleDevices) &&
            const DeepCollectionEquality()
                .equals(other._savedBleDevices, _savedBleDevices) &&
            (identical(other.pairedState, pairedState) ||
                other.pairedState == pairedState) &&
            (identical(other.scanning, scanning) ||
                other.scanning == scanning) &&
            (identical(other.stateTexts, stateTexts) ||
                other.stateTexts == stateTexts) &&
            const DeepCollectionEquality()
                .equals(other._receivedData, _receivedData) &&
            (identical(other.connectAttempt, connectAttempt) ||
                other.connectAttempt == connectAttempt) &&
            (identical(other.recentlyConnected, recentlyConnected) ||
                other.recentlyConnected == recentlyConnected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      boardConnectionState,
      bleConnectionState,
      const DeepCollectionEquality().hash(_scannedBleDevices),
      const DeepCollectionEquality().hash(_savedBleDevices),
      pairedState,
      scanning,
      stateTexts,
      const DeepCollectionEquality().hash(_receivedData),
      connectAttempt,
      recentlyConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectToBlinqStateImplCopyWith<_$ConnectToBlinqStateImpl> get copyWith =>
      __$$ConnectToBlinqStateImplCopyWithImpl<_$ConnectToBlinqStateImpl>(
          this, _$identity);
}

abstract class _ConnectToBlinqState implements ConnectToBlinqState {
  factory _ConnectToBlinqState(
      {final DeviceConnectionState boardConnectionState,
      final BleConnectionState bleConnectionState,
      final List<DiscoveredDevice> scannedBleDevices,
      final List<DiscoveredDevice> savedBleDevices,
      final int pairedState,
      final bool scanning,
      final String stateTexts,
      final List<String> receivedData,
      final int connectAttempt,
      final DiscoveredDevice? recentlyConnected}) = _$ConnectToBlinqStateImpl;

  @override
  DeviceConnectionState get boardConnectionState;
  @override
  BleConnectionState get bleConnectionState;
  @override
  List<DiscoveredDevice> get scannedBleDevices;
  @override
  List<DiscoveredDevice> get savedBleDevices;
  @override
  int get pairedState;
  @override
  bool get scanning;
  @override
  String get stateTexts;
  @override
  List<String> get receivedData;
  @override
  int get connectAttempt;
  @override
  DiscoveredDevice? get recentlyConnected;
  @override
  @JsonKey(ignore: true)
  _$$ConnectToBlinqStateImplCopyWith<_$ConnectToBlinqStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
