import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_model.freezed.dart';
part 'license_model.g.dart';

@freezed
class LicenseModel with _$LicenseModel {
  const factory LicenseModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'driver_license') String? driverLicense,
  }) = _LicenseModel;

  factory LicenseModel.fromJson(Map<String, dynamic> json) => _$LicenseModelFromJson(json);
}