// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_driver_car_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecondDriverCarRequestModelImpl _$$SecondDriverCarRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SecondDriverCarRequestModelImpl(
      car: json['car'] as int?,
      color: json['color'] as int?,
      modelSeries: json['model_series'] as String?,
      mark: json['mark'] as String?,
      makeType: json['make_type'] as String?,
      engineNumber: json['engine_number'] as String?,
      countryOfRegistration: json['country_of_registration'] as String?,
      trailerRegistrationNumber: json['trailer_registration_number'] as String?,
      trailerCountryOfRegistration:
          json['trailer_country_of_registration'] as String?,
    );

Map<String, dynamic> _$$SecondDriverCarRequestModelImplToJson(
        _$SecondDriverCarRequestModelImpl instance) =>
    <String, dynamic>{
      'car': instance.car,
      'color': instance.color,
      'model_series': instance.modelSeries,
      'mark': instance.mark,
      'make_type': instance.makeType,
      'engine_number': instance.engineNumber,
      'country_of_registration': instance.countryOfRegistration,
      'trailer_registration_number': instance.trailerRegistrationNumber,
      'trailer_country_of_registration': instance.trailerCountryOfRegistration,
    };
