// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_response_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactResponseDtoAdapter extends TypeAdapter<ContactResponseDto> {
  @override
  final int typeId = 9;

  @override
  ContactResponseDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactResponseDto(
      count: fields[0] as int?,
      next: fields[1] as String?,
      previous: fields[2] as String?,
      results: (fields[3] as List?)?.cast<ContactResponseModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ContactResponseDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.next)
      ..writeByte(2)
      ..write(obj.previous)
      ..writeByte(3)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactResponseDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactResponseDtoImpl _$$ContactResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactResponseDtoImpl(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ContactResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContactResponseDtoImplToJson(
        _$ContactResponseDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
