// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserVehicleResponseModel _$UserVehicleResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UserVehicleResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserVehicleResponseModel {
  @JsonKey(name: 'car_id')
  int? get carId => throw _privateConstructorUsedError;
  @JsonKey(name: 'traveled_km')
  int? get traveledKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_technical')
  int? get nextTechnical => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_technical_updated_date')
  String? get nextTechnicalUpdatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'oil_replacement')
  int? get oilReplacement => throw _privateConstructorUsedError;
  @JsonKey(name: 'oil_replacement_updated_date')
  String? get oilReplacementUpdatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'battery_replacement_date')
  String? get batteryReplacementDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'battery_replacement')
  int? get batteryReplacement => throw _privateConstructorUsedError;
  @JsonKey(name: 'battery_replacement_updated_date')
  String? get batteryReplacementUpdatedDate =>
      throw _privateConstructorUsedError;

  /// Serializes this UserVehicleResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserVehicleResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserVehicleResponseModelCopyWith<UserVehicleResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserVehicleResponseModelCopyWith<$Res> {
  factory $UserVehicleResponseModelCopyWith(UserVehicleResponseModel value,
          $Res Function(UserVehicleResponseModel) then) =
      _$UserVehicleResponseModelCopyWithImpl<$Res, UserVehicleResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'car_id') int? carId,
      @JsonKey(name: 'traveled_km') int? traveledKm,
      @JsonKey(name: 'next_technical') int? nextTechnical,
      @JsonKey(name: 'next_technical_updated_date')
      String? nextTechnicalUpdatedDate,
      @JsonKey(name: 'oil_replacement') int? oilReplacement,
      @JsonKey(name: 'oil_replacement_updated_date')
      String? oilReplacementUpdatedDate,
      @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
      @JsonKey(name: 'battery_replacement') int? batteryReplacement,
      @JsonKey(name: 'battery_replacement_updated_date')
      String? batteryReplacementUpdatedDate});
}

/// @nodoc
class _$UserVehicleResponseModelCopyWithImpl<$Res,
        $Val extends UserVehicleResponseModel>
    implements $UserVehicleResponseModelCopyWith<$Res> {
  _$UserVehicleResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserVehicleResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = freezed,
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? nextTechnicalUpdatedDate = freezed,
    Object? oilReplacement = freezed,
    Object? oilReplacementUpdatedDate = freezed,
    Object? batteryReplacementDate = freezed,
    Object? batteryReplacement = freezed,
    Object? batteryReplacementUpdatedDate = freezed,
  }) {
    return _then(_value.copyWith(
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      traveledKm: freezed == traveledKm
          ? _value.traveledKm
          : traveledKm // ignore: cast_nullable_to_non_nullable
              as int?,
      nextTechnical: freezed == nextTechnical
          ? _value.nextTechnical
          : nextTechnical // ignore: cast_nullable_to_non_nullable
              as int?,
      nextTechnicalUpdatedDate: freezed == nextTechnicalUpdatedDate
          ? _value.nextTechnicalUpdatedDate
          : nextTechnicalUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      oilReplacement: freezed == oilReplacement
          ? _value.oilReplacement
          : oilReplacement // ignore: cast_nullable_to_non_nullable
              as int?,
      oilReplacementUpdatedDate: freezed == oilReplacementUpdatedDate
          ? _value.oilReplacementUpdatedDate
          : oilReplacementUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryReplacementDate: freezed == batteryReplacementDate
          ? _value.batteryReplacementDate
          : batteryReplacementDate // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryReplacement: freezed == batteryReplacement
          ? _value.batteryReplacement
          : batteryReplacement // ignore: cast_nullable_to_non_nullable
              as int?,
      batteryReplacementUpdatedDate: freezed == batteryReplacementUpdatedDate
          ? _value.batteryReplacementUpdatedDate
          : batteryReplacementUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserVehicleResponseModelImplCopyWith<$Res>
    implements $UserVehicleResponseModelCopyWith<$Res> {
  factory _$$UserVehicleResponseModelImplCopyWith(
          _$UserVehicleResponseModelImpl value,
          $Res Function(_$UserVehicleResponseModelImpl) then) =
      __$$UserVehicleResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'car_id') int? carId,
      @JsonKey(name: 'traveled_km') int? traveledKm,
      @JsonKey(name: 'next_technical') int? nextTechnical,
      @JsonKey(name: 'next_technical_updated_date')
      String? nextTechnicalUpdatedDate,
      @JsonKey(name: 'oil_replacement') int? oilReplacement,
      @JsonKey(name: 'oil_replacement_updated_date')
      String? oilReplacementUpdatedDate,
      @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
      @JsonKey(name: 'battery_replacement') int? batteryReplacement,
      @JsonKey(name: 'battery_replacement_updated_date')
      String? batteryReplacementUpdatedDate});
}

