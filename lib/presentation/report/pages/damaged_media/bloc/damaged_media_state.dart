part of 'damaged_media_bloc.dart';

@freezed
class DamagedMediaState with _$DamagedMediaState {
  const factory DamagedMediaState({
    @Default(Status.initial) Status status,
    @Default([]) List<File> files,
    Error? error,
  }) = _DamagedMediaState;
}
