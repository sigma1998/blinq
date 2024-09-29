// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_color_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleColorDtoImpl _$$VehicleColorDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleColorDtoImpl(
      id: (json['id'] as num?)?.toInt(),
      colour: json['colour'] as String?,
      brandId: (json['brandId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VehicleColorDtoImplToJson(
        _$VehicleColorDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'colour': instance.colour,
      'brandId': instance.brandId,
    };
