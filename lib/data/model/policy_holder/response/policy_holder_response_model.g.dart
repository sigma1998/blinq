// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_holder_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PolicyHolderResponseModelAdapter
    extends TypeAdapter<PolicyHolderResponseModel> {
  @override
  final int typeId = 5;

  @override
  PolicyHolderResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PolicyHolderResponseModel(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
      country: fields[2] as String?,
      address: fields[3] as String?,
      postalCode: fields[4] as String?,
      phoneNumber: fields[5] as String?,
      email: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PolicyHolderResponseModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.postalCode)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PolicyHolderResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PolicyHolderResponseModelImpl _$$PolicyHolderResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PolicyHolderResponseModelImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
      postalCode: json['postal_code'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$PolicyHolderResponseModelImplToJson(
        _$PolicyHolderResponseModelImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'country': instance.country,
      'address': instance.address,
      'postal_code': instance.postalCode,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
    };
