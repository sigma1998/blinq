part of 'language_bloc.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState({
    @Default(Status.initial) Status status,
    @Default(ProfileLanguage.en) ProfileLanguage? lang,
    Error? error,
  }) = _LanguageState;
}
