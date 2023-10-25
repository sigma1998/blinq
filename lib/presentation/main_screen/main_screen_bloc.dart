import 'dart:async';

import 'package:blinq/presentation/main_screen/main_screen_event.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, GenericBlocState<int>> {
  MainScreenBloc() : super(GenericBlocState.success(0)) {
    on<OnItemPressed>(_onItemPressed);
  }

  FutureOr<void> _onItemPressed(
      OnItemPressed event, Emitter<GenericBlocState<int>> emit) {
    emit(GenericBlocState.success(event.newIndex));
  }
}
