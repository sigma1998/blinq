// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'vehicle_response_model.freezed.dart';
part 'vehicle_response_model.g.dart';

@freezed
@HiveType(typeId: 7)
class UserVehicleResponseModel with _$UserVehicleResponseModel {
  //
  const factory UserVehicleResponseModel({
    @HiveField(0) @JsonKey(name: 'traveled_km') int? traveledKm,
    @HiveField(1)
    @HiveField(2)
    @JsonKey(name: 'next_technical')
    int? nextTechnical,
    @HiveField(3)
    @JsonKey(name: 'next_technical_updated_date')
    String? nextTechnicalUpdatedDate,
    @HiveField(4) @JsonKey(name: 'oil_replacement') int? oilReplacement,
    @HiveField(5)
    @JsonKey(name: 'oil_replacement_updated_date')
    String? oilReplacementUpdatedDate,
    @HiveField(6)
    @JsonKey(name: 'battery_replacement_date')
    String? batteryReplacementDate,
    @HiveField(7) @JsonKey(name: 'battery_replacement') int? batteryReplacement,
    @HiveField(8)
    @JsonKey(name: 'battery_replacement_updated_date')
    String? batteryReplacementUpdatedDate,
  }) = _UserVehicleResponseModel;

  factory UserVehicleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserVehicleResponseModelFromJson(json);
}
