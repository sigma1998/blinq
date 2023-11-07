// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CarResponseModel _$CarResponseModelFromJson(Map<String, dynamic> json) {
  return _CarResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CarResponseModel {
  @HiveField(0)
  @JsonKey(name: 'car_id')
  int? get carId => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'color_id')
  int? get colorId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'model_series')
  String? get modelSeries => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'make_type')
  String? get makeType => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'engine_number')
  String? get engineNumber => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'country_of_registration')
  String? get countryOfRegistration => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'trailer_registration_number')
  String? get trailerRegistrationNumber => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'trailer_country_of_registration')
  String? get trailerCountryOfRegistration =>
      throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'car')
  String? get car => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'color')
  String? get color => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'brand_id')
  int? get brandId => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'brand')
  String? get brand => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarResponseModelCopyWith<CarResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarResponseModelCopyWith<$Res> {
  factory $CarResponseModelCopyWith(
          CarResponseModel value, $Res Function(CarResponseModel) then) =
      _$CarResponseModelCopyWithImpl<$Res, CarResponseModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'car_id') int? carId,
      @HiveField(1) @JsonKey(name: 'color_id') int? colorId,
      @HiveField(2) @JsonKey(name: 'model_series') String? modelSeries,
      @HiveField(3) @JsonKey(name: 'make_type') String? makeType,
      @HiveField(4) @JsonKey(name: 'engine_number') String? engineNumber,
      @HiveField(5)
      @JsonKey(name: 'country_of_registration')
      String? countryOfRegistration,
      @HiveField(6)
      @JsonKey(name: 'trailer_registration_number')
      String? trailerRegistrationNumber,
      @HiveField(7)
      @JsonKey(name: 'trailer_country_of_registration')
      String? trailerCountryOfRegistration,
      @HiveField(8) @JsonKey(name: 'car') String? car,
      @HiveField(9) @JsonKey(name: 'color') String? color,
      @HiveField(10) @JsonKey(name: 'brand_id') int? brandId,
      @HiveField(11) @JsonKey(name: 'brand') String? brand});
}

/// @nodoc
class _$CarResponseModelCopyWithImpl<$Res, $Val extends CarResponseModel>
    implements $CarResponseModelCopyWith<$Res> {
  _$CarResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = freezed,
    Object? colorId = freezed,
    Object? modelSeries = freezed,
    Object? makeType = freezed,
    Object? engineNumber = freezed,
    Object? countryOfRegistration = freezed,
    Object? trailerRegistrationNumber = freezed,
    Object? trailerCountryOfRegistration = freezed,
    Object? car = freezed,
    Object? color = freezed,
    Object? brandId = freezed,
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
              as String?,
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
      trailerRegistrationNumber: freezed == trailerRegistrationNumber
          ? _value.trailerRegistrationNumber
          : trailerRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerCountryOfRegistration: freezed == trailerCountryOfRegistration
          ? _value.trailerCountryOfRegistration
          : trailerCountryOfRegistration // ignore: cast_nullable_to_non_nullable
              as String?,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarResponseModelImplCopyWith<$Res>
    implements $CarResponseModelCopyWith<$Res> {
  factory _$$CarResponseModelImplCopyWith(_$CarResponseModelImpl value,
          $Res Function(_$CarResponseModelImpl) then) =
      __$$CarResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'car_id') int? carId,
      @HiveField(1) @JsonKey(name: 'color_id') int? colorId,
      @HiveField(2) @JsonKey(name: 'model_series') String? modelSeries,
      @HiveField(3) @JsonKey(name: 'make_type') String? makeType,
      @HiveField(4) @JsonKey(name: 'engine_number') String? engineNumber,
      @HiveField(5)
      @JsonKey(name: 'country_of_registration')
      String? countryOfRegistration,
      @HiveField(6)
      @JsonKey(name: 'trailer_registration_number')
      String? trailerRegistrationNumber,
      @HiveField(7)
      @JsonKey(name: 'trailer_country_of_registration')
      String? trailerCountryOfRegistration,
      @HiveField(8) @JsonKey(name: 'car') String? car,
      @HiveField(9) @JsonKey(name: 'color') String? color,
      @HiveField(10) @JsonKey(name: 'brand_id') int? brandId,
      @HiveField(11) @JsonKey(name: 'brand') String? brand});
}

