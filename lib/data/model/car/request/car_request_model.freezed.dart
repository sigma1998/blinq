// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarRequestModel _$CarRequestModelFromJson(Map<String, dynamic> json) {
  return _CarRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CarRequestModel {
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
  @JsonKey(name: 'trailer_registration_number')
  String? get trailerRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_type')
  String? get vehicleType => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'plate_number')
  String? get plateNumber => throw _privateConstructorUsedError;
  int? get car => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;

  /// Serializes this CarRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarRequestModelCopyWith<CarRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarRequestModelCopyWith<$Res> {
  factory $CarRequestModelCopyWith(
          CarRequestModel value, $Res Function(CarRequestModel) then) =
      _$CarRequestModelCopyWithImpl<$Res, CarRequestModel>;
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
      @JsonKey(name: 'trailer_registration_number')
      String? trailerRegistrationNumber,
      @JsonKey(name: 'vehicle_type') String? vehicleType,
      @JsonKey(name: 'traveled_km') String? traveledKm,
      @JsonKey(name: 'next_technical') String? nextTechnical,
      @JsonKey(name: 'oil_replacement') String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
      @JsonKey(name: 'custom_brand') String? customBrand,
      @JsonKey(name: 'custom_car') String? customCar,
      @JsonKey(name: 'custom_car_colour') String? customCarColour,
      @JsonKey(name: 'plate_number') String? plateNumber,
      int? car,
      int? color,
      String? brand});
}

/// @nodoc
class _$CarRequestModelCopyWithImpl<$Res, $Val extends CarRequestModel>
    implements $CarRequestModelCopyWith<$Res> {
  _$CarRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarRequestModel
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
    Object? trailerRegistrationNumber = freezed,
    Object? vehicleType = freezed,
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? oilReplacement = freezed,
    Object? batteryReplacementDate = freezed,
    Object? customBrand = freezed,
    Object? customCar = freezed,
    Object? customCarColour = freezed,
    Object? plateNumber = freezed,
    Object? car = freezed,
    Object? color = freezed,
    Object? brand = freezed,
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
      trailerRegistrationNumber: freezed == trailerRegistrationNumber
          ? _value.trailerRegistrationNumber
          : trailerRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
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
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarRequestModelImplCopyWith<$Res>
    implements $CarRequestModelCopyWith<$Res> {
  factory _$$CarRequestModelImplCopyWith(_$CarRequestModelImpl value,
          $Res Function(_$CarRequestModelImpl) then) =
      __$$CarRequestModelImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'trailer_registration_number')
      String? trailerRegistrationNumber,
      @JsonKey(name: 'vehicle_type') String? vehicleType,
      @JsonKey(name: 'traveled_km') String? traveledKm,
      @JsonKey(name: 'next_technical') String? nextTechnical,
      @JsonKey(name: 'oil_replacement') String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
      @JsonKey(name: 'custom_brand') String? customBrand,
      @JsonKey(name: 'custom_car') String? customCar,
      @JsonKey(name: 'custom_car_colour') String? customCarColour,
      @JsonKey(name: 'plate_number') String? plateNumber,
      int? car,
      int? color,
      String? brand});
}

