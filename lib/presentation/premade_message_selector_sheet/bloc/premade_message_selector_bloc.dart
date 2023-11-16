// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'premade_message_selector_event.dart';

part 'premade_message_selector_state.dart';
part 'premade_message_selector_bloc.freezed.dart';

class PremadeMessageSelectorBloc
    extends Bloc<PremadeMessageSelectorEvent, PremadeMessageSelectorState> {
  //
  final PremadeMessagesBloc premadeMessagesBloc;

  PremadeMessageSelectorBloc({
    required this.premadeMessagesBloc,
  }) : super(const PremadeMessageSelectorState()) {
    on<OnLoadPremadeMessages>(_onLoadPremadeMessages);
    on<OnSelectPremadeMessage>(_onSelectPremadeMessage);
  }

  void _onLoadPremadeMessages(
      OnLoadPremadeMessages event, Emitter<PremadeMessageSelectorState> emit) {
    emit(
      state.copyWith(
        status: Status.initial,
        premadeMessages:
            premadeMessagesBloc.state.premadeMessages?.results ?? [],
      ),
    );
  }

  void _onSelectPremadeMessage(
      OnSelectPremadeMessage event, Emitter<PremadeMessageSelectorState> emit) {
    emit(state.copyWith(
      selectedMessage: event.message,
    ));
  }
}
