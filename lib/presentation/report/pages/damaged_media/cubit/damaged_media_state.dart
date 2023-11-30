part of 'damaged_media_cubit.dart';

@freezed
class DamagedMediaState with _$DamagedMediaState {
  const factory DamagedMediaState({
    @Default(Status.initial) Status status,
    @Default([]) List<File> files,
    @Default([]) List<int> uploadedFilesId,
    Error? error,
  }) = _DamagedMediaState;
}
