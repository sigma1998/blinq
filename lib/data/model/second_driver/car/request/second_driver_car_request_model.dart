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
    int? car,
    @JsonKey(name: 'color') int? color,
    @JsonKey(name: 'model_series') String? modelSeries,
    String? mark,
    @JsonKey(name: 'make_type') String? makeType,
    @JsonKey(name: 'vehicle_type') VehicleType? vehicleType,
    @JsonKey(name: 'engine_number') String? engineNumber,
    @JsonKey(name: 'country_of_registration') String? countryOfRegistration,
    @JsonKey(name: 'trailer_registration_number')
    String? trailerRegistrationNumber,
    @JsonKey(name: 'trailer_country_of_registration')
    String? trailerCountryOfRegistration,
  }) = _SecondDriverCarRequestModel;

  factory SecondDriverCarRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SecondDriverCarRequestModelFromJson(json);
}
