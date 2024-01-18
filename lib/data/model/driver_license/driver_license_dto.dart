// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_license_dto.freezed.dart';
part 'driver_license_dto.g.dart';

@freezed
class DriverLicenseDto with _$DriverLicenseDto {
  //
  const factory DriverLicenseDto({
    required String firstName,
    required String lastName,
    required DateTime? dateOfBirth,
    required DateTime? issueDate,
    required DateTime? expirationDate,
    required String licenseNumber,
    required String licenseType,
  }) = _DriverLicenseDto;

  factory DriverLicenseDto.fromJson(Map<String, dynamic> json) =>
      _$DriverLicenseDtoFromJson(json);
}
