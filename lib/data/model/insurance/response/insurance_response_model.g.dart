// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InsuranceResponseModelAdapter
    extends TypeAdapter<InsuranceResponseModel> {
  @override
  final int typeId = 6;

  @override
  InsuranceResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InsuranceResponseModel(
      name: fields[0] as String?,
      policyNumber: fields[1] as String?,
      greenCardNumber: fields[2] as String?,
      certificateValidFrom: fields[3] as String?,
      certificateValidTo: fields[4] as String?,
      agency: fields[5] as String?,
      country: fields[6] as String?,
      address: fields[7] as String?,
      email: fields[8] as String?,
      policyCover: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, InsuranceResponseModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.policyNumber)
      ..writeByte(2)
      ..write(obj.greenCardNumber)
      ..writeByte(3)
      ..write(obj.certificateValidFrom)
      ..writeByte(4)
      ..write(obj.certificateValidTo)
      ..writeByte(5)
      ..write(obj.agency)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.policyCover);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InsuranceResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsuranceResponseModelImpl _$$InsuranceResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InsuranceResponseModelImpl(
      name: json['name'] as String?,
      policyNumber: json['policy_number'] as String?,
      greenCardNumber: json['green_card_number'] as String?,
      certificateValidFrom: json['certificate_valid_from'] as String?,
      certificateValidTo: json['certificate_valid_to'] as String?,
      agency: json['agency'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      policyCover: json['policy_cover'] as String?,
    );

Map<String, dynamic> _$$InsuranceResponseModelImplToJson(
        _$InsuranceResponseModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'policy_number': instance.policyNumber,
      'green_card_number': instance.greenCardNumber,
      'certificate_valid_from': instance.certificateValidFrom,
      'certificate_valid_to': instance.certificateValidTo,
      'agency': instance.agency,
      'country': instance.country,
      'address': instance.address,
      'email': instance.email,
      'policy_cover': instance.policyCover,
    };
