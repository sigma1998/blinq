// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarResponseModelImpl _$$CarResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CarResponseModelImpl(
      carId: json['car_id'] as int?,
      colorId: json['color_id'] as int?,
      modelSeries: json['model_series'] as String?,
      makeType: json['make_type'] as String?,
      engineNumber: json['engine_number'] as String?,
      countryOfRegistration: json['country_of_registration'] as String?,
      trailerRegistrationNumber: json['trailer_registration_number'] as String?,
      trailerCountryOfRegistration:
          json['trailer_country_of_registration'] as String?,
      car: json['car'] as String?,
      color: json['color'] as String?,
      brandId: json['brand_id'] as int?,
      brand: json['brand'] as String?,
      vehicleType:
          $enumDecodeNullable(_$VehicleTypeEnumMap, json['vehicle_type']) ??
              VehicleType.auto,
    );

Map<String, dynamic> _$$CarResponseModelImplToJson(
        _$CarResponseModelImpl instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'color_id': instance.colorId,
      'model_series': instance.modelSeries,
      'make_type': instance.makeType,
      'engine_number': instance.engineNumber,
      'country_of_registration': instance.countryOfRegistration,
      'trailer_registration_number': instance.trailerRegistrationNumber,
      'trailer_country_of_registration': instance.trailerCountryOfRegistration,
      'car': instance.car,
      'color': instance.color,
      'brand_id': instance.brandId,
      'brand': instance.brand,
      'vehicle_type': _$VehicleTypeEnumMap[instance.vehicleType],
    };

const _$VehicleTypeEnumMap = {
  VehicleType.auto: 'sedan',
  VehicleType.van: 'van',
  VehicleType.moto: 'bike',
};
