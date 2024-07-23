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
    @JsonKey(name: 'vehicle_type') String? vehicleType,
    @JsonKey(name: 'traveled_km') int? traveledKm,
    @JsonKey(name: 'next_technical') int? nextTechnical,
    @JsonKey(name: 'next_technical_updated_date') DateTime? nextTechnicalUpdatedDate,
    @JsonKey(name: 'oil_replacement') int? oilReplacement,
    @JsonKey(name: 'oil_replacement_updated_date') DateTime? oilReplacementUpdatedDate,
    @JsonKey(name: 'battery_replacement_date') DateTime? batteryReplacementDate,
    @JsonKey(name: 'battery_replacement') int? batterReplacement,
    @JsonKey(name: 'battery_replacement_updated_date') DateTime? batteryReplacementUpdatedDate,
    @JsonKey(name: 'custom_brand') String? customBrand,
    @JsonKey(name: 'custom_car') String? customCar,
    @JsonKey(name: 'custom_car_colour') String? customCarColour,
    @JsonKey(name: 'plate_number') String? plateNumber,
    String? car,
    String? color,
    String? brand,
  }) = _CarResponseModel;

  factory CarResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CarResponseModelFromJson(json);
}
