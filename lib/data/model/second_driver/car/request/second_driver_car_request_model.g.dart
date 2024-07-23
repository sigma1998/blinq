// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_driver_car_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecondDriverCarRequestModelImpl _$$SecondDriverCarRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SecondDriverCarRequestModelImpl(
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
      trailerRegistrationNumber: json['trailer_registration_number'] as String?,
      vehicleType: json['vehicle_type'] as String?,
      traveledKm: json['traveled_km'] as String?,
      nextTechnical: json['next_technical'] as String?,
      oilReplacement: json['oil_replacement'] as String?,
      batteryReplacementDate: json['battery_replacement_date'] as String?,
      customBrand: json['custom_brand'] as String?,
      customCar: json['custom_car'] as String?,
      customCarColour: json['custom_car_colour'] as String?,
      plateNumber: json['plate_number'] as String?,
      car: json['car'] as int?,
      color: json['color'] as int?,
      brand: json['brand'] as String?,
    );

Map<String, dynamic> _$$SecondDriverCarRequestModelImplToJson(
        _$SecondDriverCarRequestModelImpl instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'color_id': instance.colorId,
      'model_series': instance.modelSeries,
      'make_type': instance.makeType,
      'engine_number': instance.engineNumber,
      'country_of_registration': instance.countryOfRegistration,
      'trailer_country_of_registration': instance.trailerCountryOfRegistration,
      'trailer_registration_number': instance.trailerRegistrationNumber,
      'vehicle_type': instance.vehicleType,
      'traveled_km': instance.traveledKm,
      'next_technical': instance.nextTechnical,
      'oil_replacement': instance.oilReplacement,
      'battery_replacement_date': instance.batteryReplacementDate,
      'custom_brand': instance.customBrand,
      'custom_car': instance.customCar,
      'custom_car_colour': instance.customCarColour,
      'plate_number': instance.plateNumber,
      'car': instance.car,
      'color': instance.color,
      'brand': instance.brand,
    };
