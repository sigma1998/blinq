import 'language_bloc.dart';

sealed class LanguageEvent {}

class OnLanguageChanged extends LanguageEvent {
  final ProfileLanguage lang;

  OnLanguageChanged(this.lang);
}
