// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_license_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverLicenseTypeAdapter extends TypeAdapter<DriverLicenseType> {
  @override
  final int typeId = 1;

  @override
  DriverLicenseType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DriverLicenseType.am;
      case 2:
        return DriverLicenseType.a1;
      case 3:
        return DriverLicenseType.a2;
      case 4:
        return DriverLicenseType.a;
      case 5:
        return DriverLicenseType.b1;
      case 6:
        return DriverLicenseType.b;
      case 7:
        return DriverLicenseType.c1;
      case 8:
        return DriverLicenseType.c;
      case 9:
        return DriverLicenseType.d1;
      case 10:
        return DriverLicenseType.d;
      case 11:
        return DriverLicenseType.be;
      case 12:
        return DriverLicenseType.c1e;
      case 13:
        return DriverLicenseType.ce;
      case 14:
        return DriverLicenseType.d1e;
      case 15:
        return DriverLicenseType.de;
      default:
        return DriverLicenseType.am;
    }
  }

  @override
  void write(BinaryWriter writer, DriverLicenseType obj) {
    switch (obj) {
      case DriverLicenseType.am:
        writer.writeByte(0);
        break;
      case DriverLicenseType.a1:
        writer.writeByte(2);
        break;
      case DriverLicenseType.a2:
        writer.writeByte(3);
        break;
      case DriverLicenseType.a:
        writer.writeByte(4);
        break;
      case DriverLicenseType.b1:
        writer.writeByte(5);
        break;
      case DriverLicenseType.b:
        writer.writeByte(6);
        break;
      case DriverLicenseType.c1:
        writer.writeByte(7);
        break;
      case DriverLicenseType.c:
        writer.writeByte(8);
        break;
      case DriverLicenseType.d1:
        writer.writeByte(9);
        break;
      case DriverLicenseType.d:
        writer.writeByte(10);
        break;
      case DriverLicenseType.be:
        writer.writeByte(11);
        break;
      case DriverLicenseType.c1e:
        writer.writeByte(12);
        break;
      case DriverLicenseType.ce:
        writer.writeByte(13);
        break;
      case DriverLicenseType.d1e:
        writer.writeByte(14);
        break;
      case DriverLicenseType.de:
        writer.writeByte(15);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverLicenseTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
