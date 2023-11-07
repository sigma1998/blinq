// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserVehicleRequestModelImpl _$$UserVehicleRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserVehicleRequestModelImpl(
      traveledKm: json['traveled_km'] as String?,
      nextTechnical: json['next_technical'] as String?,
      oilReplacement: json['oil_replacement'] as String?,
      batteryReplacementDate: json['battery_replacement_date'] as String?,
    );

Map<String, dynamic> _$$UserVehicleRequestModelImplToJson(
        _$UserVehicleRequestModelImpl instance) =>
    <String, dynamic>{
      'traveled_km': instance.traveledKm,
      'next_technical': instance.nextTechnical,
      'oil_replacement': instance.oilReplacement,
      'battery_replacement_date': instance.batteryReplacementDate,
    };
