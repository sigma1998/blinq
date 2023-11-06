// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_request_model.freezed.dart';
part 'vehicle_request_model.g.dart';

@freezed
class VehicleRequestModel with _$VehicleRequestModel {
  //
  const factory VehicleRequestModel({
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
  }) = _VehicleRequestModel;

  factory VehicleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleRequestModelFromJson(json);
}
