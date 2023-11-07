// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_response_model.freezed.dart';
part 'car_response_model.g.dart';

@freezed
class CarResponseModel with _$CarResponseModel {
  //
  const factory CarResponseModel({
    @JsonKey(name: 'car_id') int? carId,
    @JsonKey(name: 'color_id') int? colorId,
    @JsonKey(name: 'model_series') String? modelSeries,
    @JsonKey(name: 'make_type') String? makeType,
    @JsonKey(name: 'engine_number') String? engineNumber,
    @JsonKey(name: 'country_of_registration') String? countryOfRegistration,
    @JsonKey(name: 'trailer_registration_number')
    String? trailerRegistrationNumber,
    @JsonKey(name: 'trailer_country_of_registration')
    String? trailerCountryOfRegistration,
    @JsonKey(name: 'car') String? car,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'brand_id') int? brandId,
    @JsonKey(name: 'brand') String? brand,
  }) = _CarResponseModel;

  factory CarResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CarResponseModelFromJson(json);
}
