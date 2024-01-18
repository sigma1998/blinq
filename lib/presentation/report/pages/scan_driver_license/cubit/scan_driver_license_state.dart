part of 'scan_driver_license_cubit.dart';

@freezed
class ScanDriverLicenseState with _$ScanDriverLicenseState {
  const factory ScanDriverLicenseState({
    @Default(Status.initial) Status status,
    DriverLicenseDto? driverLicenseDto,
    @Default('') String scannedText,
    @Default(false) bool controllerIsInitialized,
    File? file,
    Error? error,
  }) = _ScanDriverLicenseState;
}
