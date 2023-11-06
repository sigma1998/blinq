// Dart imports:
import 'dart:async';
import 'dart:ui';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'language_event.dart';

part 'language_state.dart';
part 'language_bloc.freezed.dart';

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
  }

  FutureOr<void> _onLanguageChanged(
      OnLanguageChanged event, Emitter<LanguageState> emit) async {
    try {
      emit(const LanguageState(status: Status.loading));
      event.context.setLocale(Locale(event.lang.code));
      await repository.updateLanguage(event.lang.code);
      emit(LanguageState(lang: event.lang, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
      NavigationService.showErrorToast(e.toString());
    }
  }
}