/// @nodoc
class __$$UserVehicleResponseModelImplCopyWithImpl<$Res>
    extends _$UserVehicleResponseModelCopyWithImpl<$Res,
        _$UserVehicleResponseModelImpl>
    implements _$$UserVehicleResponseModelImplCopyWith<$Res> {
  __$$UserVehicleResponseModelImplCopyWithImpl(
      _$UserVehicleResponseModelImpl _value,
      $Res Function(_$UserVehicleResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserVehicleResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = freezed,
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? nextTechnicalUpdatedDate = freezed,
    Object? oilReplacement = freezed,
    Object? oilReplacementUpdatedDate = freezed,
    Object? batteryReplacementDate = freezed,
    Object? batteryReplacement = freezed,
    Object? batteryReplacementUpdatedDate = freezed,
  }) {
    return _then(_$UserVehicleResponseModelImpl(
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      traveledKm: freezed == traveledKm
          ? _value.traveledKm
          : traveledKm // ignore: cast_nullable_to_non_nullable
              as int?,
      nextTechnical: freezed == nextTechnical
          ? _value.nextTechnical
          : nextTechnical // ignore: cast_nullable_to_non_nullable
              as int?,
      nextTechnicalUpdatedDate: freezed == nextTechnicalUpdatedDate
          ? _value.nextTechnicalUpdatedDate
          : nextTechnicalUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      oilReplacement: freezed == oilReplacement
          ? _value.oilReplacement
          : oilReplacement // ignore: cast_nullable_to_non_nullable
              as int?,
      oilReplacementUpdatedDate: freezed == oilReplacementUpdatedDate
          ? _value.oilReplacementUpdatedDate
          : oilReplacementUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryReplacementDate: freezed == batteryReplacementDate
          ? _value.batteryReplacementDate
          : batteryReplacementDate // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryReplacement: freezed == batteryReplacement
          ? _value.batteryReplacement
          : batteryReplacement // ignore: cast_nullable_to_non_nullable
              as int?,
      batteryReplacementUpdatedDate: freezed == batteryReplacementUpdatedDate
          ? _value.batteryReplacementUpdatedDate
          : batteryReplacementUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserVehicleResponseModelImpl implements _UserVehicleResponseModel {
  const _$UserVehicleResponseModelImpl(
      {@JsonKey(name: 'car_id') this.carId,
      @JsonKey(name: 'traveled_km') this.traveledKm,
      @JsonKey(name: 'next_technical') this.nextTechnical,
      @JsonKey(name: 'next_technical_updated_date')
      this.nextTechnicalUpdatedDate,
      @JsonKey(name: 'oil_replacement') this.oilReplacement,
      @JsonKey(name: 'oil_replacement_updated_date')
      this.oilReplacementUpdatedDate,
      @JsonKey(name: 'battery_replacement_date') this.batteryReplacementDate,
      @JsonKey(name: 'battery_replacement') this.batteryReplacement,
      @JsonKey(name: 'battery_replacement_updated_date')
      this.batteryReplacementUpdatedDate});

  factory _$UserVehicleResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserVehicleResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'car_id')
  final int? carId;
  @override
  @JsonKey(name: 'traveled_km')
  final int? traveledKm;
  @override
  @JsonKey(name: 'next_technical')
  final int? nextTechnical;
  @override
  @JsonKey(name: 'next_technical_updated_date')
  final String? nextTechnicalUpdatedDate;
  @override
  @JsonKey(name: 'oil_replacement')
  final int? oilReplacement;
  @override
  @JsonKey(name: 'oil_replacement_updated_date')
  final String? oilReplacementUpdatedDate;
  @override
  @JsonKey(name: 'battery_replacement_date')
  final String? batteryReplacementDate;
  @override
  @JsonKey(name: 'battery_replacement')
  final int? batteryReplacement;
  @override
  @JsonKey(name: 'battery_replacement_updated_date')
  final String? batteryReplacementUpdatedDate;

  @override
  String toString() {
    return 'UserVehicleResponseModel(carId: $carId, traveledKm: $traveledKm, nextTechnical: $nextTechnical, nextTechnicalUpdatedDate: $nextTechnicalUpdatedDate, oilReplacement: $oilReplacement, oilReplacementUpdatedDate: $oilReplacementUpdatedDate, batteryReplacementDate: $batteryReplacementDate, batteryReplacement: $batteryReplacement, batteryReplacementUpdatedDate: $batteryReplacementUpdatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserVehicleResponseModelImpl &&
            (identical(other.carId, carId) || other.carId == carId) &&
            (identical(other.traveledKm, traveledKm) ||
                other.traveledKm == traveledKm) &&
            (identical(other.nextTechnical, nextTechnical) ||
                other.nextTechnical == nextTechnical) &&
            (identical(
                    other.nextTechnicalUpdatedDate, nextTechnicalUpdatedDate) ||
                other.nextTechnicalUpdatedDate == nextTechnicalUpdatedDate) &&
            (identical(other.oilReplacement, oilReplacement) ||
                other.oilReplacement == oilReplacement) &&
            (identical(other.oilReplacementUpdatedDate,
                    oilReplacementUpdatedDate) ||
                other.oilReplacementUpdatedDate == oilReplacementUpdatedDate) &&
            (identical(other.batteryReplacementDate, batteryReplacementDate) ||
                other.batteryReplacementDate == batteryReplacementDate) &&
            (identical(other.batteryReplacement, batteryReplacement) ||
                other.batteryReplacement == batteryReplacement) &&
            (identical(other.batteryReplacementUpdatedDate,
                    batteryReplacementUpdatedDate) ||
                other.batteryReplacementUpdatedDate ==
                    batteryReplacementUpdatedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      carId,
      traveledKm,
      nextTechnical,
      nextTechnicalUpdatedDate,
      oilReplacement,
      oilReplacementUpdatedDate,
      batteryReplacementDate,
      batteryReplacement,
      batteryReplacementUpdatedDate);

  /// Create a copy of UserVehicleResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserVehicleResponseModelImplCopyWith<_$UserVehicleResponseModelImpl>
      get copyWith => __$$UserVehicleResponseModelImplCopyWithImpl<
          _$UserVehicleResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserVehicleResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UserVehicleResponseModel implements UserVehicleResponseModel {
  const factory _UserVehicleResponseModel(
          {@JsonKey(name: 'car_id') final int? carId,
          @JsonKey(name: 'traveled_km') final int? traveledKm,
          @JsonKey(name: 'next_technical') final int? nextTechnical,
          @JsonKey(name: 'next_technical_updated_date')
          final String? nextTechnicalUpdatedDate,
          @JsonKey(name: 'oil_replacement') final int? oilReplacement,
          @JsonKey(name: 'oil_replacement_updated_date')
          final String? oilReplacementUpdatedDate,
          @JsonKey(name: 'battery_replacement_date')
          final String? batteryReplacementDate,
          @JsonKey(name: 'battery_replacement') final int? batteryReplacement,
          @JsonKey(name: 'battery_replacement_updated_date')
          final String? batteryReplacementUpdatedDate}) =
      _$UserVehicleResponseModelImpl;

  factory _UserVehicleResponseModel.fromJson(Map<String, dynamic> json) =
      _$UserVehicleResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'car_id')
  int? get carId;
  @override
  @JsonKey(name: 'traveled_km')
  int? get traveledKm;
  @override
  @JsonKey(name: 'next_technical')
  int? get nextTechnical;
  @override
  @JsonKey(name: 'next_technical_updated_date')
  String? get nextTechnicalUpdatedDate;
  @override
  @JsonKey(name: 'oil_replacement')
  int? get oilReplacement;
  @override
  @JsonKey(name: 'oil_replacement_updated_date')
  String? get oilReplacementUpdatedDate;
  @override
  @JsonKey(name: 'battery_replacement_date')
  String? get batteryReplacementDate;
  @override
  @JsonKey(name: 'battery_replacement')
  int? get batteryReplacement;
  @override
  @JsonKey(name: 'battery_replacement_updated_date')
  String? get batteryReplacementUpdatedDate;

  /// Create a copy of UserVehicleResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserVehicleResponseModelImplCopyWith<_$UserVehicleResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
