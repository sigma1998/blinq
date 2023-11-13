// Dart imports:
import 'dart:async';

// Project imports:
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'language_event.dart';

part 'language_bloc.freezed.dart';

part 'language_state.dart';

enum ProfileLanguage {
  en,
  hu;

  String get code {
    switch (this) {
      case ProfileLanguage.en:
        return 'en';
      case ProfileLanguage.hu:
        return 'hu';
    }
  }

  String get name {
    switch (this) {
      case ProfileLanguage.en:
        return 'english'.tr();
      case ProfileLanguage.hu:
        return 'hungary'.tr();
    }
  }
}

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  //
  final ProfileRepository repository;

  LanguageBloc({required this.repository}) : super(const LanguageState()) {
    on<OnLanguageChanged>(_onLanguageChanged);
    on<Init>(_init);
  }

  FutureOr<void> _onLanguageChanged(
      OnLanguageChanged event, Emitter<LanguageState> emit) async {
    try {
      emit(state.copyWith(lang: event.lang));
      await repository.updateLanguage(event.lang.code);
      NavigationService.updateLocale(event.lang.code);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _init(Init event, Emitter<LanguageState> emit) {
    emit(state.copyWith(lang: event.lang));
  }
}
