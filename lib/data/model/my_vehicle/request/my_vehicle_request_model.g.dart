// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_vehicle_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyVehicleRequestModelImpl _$$MyVehicleRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyVehicleRequestModelImpl(
      traveledKm: json['traveled_km'] as String?,
      nextTechnical: json['next_technical'] as String?,
      oilReplacement: json['oil_replacement'] as String?,
      batteryReplacementDate: json['battery_replacement_date'] as String?,
    );

Map<String, dynamic> _$$MyVehicleRequestModelImplToJson(
        _$MyVehicleRequestModelImpl instance) =>
    <String, dynamic>{
      'traveled_km': instance.traveledKm,
      'next_technical': instance.nextTechnical,
      'oil_replacement': instance.oilReplacement,
      'battery_replacement_date': instance.batteryReplacementDate,
    };
