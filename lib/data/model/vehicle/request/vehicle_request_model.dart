// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';

part 'vehicle_request_model.freezed.dart';
part 'vehicle_request_model.g.dart';

@freezed
class UserVehicleRequestModel with _$UserVehicleRequestModel {
  //
  const factory UserVehicleRequestModel({
    @JsonKey(name: 'car_id') int? carId,
    @JsonKey(name: 'color_id') int? colorId,
    @JsonKey(name: 'model_series') List<String>? modelSeries,
    @JsonKey(name: 'make_type') String? makeType,
    @JsonKey(name: 'engine_number') String? engineNumber,
    @JsonKey(name: 'country_of_registration') String? countryOfRegistration,
    @JsonKey(name: 'trailer_country_of_registration') String? trailerCountryOfRegistration,
    @JsonKey(name: 'vehicle_type') VehicleType? vehicleType,
    @JsonKey(name: 'traveled_km') String? traveledKm,
    @JsonKey(name: 'next_technical') String? nextTechnical,
    @JsonKey(name: 'oil_replacement') String? oilReplacement,
    @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
    @JsonKey(name: 'custom_brand') String? customBrand,
    @JsonKey(name: 'custom_car') String? customCar,
    @JsonKey(name: 'custom_car_colour') String? customCarColour,
    int? car,
    int? color,

  }) = _UserVehicleRequestModel;

  factory UserVehicleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserVehicleRequestModelFromJson(json);
}
