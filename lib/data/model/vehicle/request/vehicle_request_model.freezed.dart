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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserVehicleRequestModel _$UserVehicleRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UserVehicleRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UserVehicleRequestModel {
  @JsonKey(name: 'car_id')
  int? get carId => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_id')
  int? get colorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'model_series')
  List<String>? get modelSeries => throw _privateConstructorUsedError;
  @JsonKey(name: 'make_type')
  String? get makeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'engine_number')
  String? get engineNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_of_registration')
  String? get countryOfRegistration => throw _privateConstructorUsedError;
  @JsonKey(name: 'trailer_country_of_registration')
  String? get trailerCountryOfRegistration =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_type')
  VehicleType? get vehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'traveled_km')
  String? get traveledKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_technical')
  String? get nextTechnical => throw _privateConstructorUsedError;
  @JsonKey(name: 'oil_replacement')
  String? get oilReplacement => throw _privateConstructorUsedError;
  @JsonKey(name: 'battery_replacement_date')
  String? get batteryReplacementDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_brand')
  String? get customBrand => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_car')
  String? get customCar => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_car_colour')
  String? get customCarColour => throw _privateConstructorUsedError;
  int? get car => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;

  /// Serializes this UserVehicleRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserVehicleRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {@JsonKey(name: 'car_id') int? carId,
      @JsonKey(name: 'color_id') int? colorId,
      @JsonKey(name: 'model_series') List<String>? modelSeries,
      @JsonKey(name: 'make_type') String? makeType,
      @JsonKey(name: 'engine_number') String? engineNumber,
      @JsonKey(name: 'country_of_registration') String? countryOfRegistration,
      @JsonKey(name: 'trailer_country_of_registration')
      String? trailerCountryOfRegistration,
      @JsonKey(name: 'vehicle_type') VehicleType? vehicleType,
      @JsonKey(name: 'traveled_km') String? traveledKm,
      @JsonKey(name: 'next_technical') String? nextTechnical,
      @JsonKey(name: 'oil_replacement') String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
      @JsonKey(name: 'custom_brand') String? customBrand,
      @JsonKey(name: 'custom_car') String? customCar,
      @JsonKey(name: 'custom_car_colour') String? customCarColour,
      int? car,
      int? color});
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

  /// Create a copy of UserVehicleRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = freezed,
    Object? colorId = freezed,
    Object? modelSeries = freezed,
    Object? makeType = freezed,
    Object? engineNumber = freezed,
    Object? countryOfRegistration = freezed,
    Object? trailerCountryOfRegistration = freezed,
    Object? vehicleType = freezed,
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? oilReplacement = freezed,
    Object? batteryReplacementDate = freezed,
    Object? customBrand = freezed,
    Object? customCar = freezed,
    Object? customCarColour = freezed,
    Object? car = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      colorId: freezed == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int?,
      modelSeries: freezed == modelSeries
          ? _value.modelSeries
          : modelSeries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      makeType: freezed == makeType
          ? _value.makeType
          : makeType // ignore: cast_nullable_to_non_nullable
              as String?,
      engineNumber: freezed == engineNumber
          ? _value.engineNumber
          : engineNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryOfRegistration: freezed == countryOfRegistration
          ? _value.countryOfRegistration
          : countryOfRegistration // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerCountryOfRegistration: freezed == trailerCountryOfRegistration
          ? _value.trailerCountryOfRegistration
          : trailerCountryOfRegistration // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
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
      customBrand: freezed == customBrand
          ? _value.customBrand
          : customBrand // ignore: cast_nullable_to_non_nullable
              as String?,
      customCar: freezed == customCar
          ? _value.customCar
          : customCar // ignore: cast_nullable_to_non_nullable
              as String?,
      customCarColour: freezed == customCarColour
          ? _value.customCarColour
          : customCarColour // ignore: cast_nullable_to_non_nullable
              as String?,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: 'car_id') int? carId,
      @JsonKey(name: 'color_id') int? colorId,
      @JsonKey(name: 'model_series') List<String>? modelSeries,
      @JsonKey(name: 'make_type') String? makeType,
      @JsonKey(name: 'engine_number') String? engineNumber,
      @JsonKey(name: 'country_of_registration') String? countryOfRegistration,
      @JsonKey(name: 'trailer_country_of_registration')
      String? trailerCountryOfRegistration,
      @JsonKey(name: 'vehicle_type') VehicleType? vehicleType,
      @JsonKey(name: 'traveled_km') String? traveledKm,
      @JsonKey(name: 'next_technical') String? nextTechnical,
      @JsonKey(name: 'oil_replacement') String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
      @JsonKey(name: 'custom_brand') String? customBrand,
      @JsonKey(name: 'custom_car') String? customCar,
      @JsonKey(name: 'custom_car_colour') String? customCarColour,
      int? car,
      int? color});
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

  /// Create a copy of UserVehicleRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = freezed,
    Object? colorId = freezed,
    Object? modelSeries = freezed,
    Object? makeType = freezed,
    Object? engineNumber = freezed,
    Object? countryOfRegistration = freezed,
    Object? trailerCountryOfRegistration = freezed,
    Object? vehicleType = freezed,
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? oilReplacement = freezed,
    Object? batteryReplacementDate = freezed,
    Object? customBrand = freezed,
    Object? customCar = freezed,
    Object? customCarColour = freezed,
    Object? car = freezed,
    Object? color = freezed,
  }) {
    return _then(_$UserVehicleRequestModelImpl(
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      colorId: freezed == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int?,
      modelSeries: freezed == modelSeries
          ? _value._modelSeries
          : modelSeries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      makeType: freezed == makeType
          ? _value.makeType
          : makeType // ignore: cast_nullable_to_non_nullable
              as String?,
      engineNumber: freezed == engineNumber
          ? _value.engineNumber
          : engineNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryOfRegistration: freezed == countryOfRegistration
          ? _value.countryOfRegistration
          : countryOfRegistration // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerCountryOfRegistration: freezed == trailerCountryOfRegistration
          ? _value.trailerCountryOfRegistration
          : trailerCountryOfRegistration // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
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
      customBrand: freezed == customBrand
          ? _value.customBrand
          : customBrand // ignore: cast_nullable_to_non_nullable
              as String?,
      customCar: freezed == customCar
          ? _value.customCar
          : customCar // ignore: cast_nullable_to_non_nullable
              as String?,
      customCarColour: freezed == customCarColour
          ? _value.customCarColour
          : customCarColour // ignore: cast_nullable_to_non_nullable
              as String?,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserVehicleRequestModelImpl implements _UserVehicleRequestModel {
  const _$UserVehicleRequestModelImpl(
      {@JsonKey(name: 'car_id') this.carId,
      @JsonKey(name: 'color_id') this.colorId,
      @JsonKey(name: 'model_series') final List<String>? modelSeries,
      @JsonKey(name: 'make_type') this.makeType,
      @JsonKey(name: 'engine_number') this.engineNumber,
      @JsonKey(name: 'country_of_registration') this.countryOfRegistration,
      @JsonKey(name: 'trailer_country_of_registration')
      this.trailerCountryOfRegistration,
      @JsonKey(name: 'vehicle_type') this.vehicleType,
      @JsonKey(name: 'traveled_km') this.traveledKm,
      @JsonKey(name: 'next_technical') this.nextTechnical,
      @JsonKey(name: 'oil_replacement') this.oilReplacement,
      @JsonKey(name: 'battery_replacement_date') this.batteryReplacementDate,
      @JsonKey(name: 'custom_brand') this.customBrand,
      @JsonKey(name: 'custom_car') this.customCar,
      @JsonKey(name: 'custom_car_colour') this.customCarColour,
      this.car,
      this.color})
      : _modelSeries = modelSeries;

  factory _$UserVehicleRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserVehicleRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'car_id')
  final int? carId;
  @override
  @JsonKey(name: 'color_id')
  final int? colorId;
  final List<String>? _modelSeries;
  @override
  @JsonKey(name: 'model_series')
  List<String>? get modelSeries {
    final value = _modelSeries;
    if (value == null) return null;
    if (_modelSeries is EqualUnmodifiableListView) return _modelSeries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'make_type')
  final String? makeType;
  @override
  @JsonKey(name: 'engine_number')
  final String? engineNumber;
  @override
  @JsonKey(name: 'country_of_registration')
  final String? countryOfRegistration;
  @override
  @JsonKey(name: 'trailer_country_of_registration')
  final String? trailerCountryOfRegistration;
  @override
  @JsonKey(name: 'vehicle_type')
  final VehicleType? vehicleType;
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
  @JsonKey(name: 'custom_brand')
  final String? customBrand;
  @override
  @JsonKey(name: 'custom_car')
  final String? customCar;
  @override
  @JsonKey(name: 'custom_car_colour')
  final String? customCarColour;
  @override
  final int? car;
  @override
  final int? color;

  @override
  String toString() {
    return 'UserVehicleRequestModel(carId: $carId, colorId: $colorId, modelSeries: $modelSeries, makeType: $makeType, engineNumber: $engineNumber, countryOfRegistration: $countryOfRegistration, trailerCountryOfRegistration: $trailerCountryOfRegistration, vehicleType: $vehicleType, traveledKm: $traveledKm, nextTechnical: $nextTechnical, oilReplacement: $oilReplacement, batteryReplacementDate: $batteryReplacementDate, customBrand: $customBrand, customCar: $customCar, customCarColour: $customCarColour, car: $car, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserVehicleRequestModelImpl &&
            (identical(other.carId, carId) || other.carId == carId) &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            const DeepCollectionEquality()
                .equals(other._modelSeries, _modelSeries) &&
            (identical(other.makeType, makeType) ||
                other.makeType == makeType) &&
            (identical(other.engineNumber, engineNumber) ||
                other.engineNumber == engineNumber) &&
            (identical(other.countryOfRegistration, countryOfRegistration) ||
                other.countryOfRegistration == countryOfRegistration) &&
            (identical(other.trailerCountryOfRegistration,
                    trailerCountryOfRegistration) ||
                other.trailerCountryOfRegistration ==
                    trailerCountryOfRegistration) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.traveledKm, traveledKm) ||
                other.traveledKm == traveledKm) &&
            (identical(other.nextTechnical, nextTechnical) ||
                other.nextTechnical == nextTechnical) &&
            (identical(other.oilReplacement, oilReplacement) ||
                other.oilReplacement == oilReplacement) &&
            (identical(other.batteryReplacementDate, batteryReplacementDate) ||
                other.batteryReplacementDate == batteryReplacementDate) &&
            (identical(other.customBrand, customBrand) ||
                other.customBrand == customBrand) &&
            (identical(other.customCar, customCar) ||
                other.customCar == customCar) &&
            (identical(other.customCarColour, customCarColour) ||
                other.customCarColour == customCarColour) &&
            (identical(other.car, car) || other.car == car) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      carId,
      colorId,
      const DeepCollectionEquality().hash(_modelSeries),
      makeType,
      engineNumber,
      countryOfRegistration,
      trailerCountryOfRegistration,
      vehicleType,
      traveledKm,
      nextTechnical,
      oilReplacement,
      batteryReplacementDate,
      customBrand,
      customCar,
      customCarColour,
      car,
      color);

  /// Create a copy of UserVehicleRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {@JsonKey(name: 'car_id') final int? carId,
      @JsonKey(name: 'color_id') final int? colorId,
      @JsonKey(name: 'model_series') final List<String>? modelSeries,
      @JsonKey(name: 'make_type') final String? makeType,
      @JsonKey(name: 'engine_number') final String? engineNumber,
      @JsonKey(name: 'country_of_registration')
      final String? countryOfRegistration,
      @JsonKey(name: 'trailer_country_of_registration')
      final String? trailerCountryOfRegistration,
      @JsonKey(name: 'vehicle_type') final VehicleType? vehicleType,
      @JsonKey(name: 'traveled_km') final String? traveledKm,
      @JsonKey(name: 'next_technical') final String? nextTechnical,
      @JsonKey(name: 'oil_replacement') final String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date')
      final String? batteryReplacementDate,
      @JsonKey(name: 'custom_brand') final String? customBrand,
      @JsonKey(name: 'custom_car') final String? customCar,
      @JsonKey(name: 'custom_car_colour') final String? customCarColour,
      final int? car,
      final int? color}) = _$UserVehicleRequestModelImpl;

  factory _UserVehicleRequestModel.fromJson(Map<String, dynamic> json) =
      _$UserVehicleRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'car_id')
  int? get carId;
  @override
  @JsonKey(name: 'color_id')
  int? get colorId;
  @override
  @JsonKey(name: 'model_series')
  List<String>? get modelSeries;
  @override
  @JsonKey(name: 'make_type')
  String? get makeType;
  @override
  @JsonKey(name: 'engine_number')
  String? get engineNumber;
  @override
  @JsonKey(name: 'country_of_registration')
  String? get countryOfRegistration;
  @override
  @JsonKey(name: 'trailer_country_of_registration')
  String? get trailerCountryOfRegistration;
  @override
  @JsonKey(name: 'vehicle_type')
  VehicleType? get vehicleType;
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
  @JsonKey(name: 'custom_brand')
  String? get customBrand;
  @override
  @JsonKey(name: 'custom_car')
  String? get customCar;
  @override
  @JsonKey(name: 'custom_car_colour')
  String? get customCarColour;
  @override
  int? get car;
  @override
  int? get color;

  /// Create a copy of UserVehicleRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserVehicleRequestModelImplCopyWith<_$UserVehicleRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
