// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_event.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/data/model/premade_message/request/premade_message_request_model.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'premade_message_editor_event.dart';

part 'premade_message_editor_state.dart';
part 'premade_message_editor_bloc.freezed.dart';

class PremadeMessageEditorBloc
    extends Bloc<PremadeMessageEditorEvent, PremadeMessageEditorState> {
  //
  final PremadeMessagesBloc premadeMessagesBloc;
  final PremadeMessagesRepository repository;

  final titleController = TextEditingController();
  final messageController = TextEditingController();

  PremadeMessageEditorBloc({
    required this.premadeMessagesBloc,
    required this.repository,
  }) : super(const PremadeMessageEditorState()) {
    on<OnAddPremadeMessage>(_onAddContact);
    on<OnUpdatePremadeMessage>(_onUpdateContact);
    on<OnDeletePremadeMessage>(_onDeleteContact);
  }

  void onNavigateBack() {
    NavigationService.contactsNavigatorKey.currentState?.pop();
  }

  void initializeFields(int id) {
    final premadeMessage = premadeMessagesBloc.state.premadeMessages?.results
        ?.firstWhere((element) => element.id == id);

    titleController.text = premadeMessage?.title ?? '';
    messageController.text = premadeMessage?.message ?? '';
  }

  //
  FutureOr<void> _onAddContact(OnAddPremadeMessage event,
      Emitter<PremadeMessageEditorState> emit) async {
    try {
      final premadeMessage = PremadeMessageRequestModel(
        title: titleController.text,
        message: messageController.text,
      );

      emit(state.copyWith(status: Status.loading));
      await repository.add(premadeMessage);
      emit(state.copyWith(status: Status.success));
      onNavigateBack();
      premadeMessagesBloc.add(OnFetchPremadeMessages());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onUpdateContact(OnUpdatePremadeMessage event,
      Emitter<PremadeMessageEditorState> emit) async {
    try {
      final premadeMessage = PremadeMessageRequestModel(
        title: titleController.text,
        message: messageController.text,
      );

      emit(state.copyWith(status: Status.loading));
      await repository.update(id: event.id, premadeMessage: premadeMessage);
      emit(state.copyWith(status: Status.success));
      onNavigateBack();
      premadeMessagesBloc.add(OnFetchPremadeMessages());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onDeleteContact(OnDeletePremadeMessage event,
      Emitter<PremadeMessageEditorState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.delete(event.id);
      emit(state.copyWith(status: Status.success));
      onNavigateBack();
      premadeMessagesBloc.add(OnFetchPremadeMessages());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
