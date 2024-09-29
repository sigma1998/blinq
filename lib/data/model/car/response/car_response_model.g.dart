// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarResponseModelImpl _$$CarResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CarResponseModelImpl(
      carId: (json['car_id'] as num?)?.toInt(),
      colorId: (json['color_id'] as num?)?.toInt(),
      modelSeries: json['model_series'] as String?,
      makeType: json['make_type'] as String?,
      engineNumber: json['engine_number'] as String?,
      countryOfRegistration: json['country_of_registration'] as String?,
      trailerRegistrationNumber: json['trailer_registration_number'] as String?,
      trailerCountryOfRegistration:
          json['trailer_country_of_registration'] as String?,
      vehicleType: json['vehicle_type'] as String?,
      traveledKm: (json['traveled_km'] as num?)?.toInt(),
      nextTechnical: (json['next_technical'] as num?)?.toInt(),
      nextTechnicalUpdatedDate: json['next_technical_updated_date'] == null
          ? null
          : DateTime.parse(json['next_technical_updated_date'] as String),
      oilReplacement: (json['oil_replacement'] as num?)?.toInt(),
      oilReplacementUpdatedDate: json['oil_replacement_updated_date'] == null
          ? null
          : DateTime.parse(json['oil_replacement_updated_date'] as String),
      batteryReplacementDate: json['battery_replacement_date'] == null
          ? null
          : DateTime.parse(json['battery_replacement_date'] as String),
      batterReplacement: (json['battery_replacement'] as num?)?.toInt(),
      batteryReplacementUpdatedDate: json['battery_replacement_updated_date'] ==
              null
          ? null
          : DateTime.parse(json['battery_replacement_updated_date'] as String),
      customBrand: json['custom_brand'] as String?,
      customCar: json['custom_car'] as String?,
      customCarColour: json['custom_car_colour'] as String?,
      plateNumber: json['plate_number'] as String?,
      car: json['car'] as String?,
      color: json['color'] as String?,
      brand: json['brand'] as String?,
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
      'vehicle_type': instance.vehicleType,
      'traveled_km': instance.traveledKm,
      'next_technical': instance.nextTechnical,
      'next_technical_updated_date':
          instance.nextTechnicalUpdatedDate?.toIso8601String(),
      'oil_replacement': instance.oilReplacement,
      'oil_replacement_updated_date':
          instance.oilReplacementUpdatedDate?.toIso8601String(),
      'battery_replacement_date':
          instance.batteryReplacementDate?.toIso8601String(),
      'battery_replacement': instance.batterReplacement,
      'battery_replacement_updated_date':
          instance.batteryReplacementUpdatedDate?.toIso8601String(),
      'custom_brand': instance.customBrand,
      'custom_car': instance.customCar,
      'custom_car_colour': instance.customCarColour,
      'plate_number': instance.plateNumber,
      'car': instance.car,
      'color': instance.color,
      'brand': instance.brand,
    };
