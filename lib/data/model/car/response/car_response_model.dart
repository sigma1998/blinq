// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'car_response_model.freezed.dart';
part 'car_response_model.g.dart';

@freezed
@HiveType(typeId: 4)
class CarResponseModel with _$CarResponseModel {
  //
  const factory CarResponseModel({
    @HiveField(0) @JsonKey(name: 'car_id') int? carId,
    @HiveField(1) @JsonKey(name: 'color_id') int? colorId,
    @HiveField(2) @JsonKey(name: 'model_series') String? modelSeries,
    @HiveField(3) @JsonKey(name: 'make_type') String? makeType,
    @HiveField(4) @JsonKey(name: 'engine_number') String? engineNumber,
    @HiveField(5)
    @JsonKey(name: 'country_of_registration')
    String? countryOfRegistration,
    @HiveField(6)
    @JsonKey(name: 'trailer_registration_number')
    String? trailerRegistrationNumber,
    @HiveField(7)
    @JsonKey(name: 'trailer_country_of_registration')
    String? trailerCountryOfRegistration,
    @HiveField(8) @JsonKey(name: 'car') String? car,
    @HiveField(9) @JsonKey(name: 'color') String? color,
    @HiveField(10) @JsonKey(name: 'brand_id') int? brandId,
    @HiveField(11) @JsonKey(name: 'brand') String? brand,
  }) = _CarResponseModel;

  factory CarResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CarResponseModelFromJson(json);
}
