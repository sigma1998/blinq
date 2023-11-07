// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_request_model.freezed.dart';
part 'vehicle_request_model.g.dart';

@freezed
class UserVehicleRequestModel with _$UserVehicleRequestModel {
  //
  const factory UserVehicleRequestModel({
    @JsonKey(name: 'traveled_km') String? traveledKm,
    @JsonKey(name: 'next_technical') String? nextTechnical,
    @JsonKey(name: 'oil_replacement') String? oilReplacement,
    @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
  }) = _UserVehicleRequestModel;

  factory UserVehicleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserVehicleRequestModelFromJson(json);
}
