// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'user_info_event.dart';

class ProfileUserInfoBloc
    extends Bloc<ProfileUserInfoEvent, GenericBlocState<bool>> {
  ProfileUserInfoBloc() : super(GenericBlocState.success(false)) {
    on<OnEditPressed>(_editPressed);
  }

  FutureOr<void> _editPressed(
      OnEditPressed event, Emitter<GenericBlocState<bool>> emit) {
    emit(GenericBlocState.success(event.isEdit));
  }
}
