// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarRequestModelImpl _$$CarRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CarRequestModelImpl(
      carId: json['car_id'] as int?,
      colorId: json['color_id'] as int?,
      modelSeries: json['model_series'] as String?,
      makeType: json['make_type'] as String?,
      engineNumber: json['engine_number'] as String?,
      countryOfRegistration: json['country_of_registration'] as String?,
      trailerRegistrationNumber: json['trailer_registration_number'] as String?,
      trailerCountryOfRegistration:
          json['trailer_country_of_registration'] as String?,
    );

Map<String, dynamic> _$$CarRequestModelImplToJson(
        _$CarRequestModelImpl instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'color_id': instance.colorId,
      'model_series': instance.modelSeries,
      'make_type': instance.makeType,
      'engine_number': instance.engineNumber,
      'country_of_registration': instance.countryOfRegistration,
      'trailer_registration_number': instance.trailerRegistrationNumber,
      'trailer_country_of_registration': instance.trailerCountryOfRegistration,
    };
