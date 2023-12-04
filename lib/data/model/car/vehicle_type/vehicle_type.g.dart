// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleTypeAdapter extends TypeAdapter<VehicleType> {
  @override
  final int typeId = 12;

  @override
  VehicleType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VehicleType.auto;
      case 1:
        return VehicleType.van;
      case 2:
        return VehicleType.moto;
      default:
        return VehicleType.auto;
    }
  }

  @override
  void write(BinaryWriter writer, VehicleType obj) {
    switch (obj) {
      case VehicleType.auto:
        writer.writeByte(0);
        break;
      case VehicleType.van:
        writer.writeByte(1);
        break;
      case VehicleType.moto:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
