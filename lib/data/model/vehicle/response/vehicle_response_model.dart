// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_response_model.freezed.dart';
part 'vehicle_response_model.g.dart';

@freezed
class UserVehicleResponseModel with _$UserVehicleResponseModel {
  //
  const factory UserVehicleResponseModel({
    @JsonKey(name: 'traveled_km') int? traveledKm,
    @JsonKey(name: 'next_technical') int? nextTechnical,
    @JsonKey(name: 'next_technical_updated_date')
    String? nextTechnicalUpdatedDate,
    @JsonKey(name: 'oil_replacement') int? oilReplacement,
    @JsonKey(name: 'oil_replacement_updated_date')
    String? oilReplacementUpdatedDate,
    @JsonKey(name: 'battery_replacement_date') String? batteryReplacementDate,
    @JsonKey(name: 'battery_replacement') int? batteryReplacement,
    @JsonKey(name: 'battery_replacement_updated_date')
    String? batteryReplacementUpdatedDate,
  }) = _UserVehicleResponseModel;

  factory UserVehicleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserVehicleResponseModelFromJson(json);
}
