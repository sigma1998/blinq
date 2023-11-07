// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserVehicleRequestModel _$UserVehicleRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UserVehicleRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UserVehicleRequestModel {
  @JsonKey(name: 'traveled_km')
  String? get traveledKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_technical')
  String? get nextTechnical => throw _privateConstructorUsedError;
  @JsonKey(name: 'oil_replacement')
  String? get oilReplacement => throw _privateConstructorUsedError;
  @JsonKey(name: 'battery_replacement_date')
  String? get batteryReplacementDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserVehicleRequestModelCopyWith<UserVehicleRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserVehicleRequestModelCopyWith<$Res> {
  factory $UserVehicleRequestModelCopyWith(UserVehicleRequestModel value,
          $Res Function(UserVehicleRequestModel) then) =
      _$UserVehicleRequestModelCopyWithImpl<$Res, UserVehicleRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'traveled_km') String? traveledKm,
      @JsonKey(name: 'next_technical') String? nextTechnical,
      @JsonKey(name: 'oil_replacement') String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date')
      String? batteryReplacementDate});
}

/// @nodoc
class _$UserVehicleRequestModelCopyWithImpl<$Res,
        $Val extends UserVehicleRequestModel>
    implements $UserVehicleRequestModelCopyWith<$Res> {
  _$UserVehicleRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? oilReplacement = freezed,
    Object? batteryReplacementDate = freezed,
  }) {
    return _then(_value.copyWith(
      traveledKm: freezed == traveledKm
          ? _value.traveledKm
          : traveledKm // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTechnical: freezed == nextTechnical
          ? _value.nextTechnical
          : nextTechnical // ignore: cast_nullable_to_non_nullable
              as String?,
      oilReplacement: freezed == oilReplacement
          ? _value.oilReplacement
          : oilReplacement // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryReplacementDate: freezed == batteryReplacementDate
          ? _value.batteryReplacementDate
          : batteryReplacementDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserVehicleRequestModelImplCopyWith<$Res>
    implements $UserVehicleRequestModelCopyWith<$Res> {
  factory _$$UserVehicleRequestModelImplCopyWith(
          _$UserVehicleRequestModelImpl value,
          $Res Function(_$UserVehicleRequestModelImpl) then) =
      __$$UserVehicleRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'traveled_km') String? traveledKm,
      @JsonKey(name: 'next_technical') String? nextTechnical,
      @JsonKey(name: 'oil_replacement') String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date')
      String? batteryReplacementDate});
}

/// @nodoc
class __$$UserVehicleRequestModelImplCopyWithImpl<$Res>
    extends _$UserVehicleRequestModelCopyWithImpl<$Res,
        _$UserVehicleRequestModelImpl>
    implements _$$UserVehicleRequestModelImplCopyWith<$Res> {
  __$$UserVehicleRequestModelImplCopyWithImpl(
      _$UserVehicleRequestModelImpl _value,
      $Res Function(_$UserVehicleRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? oilReplacement = freezed,
    Object? batteryReplacementDate = freezed,
  }) {
    return _then(_$UserVehicleRequestModelImpl(
      traveledKm: freezed == traveledKm
          ? _value.traveledKm
          : traveledKm // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTechnical: freezed == nextTechnical
          ? _value.nextTechnical
          : nextTechnical // ignore: cast_nullable_to_non_nullable
              as String?,
      oilReplacement: freezed == oilReplacement
          ? _value.oilReplacement
          : oilReplacement // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryReplacementDate: freezed == batteryReplacementDate
          ? _value.batteryReplacementDate
          : batteryReplacementDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserVehicleRequestModelImpl implements _UserVehicleRequestModel {
  const _$UserVehicleRequestModelImpl(
      {@JsonKey(name: 'traveled_km') this.traveledKm,
      @JsonKey(name: 'next_technical') this.nextTechnical,
      @JsonKey(name: 'oil_replacement') this.oilReplacement,
      @JsonKey(name: 'battery_replacement_date') this.batteryReplacementDate});

  factory _$UserVehicleRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserVehicleRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'traveled_km')
  final String? traveledKm;
  @override
  @JsonKey(name: 'next_technical')
  final String? nextTechnical;
  @override
  @JsonKey(name: 'oil_replacement')
  final String? oilReplacement;
  @override
  @JsonKey(name: 'battery_replacement_date')
  final String? batteryReplacementDate;

  @override
  String toString() {
    return 'UserVehicleRequestModel(traveledKm: $traveledKm, nextTechnical: $nextTechnical, oilReplacement: $oilReplacement, batteryReplacementDate: $batteryReplacementDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserVehicleRequestModelImpl &&
            (identical(other.traveledKm, traveledKm) ||
                other.traveledKm == traveledKm) &&
            (identical(other.nextTechnical, nextTechnical) ||
                other.nextTechnical == nextTechnical) &&
            (identical(other.oilReplacement, oilReplacement) ||
                other.oilReplacement == oilReplacement) &&
            (identical(other.batteryReplacementDate, batteryReplacementDate) ||
                other.batteryReplacementDate == batteryReplacementDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, traveledKm, nextTechnical,
      oilReplacement, batteryReplacementDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserVehicleRequestModelImplCopyWith<_$UserVehicleRequestModelImpl>
      get copyWith => __$$UserVehicleRequestModelImplCopyWithImpl<
          _$UserVehicleRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserVehicleRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UserVehicleRequestModel implements UserVehicleRequestModel {
  const factory _UserVehicleRequestModel(
      {@JsonKey(name: 'traveled_km') final String? traveledKm,
      @JsonKey(name: 'next_technical') final String? nextTechnical,
      @JsonKey(name: 'oil_replacement') final String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date')
      final String? batteryReplacementDate}) = _$UserVehicleRequestModelImpl;

  factory _UserVehicleRequestModel.fromJson(Map<String, dynamic> json) =
      _$UserVehicleRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'traveled_km')
  String? get traveledKm;
  @override
  @JsonKey(name: 'next_technical')
  String? get nextTechnical;
  @override
  @JsonKey(name: 'oil_replacement')
  String? get oilReplacement;
  @override
  @JsonKey(name: 'battery_replacement_date')
  String? get batteryReplacementDate;
  @override
  @JsonKey(ignore: true)
  _$$UserVehicleRequestModelImplCopyWith<_$UserVehicleRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
