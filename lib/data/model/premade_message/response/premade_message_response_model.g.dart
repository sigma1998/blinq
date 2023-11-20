// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premade_message_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreMadeMessageResponseModelAdapter
    extends TypeAdapter<PreMadeMessageResponseModel> {
  @override
  final int typeId = 10;

  @override
  PreMadeMessageResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreMadeMessageResponseModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      message: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PreMadeMessageResponseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreMadeMessageResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreMadeMessageResponseModelImpl _$$PreMadeMessageResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PreMadeMessageResponseModelImpl(
      id: json['id'] as int?,
      title: json['title'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$PreMadeMessageResponseModelImplToJson(
        _$PreMadeMessageResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
    };
