// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injury.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InjuryDtoImpl _$$InjuryDtoImplFromJson(Map<String, dynamic> json) =>
    _$InjuryDtoImpl(
      injury: json['injury'] as bool,
      otherDamagedVehicles: json['other_damaged_vehicles'] as bool,
      otherDamagedItems: json['other_damaged_items'] as bool,
    );

Map<String, dynamic> _$$InjuryDtoImplToJson(_$InjuryDtoImpl instance) =>
    <String, dynamic>{
      'injury': instance.injury,
      'other_damaged_vehicles': instance.otherDamagedVehicles,
      'other_damaged_items': instance.otherDamagedItems,
    };
