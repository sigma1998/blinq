// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileResponseModelAdapter extends TypeAdapter<ProfileResponseModel> {
  @override
  final int typeId = 3;

  @override
  ProfileResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileResponseModel(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
      birthDate: fields[2] as String?,
      country: fields[3] as String?,
      address: fields[4] as String?,
      phoneNumber: fields[5] as String?,
      email: fields[6] as String?,
      qrCode: fields[7] as String?,
      driverLicense: fields[8] as DriverLicenseType?,
      driverLicenseNumber: fields[9] as String?,
      driverLicenseExpiredDate: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileResponseModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.birthDate)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.qrCode)
      ..writeByte(8)
      ..write(obj.driverLicense)
      ..writeByte(9)
      ..write(obj.driverLicenseNumber)
      ..writeByte(10)
      ..write(obj.driverLicenseExpiredDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileResponseModelImpl _$$ProfileResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileResponseModelImpl(
      id: json['id'] as int?,
      image: json['image'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      birthDate: json['birth_date'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      qrCode: json['qr_code'] as String?,
      driverLicense: $enumDecodeNullable(
          _$DriverLicenseTypeEnumMap, json['driver_license']),
      driverLicenseNumber: json['driver_license_number'] as String?,
      driverLicenseExpiredDate: json['driver_license_expired_date'] as String?,
    );

Map<String, dynamic> _$$ProfileResponseModelImplToJson(
        _$ProfileResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birth_date': instance.birthDate,
      'country': instance.country,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'qr_code': instance.qrCode,
      'driver_license': _$DriverLicenseTypeEnumMap[instance.driverLicense],
      'driver_license_number': instance.driverLicenseNumber,
      'driver_license_expired_date': instance.driverLicenseExpiredDate,
    };

const _$DriverLicenseTypeEnumMap = {
  DriverLicenseType.am: 'AM',
  DriverLicenseType.a1: 'A1',
  DriverLicenseType.a2: 'A2',
  DriverLicenseType.a: 'A',
  DriverLicenseType.b1: 'B1',
  DriverLicenseType.b: 'B',
  DriverLicenseType.c1: 'C1',
  DriverLicenseType.c: 'C',
  DriverLicenseType.d1: 'D1',
  DriverLicenseType.d: 'D',
  DriverLicenseType.be: 'C1E',
  DriverLicenseType.c1e: 'CE',
  DriverLicenseType.ce: 'D1E',
  DriverLicenseType.d1e: 'DE',
  DriverLicenseType.de: 'T',
};
