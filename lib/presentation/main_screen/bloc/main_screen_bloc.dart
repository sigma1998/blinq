// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'main_screen_event.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, GenericBlocState<int>> {
  MainScreenBloc() : super(GenericBlocState.success(0)) {
    on<OnItemPressed>(_onItemPressed);
  }

  FutureOr<void> _onItemPressed(
      OnItemPressed event, Emitter<GenericBlocState<int>> emit) {
    emit(GenericBlocState.success(event.newIndex));
  }

  bool onWillPop({bool clearAll = false}) {
    if (state.data == 0) {
      if (NavigationService.homeNavigatorKey.currentState?.canPop() ?? false) {
        if (clearAll) {
          NavigationService.homeNavigatorKey.currentState
              ?.popUntil((route) => false);
        } else {
          NavigationService.homeNavigatorKey.currentState?.pop();
        }
        return false;
      }
    } else if (state.data == 1) {
      if (NavigationService.contactsNavigatorKey.currentState?.canPop() ??
          false) {
        if (clearAll) {
          NavigationService.contactsNavigatorKey.currentState
              ?.popUntil((route) => false);
        } else {
          NavigationService.contactsNavigatorKey.currentState?.pop();
        }
        return false;
      }
    }
    return true;
  }
}
