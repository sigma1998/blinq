// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapState {
  Status get status => throw _privateConstructorUsedError;
  PlaceModel? get selectedPlace => throw _privateConstructorUsedError;
  bool get mapHidden => throw _privateConstructorUsedError;
  bool get mapRendered => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call(
      {Status status,
      PlaceModel? selectedPlace,
      bool mapHidden,
      bool mapRendered});
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedPlace = freezed,
    Object? mapHidden = null,
    Object? mapRendered = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedPlace: freezed == selectedPlace
          ? _value.selectedPlace
          : selectedPlace // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      mapHidden: null == mapHidden
          ? _value.mapHidden
          : mapHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      mapRendered: null == mapRendered
          ? _value.mapRendered
          : mapRendered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapStateImplCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$$MapStateImplCopyWith(
          _$MapStateImpl value, $Res Function(_$MapStateImpl) then) =
      __$$MapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      PlaceModel? selectedPlace,
      bool mapHidden,
      bool mapRendered});
}

/// @nodoc
class __$$MapStateImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateImpl>
    implements _$$MapStateImplCopyWith<$Res> {
  __$$MapStateImplCopyWithImpl(
      _$MapStateImpl _value, $Res Function(_$MapStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedPlace = freezed,
    Object? mapHidden = null,
    Object? mapRendered = null,
  }) {
    return _then(_$MapStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedPlace: freezed == selectedPlace
          ? _value.selectedPlace
          : selectedPlace // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      mapHidden: null == mapHidden
          ? _value.mapHidden
          : mapHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      mapRendered: null == mapRendered
          ? _value.mapRendered
          : mapRendered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MapStateImpl implements _MapState {
  const _$MapStateImpl(
      {this.status = Status.initial,
      this.selectedPlace,
      this.mapHidden = false,
      this.mapRendered = false});

  @override
  @JsonKey()
  final Status status;
  @override
  final PlaceModel? selectedPlace;
  @override
  @JsonKey()
  final bool mapHidden;
  @override
  @JsonKey()
  final bool mapRendered;

  @override
  String toString() {
    return 'MapState(status: $status, selectedPlace: $selectedPlace, mapHidden: $mapHidden, mapRendered: $mapRendered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selectedPlace, selectedPlace) ||
                other.selectedPlace == selectedPlace) &&
            (identical(other.mapHidden, mapHidden) ||
                other.mapHidden == mapHidden) &&
            (identical(other.mapRendered, mapRendered) ||
                other.mapRendered == mapRendered));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, selectedPlace, mapHidden, mapRendered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      __$$MapStateImplCopyWithImpl<_$MapStateImpl>(this, _$identity);
}

abstract class _MapState implements MapState {
  const factory _MapState(
      {final Status status,
      final PlaceModel? selectedPlace,
      final bool mapHidden,
      final bool mapRendered}) = _$MapStateImpl;

  @override
  Status get status;
  @override
  PlaceModel? get selectedPlace;
  @override
  bool get mapHidden;
  @override
  bool get mapRendered;
  @override
  @JsonKey(ignore: true)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
