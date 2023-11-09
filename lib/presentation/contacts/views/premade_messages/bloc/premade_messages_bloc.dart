// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

import 'premade_messages_event.dart';

part 'premade_messages_state.dart';
part 'premade_messages_bloc.freezed.dart';

class PremadeMessagesBloc extends Bloc<ContactsEvent, PremadeMessagesState> {
  //
  final PremadeMessagesRepository repository;

  PremadeMessagesBloc({required this.repository})
      : super(const PremadeMessagesState()) {
    on<OnFetchPremadeMessages>(_onFetchPremadeMessages);
  }

  FutureOr<void> _onFetchPremadeMessages(
      OnFetchPremadeMessages event, Emitter<PremadeMessagesState> emit) async {
    try {
      emit(const PremadeMessagesState(status: Status.loading));
      final data = await repository.fetchList();
      repository.setPremadeMessages(data);
      emit(PremadeMessagesState(premadeMessages: data, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
