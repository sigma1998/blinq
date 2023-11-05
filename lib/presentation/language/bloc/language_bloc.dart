// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';
part 'language_bloc.freezed.dart';

enum ProfileLanguage {
  en,
  hu;

  String get name {
    switch (this) {
      case ProfileLanguage.en:
        return 'English';
      case ProfileLanguage.hu:
        return 'Hungarian';
    }
  }
}

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  //
  final ProfileBloc profileBloc;

  LanguageBloc({required this.profileBloc}) : super(const _Initial()) {
    on<LanguageEvent>((event, emit) {});
  }
}
