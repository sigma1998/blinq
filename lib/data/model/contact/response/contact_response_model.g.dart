// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactResponseModelAdapter extends TypeAdapter<ContactResponseModel> {
  @override
  final int typeId = 8;

  @override
  ContactResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactResponseModel(
      id: fields[0] as int?,
      image: fields[1] as String?,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      phoneNumber: fields[4] as String?,
      isEmergency: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ContactResponseModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.isEmergency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactResponseModelImpl _$$ContactResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactResponseModelImpl(
      id: json['id'] as int?,
      image: json['image'] as String?,
      firstName: json['name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isEmergency: json['is_emergency'] as String?,
    );

Map<String, dynamic> _$$ContactResponseModelImplToJson(
        _$ContactResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'is_emergency': instance.isEmergency,
    };
