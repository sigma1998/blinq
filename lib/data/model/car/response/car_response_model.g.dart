// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarResponseModelAdapter extends TypeAdapter<CarResponseModel> {
  @override
  final int typeId = 4;

  @override
  CarResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarResponseModel(
      carId: fields[0] as int?,
      colorId: fields[1] as int?,
      modelSeries: fields[2] as String?,
      makeType: fields[3] as String?,
      engineNumber: fields[4] as String?,
      countryOfRegistration: fields[5] as String?,
      trailerRegistrationNumber: fields[6] as String?,
      trailerCountryOfRegistration: fields[7] as String?,
      car: fields[8] as String?,
      color: fields[9] as String?,
      brandId: fields[10] as int?,
      brand: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CarResponseModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.carId)
      ..writeByte(1)
      ..write(obj.colorId)
      ..writeByte(2)
      ..write(obj.modelSeries)
      ..writeByte(3)
      ..write(obj.makeType)
      ..writeByte(4)
      ..write(obj.engineNumber)
      ..writeByte(5)
      ..write(obj.countryOfRegistration)
      ..writeByte(6)
      ..write(obj.trailerRegistrationNumber)
      ..writeByte(7)
      ..write(obj.trailerCountryOfRegistration)
      ..writeByte(8)
      ..write(obj.car)
      ..writeByte(9)
      ..write(obj.color)
      ..writeByte(10)
      ..write(obj.brandId)
      ..writeByte(11)
      ..write(obj.brand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarResponseModelImpl _$$CarResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CarResponseModelImpl(
      carId: json['car_id'] as int?,
      colorId: json['color_id'] as int?,
      modelSeries: json['model_series'] as String?,
      makeType: json['make_type'] as String?,
      engineNumber: json['engine_number'] as String?,
      countryOfRegistration: json['country_of_registration'] as String?,
      trailerRegistrationNumber: json['trailer_registration_number'] as String?,
      trailerCountryOfRegistration:
          json['trailer_country_of_registration'] as String?,
      car: json['car'] as String?,
      color: json['color'] as String?,
      brandId: json['brand_id'] as int?,
      brand: json['brand'] as String?,
    );

Map<String, dynamic> _$$CarResponseModelImplToJson(
        _$CarResponseModelImpl instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'color_id': instance.colorId,
      'model_series': instance.modelSeries,
      'make_type': instance.makeType,
      'engine_number': instance.engineNumber,
      'country_of_registration': instance.countryOfRegistration,
      'trailer_registration_number': instance.trailerRegistrationNumber,
      'trailer_country_of_registration': instance.trailerCountryOfRegistration,
      'car': instance.car,
      'color': instance.color,
      'brand_id': instance.brandId,
      'brand': instance.brand,
    };
