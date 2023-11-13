// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premade_message_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PremadeMessageResponseModelAdapter
    extends TypeAdapter<PremadeMessageResponseModel> {
  @override
  final int typeId = 10;

  @override
  PremadeMessageResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PremadeMessageResponseModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      message: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PremadeMessageResponseModel obj) {
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
      other is PremadeMessageResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PremadeMessageResponseModelImpl _$$PremadeMessageResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PremadeMessageResponseModelImpl(
      id: json['id'] as int?,
      title: json['title'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$PremadeMessageResponseModelImplToJson(
        _$PremadeMessageResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
    };
