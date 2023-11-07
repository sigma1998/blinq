import 'language_bloc.dart';

sealed class LanguageEvent {}

class OnLanguageChanged extends LanguageEvent {
  final ProfileLanguage lang;

  OnLanguageChanged({required this.lang});
}

class Init extends LanguageEvent {
  final ProfileLanguage lang;

  Init({required this.lang});
}