/// @nodoc
class __$$CarResponseModelImplCopyWithImpl<$Res>
    extends _$CarResponseModelCopyWithImpl<$Res, _$CarResponseModelImpl>
    implements _$$CarResponseModelImplCopyWith<$Res> {
  __$$CarResponseModelImplCopyWithImpl(_$CarResponseModelImpl _value,
      $Res Function(_$CarResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = freezed,
    Object? colorId = freezed,
    Object? modelSeries = freezed,
    Object? makeType = freezed,
    Object? engineNumber = freezed,
    Object? countryOfRegistration = freezed,
    Object? trailerRegistrationNumber = freezed,
    Object? trailerCountryOfRegistration = freezed,
    Object? car = freezed,
    Object? color = freezed,
    Object? brandId = freezed,
    Object? brand = freezed,
  }) {
    return _then(_$CarResponseModelImpl(
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
              as String?,
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
      trailerRegistrationNumber: freezed == trailerRegistrationNumber
          ? _value.trailerRegistrationNumber
          : trailerRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      trailerCountryOfRegistration: freezed == trailerCountryOfRegistration
          ? _value.trailerCountryOfRegistration
          : trailerCountryOfRegistration // ignore: cast_nullable_to_non_nullable
              as String?,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
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
class _$CarResponseModelImpl implements _CarResponseModel {
  const _$CarResponseModelImpl(
      {@HiveField(0) @JsonKey(name: 'car_id') this.carId,
      @HiveField(1) @JsonKey(name: 'color_id') this.colorId,
      @HiveField(2) @JsonKey(name: 'model_series') this.modelSeries,
      @HiveField(3) @JsonKey(name: 'make_type') this.makeType,
      @HiveField(4) @JsonKey(name: 'engine_number') this.engineNumber,
      @HiveField(5)
      @JsonKey(name: 'country_of_registration')
      this.countryOfRegistration,
      @HiveField(6)
      @JsonKey(name: 'trailer_registration_number')
      this.trailerRegistrationNumber,
      @HiveField(7)
      @JsonKey(name: 'trailer_country_of_registration')
      this.trailerCountryOfRegistration,
      @HiveField(8) @JsonKey(name: 'car') this.car,
      @HiveField(9) @JsonKey(name: 'color') this.color,
      @HiveField(10) @JsonKey(name: 'brand_id') this.brandId,
      @HiveField(11) @JsonKey(name: 'brand') this.brand});

  factory _$CarResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarResponseModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'car_id')
  final int? carId;
  @override
  @HiveField(1)
  @JsonKey(name: 'color_id')
  final int? colorId;
  @override
  @HiveField(2)
  @JsonKey(name: 'model_series')
  final String? modelSeries;
  @override
  @HiveField(3)
  @JsonKey(name: 'make_type')
  final String? makeType;
  @override
  @HiveField(4)
  @JsonKey(name: 'engine_number')
  final String? engineNumber;
  @override
  @HiveField(5)
  @JsonKey(name: 'country_of_registration')
  final String? countryOfRegistration;
  @override
  @HiveField(6)
  @JsonKey(name: 'trailer_registration_number')
  final String? trailerRegistrationNumber;
  @override
  @HiveField(7)
  @JsonKey(name: 'trailer_country_of_registration')
  final String? trailerCountryOfRegistration;
  @override
  @HiveField(8)
  @JsonKey(name: 'car')
  final String? car;
  @override
  @HiveField(9)
  @JsonKey(name: 'color')
  final String? color;
  @override
  @HiveField(10)
  @JsonKey(name: 'brand_id')
  final int? brandId;
  @override
  @HiveField(11)
  @JsonKey(name: 'brand')
  final String? brand;

  @override
  String toString() {
    return 'CarResponseModel(carId: $carId, colorId: $colorId, modelSeries: $modelSeries, makeType: $makeType, engineNumber: $engineNumber, countryOfRegistration: $countryOfRegistration, trailerRegistrationNumber: $trailerRegistrationNumber, trailerCountryOfRegistration: $trailerCountryOfRegistration, car: $car, color: $color, brandId: $brandId, brand: $brand)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarResponseModelImpl &&
            (identical(other.carId, carId) || other.carId == carId) &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.modelSeries, modelSeries) ||
                other.modelSeries == modelSeries) &&
            (identical(other.makeType, makeType) ||
                other.makeType == makeType) &&
            (identical(other.engineNumber, engineNumber) ||
                other.engineNumber == engineNumber) &&
            (identical(other.countryOfRegistration, countryOfRegistration) ||
                other.countryOfRegistration == countryOfRegistration) &&
            (identical(other.trailerRegistrationNumber,
                    trailerRegistrationNumber) ||
                other.trailerRegistrationNumber == trailerRegistrationNumber) &&
            (identical(other.trailerCountryOfRegistration,
                    trailerCountryOfRegistration) ||
                other.trailerCountryOfRegistration ==
                    trailerCountryOfRegistration) &&
            (identical(other.car, car) || other.car == car) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      carId,
      colorId,
      modelSeries,
      makeType,
      engineNumber,
      countryOfRegistration,
      trailerRegistrationNumber,
      trailerCountryOfRegistration,
      car,
      color,
      brandId,
      brand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarResponseModelImplCopyWith<_$CarResponseModelImpl> get copyWith =>
      __$$CarResponseModelImplCopyWithImpl<_$CarResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CarResponseModel implements CarResponseModel {
  const factory _CarResponseModel(
      {@HiveField(0) @JsonKey(name: 'car_id') final int? carId,
      @HiveField(1) @JsonKey(name: 'color_id') final int? colorId,
      @HiveField(2) @JsonKey(name: 'model_series') final String? modelSeries,
      @HiveField(3) @JsonKey(name: 'make_type') final String? makeType,
      @HiveField(4) @JsonKey(name: 'engine_number') final String? engineNumber,
      @HiveField(5)
      @JsonKey(name: 'country_of_registration')
      final String? countryOfRegistration,
      @HiveField(6)
      @JsonKey(name: 'trailer_registration_number')
      final String? trailerRegistrationNumber,
      @HiveField(7)
      @JsonKey(name: 'trailer_country_of_registration')
      final String? trailerCountryOfRegistration,
      @HiveField(8) @JsonKey(name: 'car') final String? car,
      @HiveField(9) @JsonKey(name: 'color') final String? color,
      @HiveField(10) @JsonKey(name: 'brand_id') final int? brandId,
      @HiveField(11)
      @JsonKey(name: 'brand')
      final String? brand}) = _$CarResponseModelImpl;

  factory _CarResponseModel.fromJson(Map<String, dynamic> json) =
      _$CarResponseModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'car_id')
  int? get carId;
  @override
  @HiveField(1)
  @JsonKey(name: 'color_id')
  int? get colorId;
  @override
  @HiveField(2)
  @JsonKey(name: 'model_series')
  String? get modelSeries;
  @override
  @HiveField(3)
  @JsonKey(name: 'make_type')
  String? get makeType;
  @override
  @HiveField(4)
  @JsonKey(name: 'engine_number')
  String? get engineNumber;
  @override
  @HiveField(5)
  @JsonKey(name: 'country_of_registration')
  String? get countryOfRegistration;
  @override
  @HiveField(6)
  @JsonKey(name: 'trailer_registration_number')
  String? get trailerRegistrationNumber;
  @override
  @HiveField(7)
  @JsonKey(name: 'trailer_country_of_registration')
  String? get trailerCountryOfRegistration;
  @override
  @HiveField(8)
  @JsonKey(name: 'car')
  String? get car;
  @override
  @HiveField(9)
  @JsonKey(name: 'color')
  String? get color;
  @override
  @HiveField(10)
  @JsonKey(name: 'brand_id')
  int? get brandId;
  @override
  @HiveField(11)
  @JsonKey(name: 'brand')
  String? get brand;
  @override
  @JsonKey(ignore: true)
  _$$CarResponseModelImplCopyWith<_$CarResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
