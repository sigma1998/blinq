// Package imports:
import 'dart:async';

import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'second_driver_event.dart';

part 'second_driver_state.dart';
part 'second_driver_bloc.freezed.dart';

class SecondDriverBloc extends Bloc<SecondDriverEvent, SecondDriverState> {
  //
  final AccidentRepository repository;

  SecondDriverBloc({required this.repository})
      : super(const SecondDriverState()) {
    on<OnFetchSecondDriver>(_onFetchSecondDriver);
  }

  FutureOr<void> _onFetchSecondDriver(
      OnFetchSecondDriver event, Emitter<SecondDriverState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final data = await repository.fetchUserById(event.id);
      emit(state.copyWith(secondDriver: data, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
