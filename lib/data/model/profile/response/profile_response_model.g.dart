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
      id: fields[0] as int?,
      image: fields[1] as String?,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      birthDate: fields[4] as String?,
      country: fields[5] as String?,
      address: fields[6] as String?,
      phoneNumber: fields[7] as String?,
      email: fields[8] as String?,
      qrCode: fields[9] as String?,
      driverLicense: fields[10] as DriverLicenseType?,
      driverLicenseNumber: fields[11] as String?,
      driverLicenseExpiredDate: fields[12] as String?,
      car: fields[14] as CarResponseModel?,
      policyHolder: fields[15] as PolicyHolderResponseModel?,
      insurance: fields[16] as InsuranceResponseModel?,
      userVehicle: fields[17] as UserVehicleResponseModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileResponseModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.birthDate)
      ..writeByte(5)
      ..write(obj.country)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.qrCode)
      ..writeByte(10)
      ..write(obj.driverLicense)
      ..writeByte(11)
      ..write(obj.driverLicenseNumber)
      ..writeByte(12)
      ..write(obj.driverLicenseExpiredDate)
      ..writeByte(14)
      ..write(obj.car)
      ..writeByte(15)
      ..write(obj.policyHolder)
      ..writeByte(16)
      ..write(obj.insurance)
      ..writeByte(17)
      ..write(obj.userVehicle);
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
      car: json['car'] == null
          ? null
          : CarResponseModel.fromJson(json['car'] as Map<String, dynamic>),
      policyHolder: json['policy_holder'] == null
          ? null
          : PolicyHolderResponseModel.fromJson(
              json['policy_holder'] as Map<String, dynamic>),
      insurance: json['insurance'] == null
          ? null
          : InsuranceResponseModel.fromJson(
              json['insurance'] as Map<String, dynamic>),
      userVehicle: json['usersvehicledatas'] == null
          ? null
          : UserVehicleResponseModel.fromJson(
              json['usersvehicledatas'] as Map<String, dynamic>),
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
      'car': instance.car,
      'policy_holder': instance.policyHolder,
      'insurance': instance.insurance,
      'usersvehicledatas': instance.userVehicle,
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
