// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_request_model.freezed.dart';
part 'car_request_model.g.dart';

@freezed
class CarRequestModel with _$CarRequestModel {
  //
  const factory CarRequestModel({
    @JsonKey(name: 'car_id') int? carId,
    @JsonKey(name: 'color_id') int? colorId,
    @JsonKey(name: 'model_series') String? modelSeries,
    @JsonKey(name: 'make_type') String? makeType,
    @JsonKey(name: 'vehicle_type') VehicleType? vehicleType,
    @JsonKey(name: 'engine_number') String? engineNumber,
    @JsonKey(name: 'country_of_registration') String? countryOfRegistration,
    @JsonKey(name: 'brand_id') int? brandId,
    @JsonKey(name: 'trailer_registration_number')
    String? trailerRegistrationNumber,
    @JsonKey(name: 'trailer_country_of_registration')
    String? trailerCountryOfRegistration,
    String? car,
    String? color,
    String? brand,
  }) = _CarRequestModel;

  factory CarRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CarRequestModelFromJson(json);
}
