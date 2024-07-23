// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserVehicleRequestModelImpl _$$UserVehicleRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserVehicleRequestModelImpl(
      carId: json['car_id'] as int?,
      colorId: json['color_id'] as int?,
      modelSeries: (json['model_series'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      makeType: json['make_type'] as String?,
      engineNumber: json['engine_number'] as String?,
      countryOfRegistration: json['country_of_registration'] as String?,
      trailerCountryOfRegistration:
          json['trailer_country_of_registration'] as String?,
      vehicleType:
          $enumDecodeNullable(_$VehicleTypeEnumMap, json['vehicle_type']),
      traveledKm: json['traveled_km'] as String?,
      nextTechnical: json['next_technical'] as String?,
      oilReplacement: json['oil_replacement'] as String?,
      batteryReplacementDate: json['battery_replacement_date'] as String?,
      customBrand: json['custom_brand'] as String?,
      customCar: json['custom_car'] as String?,
      customCarColour: json['custom_car_colour'] as String?,
      car: json['car'] as int?,
      color: json['color'] as int?,
    );

Map<String, dynamic> _$$UserVehicleRequestModelImplToJson(
        _$UserVehicleRequestModelImpl instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'color_id': instance.colorId,
      'model_series': instance.modelSeries,
      'make_type': instance.makeType,
      'engine_number': instance.engineNumber,
      'country_of_registration': instance.countryOfRegistration,
      'trailer_country_of_registration': instance.trailerCountryOfRegistration,
      'vehicle_type': _$VehicleTypeEnumMap[instance.vehicleType],
      'traveled_km': instance.traveledKm,
      'next_technical': instance.nextTechnical,
      'oil_replacement': instance.oilReplacement,
      'battery_replacement_date': instance.batteryReplacementDate,
      'custom_brand': instance.customBrand,
      'custom_car': instance.customCar,
      'custom_car_colour': instance.customCarColour,
      'car': instance.car,
      'color': instance.color,
    };

const _$VehicleTypeEnumMap = {
  VehicleType.auto: 'sedan',
  VehicleType.van: 'van',
  VehicleType.moto: 'bike',
};
