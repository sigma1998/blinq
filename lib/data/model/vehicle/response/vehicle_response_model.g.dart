// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserVehicleResponseModelImpl _$$UserVehicleResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserVehicleResponseModelImpl(
      carId: json['car_id'] as int?,
      traveledKm: json['traveled_km'] as int?,
      nextTechnical: json['next_technical'] as int?,
      nextTechnicalUpdatedDate: json['next_technical_updated_date'] as String?,
      oilReplacement: json['oil_replacement'] as int?,
      oilReplacementUpdatedDate:
          json['oil_replacement_updated_date'] as String?,
      batteryReplacementDate: json['battery_replacement_date'] as String?,
      batteryReplacement: json['battery_replacement'] as int?,
      batteryReplacementUpdatedDate:
          json['battery_replacement_updated_date'] as String?,
    );

Map<String, dynamic> _$$UserVehicleResponseModelImplToJson(
        _$UserVehicleResponseModelImpl instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'traveled_km': instance.traveledKm,
      'next_technical': instance.nextTechnical,
      'next_technical_updated_date': instance.nextTechnicalUpdatedDate,
      'oil_replacement': instance.oilReplacement,
      'oil_replacement_updated_date': instance.oilReplacementUpdatedDate,
      'battery_replacement_date': instance.batteryReplacementDate,
      'battery_replacement': instance.batteryReplacement,
      'battery_replacement_updated_date':
          instance.batteryReplacementUpdatedDate,
    };
