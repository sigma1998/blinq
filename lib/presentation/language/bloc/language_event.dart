import 'package:flutter/material.dart';

import 'language_bloc.dart';

sealed class LanguageEvent {}

class OnLanguageChanged extends LanguageEvent {
  final BuildContext context;
  final ProfileLanguage lang;

  OnLanguageChanged({required this.lang, required this.context});
}