/// @nodoc
class __$$CarRequestModelImplCopyWithImpl<$Res>
    extends _$CarRequestModelCopyWithImpl<$Res, _$CarRequestModelImpl>
    implements _$$CarRequestModelImplCopyWith<$Res> {
  __$$CarRequestModelImplCopyWithImpl(
      _$CarRequestModelImpl _value, $Res Function(_$CarRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarRequestModel
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
    Object? trailerRegistrationNumber = freezed,
    Object? vehicleType = freezed,
    Object? traveledKm = freezed,
    Object? nextTechnical = freezed,
    Object? oilReplacement = freezed,
    Object? batteryReplacementDate = freezed,
    Object? customBrand = freezed,
    Object? customCar = freezed,
    Object? customCarColour = freezed,
    Object? plateNumber = freezed,
    Object? car = freezed,
    Object? color = freezed,
    Object? brand = freezed,
  }) {
    return _then(_$CarRequestModelImpl(
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
      trailerRegistrationNumber: freezed == trailerRegistrationNumber
          ? _value.trailerRegistrationNumber
          : trailerRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
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
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarRequestModelImpl implements _CarRequestModel {
  const _$CarRequestModelImpl(
      {@JsonKey(name: 'car_id') this.carId,
      @JsonKey(name: 'color_id') this.colorId,
      @JsonKey(name: 'model_series') final List<String>? modelSeries,
      @JsonKey(name: 'make_type') this.makeType,
      @JsonKey(name: 'engine_number') this.engineNumber,
      @JsonKey(name: 'country_of_registration') this.countryOfRegistration,
      @JsonKey(name: 'trailer_country_of_registration')
      this.trailerCountryOfRegistration,
      @JsonKey(name: 'trailer_registration_number')
      this.trailerRegistrationNumber,
      @JsonKey(name: 'vehicle_type') this.vehicleType,
      @JsonKey(name: 'traveled_km') this.traveledKm,
      @JsonKey(name: 'next_technical') this.nextTechnical,
      @JsonKey(name: 'oil_replacement') this.oilReplacement,
      @JsonKey(name: 'battery_replacement_date') this.batteryReplacementDate,
      @JsonKey(name: 'custom_brand') this.customBrand,
      @JsonKey(name: 'custom_car') this.customCar,
      @JsonKey(name: 'custom_car_colour') this.customCarColour,
      @JsonKey(name: 'plate_number') this.plateNumber,
      this.car,
      this.color,
      this.brand})
      : _modelSeries = modelSeries;

  factory _$CarRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarRequestModelImplFromJson(json);

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
  @JsonKey(name: 'trailer_registration_number')
  final String? trailerRegistrationNumber;
  @override
  @JsonKey(name: 'vehicle_type')
  final String? vehicleType;
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
  @JsonKey(name: 'plate_number')
  final String? plateNumber;
  @override
  final int? car;
  @override
  final int? color;
  @override
  final String? brand;

  @override
  String toString() {
    return 'CarRequestModel(carId: $carId, colorId: $colorId, modelSeries: $modelSeries, makeType: $makeType, engineNumber: $engineNumber, countryOfRegistration: $countryOfRegistration, trailerCountryOfRegistration: $trailerCountryOfRegistration, trailerRegistrationNumber: $trailerRegistrationNumber, vehicleType: $vehicleType, traveledKm: $traveledKm, nextTechnical: $nextTechnical, oilReplacement: $oilReplacement, batteryReplacementDate: $batteryReplacementDate, customBrand: $customBrand, customCar: $customCar, customCarColour: $customCarColour, plateNumber: $plateNumber, car: $car, color: $color, brand: $brand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarRequestModelImpl &&
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
            (identical(other.trailerRegistrationNumber,
                    trailerRegistrationNumber) ||
                other.trailerRegistrationNumber == trailerRegistrationNumber) &&
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
            (identical(other.plateNumber, plateNumber) ||
                other.plateNumber == plateNumber) &&
            (identical(other.car, car) || other.car == car) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        carId,
        colorId,
        const DeepCollectionEquality().hash(_modelSeries),
        makeType,
        engineNumber,
        countryOfRegistration,
        trailerCountryOfRegistration,
        trailerRegistrationNumber,
        vehicleType,
        traveledKm,
        nextTechnical,
        oilReplacement,
        batteryReplacementDate,
        customBrand,
        customCar,
        customCarColour,
        plateNumber,
        car,
        color,
        brand
      ]);

  /// Create a copy of CarRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarRequestModelImplCopyWith<_$CarRequestModelImpl> get copyWith =>
      __$$CarRequestModelImplCopyWithImpl<_$CarRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CarRequestModel implements CarRequestModel {
  const factory _CarRequestModel(
      {@JsonKey(name: 'car_id') final int? carId,
      @JsonKey(name: 'color_id') final int? colorId,
      @JsonKey(name: 'model_series') final List<String>? modelSeries,
      @JsonKey(name: 'make_type') final String? makeType,
      @JsonKey(name: 'engine_number') final String? engineNumber,
      @JsonKey(name: 'country_of_registration')
      final String? countryOfRegistration,
      @JsonKey(name: 'trailer_country_of_registration')
      final String? trailerCountryOfRegistration,
      @JsonKey(name: 'trailer_registration_number')
      final String? trailerRegistrationNumber,
      @JsonKey(name: 'vehicle_type') final String? vehicleType,
      @JsonKey(name: 'traveled_km') final String? traveledKm,
      @JsonKey(name: 'next_technical') final String? nextTechnical,
      @JsonKey(name: 'oil_replacement') final String? oilReplacement,
      @JsonKey(name: 'battery_replacement_date')
      final String? batteryReplacementDate,
      @JsonKey(name: 'custom_brand') final String? customBrand,
      @JsonKey(name: 'custom_car') final String? customCar,
      @JsonKey(name: 'custom_car_colour') final String? customCarColour,
      @JsonKey(name: 'plate_number') final String? plateNumber,
      final int? car,
      final int? color,
      final String? brand}) = _$CarRequestModelImpl;

  factory _CarRequestModel.fromJson(Map<String, dynamic> json) =
      _$CarRequestModelImpl.fromJson;

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
  @JsonKey(name: 'trailer_registration_number')
  String? get trailerRegistrationNumber;
  @override
  @JsonKey(name: 'vehicle_type')
  String? get vehicleType;
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
  @JsonKey(name: 'plate_number')
  String? get plateNumber;
  @override
  int? get car;
  @override
  int? get color;
  @override
  String? get brand;

  /// Create a copy of CarRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarRequestModelImplCopyWith<_$CarRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
