// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserVehicleResponseModelAdapter
    extends TypeAdapter<UserVehicleResponseModel> {
  @override
  final int typeId = 7;

  @override
  UserVehicleResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserVehicleResponseModel(
      traveledKm: fields[0] as int?,
      nextTechnical: fields[1] as int?,
      nextTechnicalUpdatedDate: fields[3] as String?,
      oilReplacement: fields[4] as int?,
      oilReplacementUpdatedDate: fields[5] as String?,
      batteryReplacementDate: fields[6] as String?,
      batteryReplacement: fields[7] as int?,
      batteryReplacementUpdatedDate: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserVehicleResponseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.traveledKm)
      ..writeByte(1)
      ..write(obj.nextTechnical)
      ..writeByte(3)
      ..write(obj.nextTechnicalUpdatedDate)
      ..writeByte(4)
      ..write(obj.oilReplacement)
      ..writeByte(5)
      ..write(obj.oilReplacementUpdatedDate)
      ..writeByte(6)
      ..write(obj.batteryReplacementDate)
      ..writeByte(7)
      ..write(obj.batteryReplacement)
      ..writeByte(8)
      ..write(obj.batteryReplacementUpdatedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserVehicleResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserVehicleResponseModelImpl _$$UserVehicleResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserVehicleResponseModelImpl(
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
