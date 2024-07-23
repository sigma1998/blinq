// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';

part 'second_driver_car_request_model.freezed.dart';
part 'second_driver_car_request_model.g.dart';

@freezed
class SecondDriverCarRequestModel with _$SecondDriverCarRequestModel {
  //
  const factory SecondDriverCarRequestModel({
    @JsonKey(name: 'car_id') int? carId,
    @JsonKey(name: 'color_id') int? colorId,
    @JsonKey(name: 'model_series') List<String>? modelSeries,
    @JsonKey(name: 'make_type') String? makeType,
    @JsonKey(name: 'engine_number') String? engineNumber,
    @JsonKey(name: 'country_of_registration') String? countryOfRegistration,
    @JsonKey(name: 'trailer_country_of_registration') String? trailerCountryOfRegistration,
    @JsonKey(name: 'trailer_registration_number') String? trailerRegistrationNumber,
    @JsonKey(name: 'vehicle_type') String? vehicleType,
    @JsonKey(name: 'traveled_km') String? traveledKm,
    @JsonKey(name: 'next_technical') String? nextTechnical,
    @JsonKey(name: 'oil_replacement') String? oilReplacement,
    @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
    @JsonKey(name: 'custom_brand') String? customBrand,
    @JsonKey(name: 'custom_car') String? customCar,
    @JsonKey(name: 'custom_car_colour') String? customCarColour,
    @JsonKey(name: 'plate_number') String? plateNumber,
    int? car,
    int? color,
    String? brand,
  }) = _SecondDriverCarRequestModel;

  factory SecondDriverCarRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SecondDriverCarRequestModelFromJson(json);
}
