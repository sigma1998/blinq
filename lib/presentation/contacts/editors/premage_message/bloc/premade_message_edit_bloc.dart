// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/premade_message/request/premade_message_request_model.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/presentation/contacts/pages/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/presentation/contacts/pages/premade_messages/bloc/premade_messages_event.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'premade_message_edit_event.dart';

part 'premade_message_edit_state.dart';
part 'premade_message_edit_bloc.freezed.dart';

class PremadeMessageEditorBloc
    extends Bloc<PreMadeMessageEditorEvent, PreMadeMessageEditorState> {
  //
  final PreMadeMessagesBloc preMadeMessagesBloc;
  final PremadeMessagesRepository repository;

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final messageController = TextEditingController();

  PremadeMessageEditorBloc({
    required this.preMadeMessagesBloc,
    required this.repository,
  }) : super(const PreMadeMessageEditorState()) {
    on<OnAddPreMadeMessage>(_onAddPreMadeMessage);
    on<OnUpdatePreMadeMessage>(_onUpdatePreMadeMessage);
    on<OnDeletePreMadeMessage>(_onDeletePreMadeMessage);
  }

  void onNavigateBack() =>
      NavigationService.contactsNavigatorKey.currentState?.pop();

  void initializeFields(int id) {
    final premadeMessage = preMadeMessagesBloc.state.premadeMessages?.results
        ?.firstWhere((element) => element.id == id);

    titleController.text = premadeMessage?.title ?? '';
    messageController.text = premadeMessage?.message ?? '';
  }

  bool validateForm() => formKey.currentState!.validate();

  //
  FutureOr<void> _onAddPreMadeMessage(OnAddPreMadeMessage event,
      Emitter<PreMadeMessageEditorState> emit) async {
    try {
      final premadeMessage = PreMadeMessageRequestModel(
        title: titleController.text,
        message: messageController.text,
      );

      emit(state.copyWith(status: Status.loading));
      await repository.add(premadeMessage);
      emit(state.copyWith(status: Status.success));
      onNavigateBack();
      preMadeMessagesBloc.add(OnFetchPreMadeMessages());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onUpdatePreMadeMessage(OnUpdatePreMadeMessage event,
      Emitter<PreMadeMessageEditorState> emit) async {
    try {
      final premadeMessage = PreMadeMessageRequestModel(
        title: titleController.text,
        message: messageController.text,
      );

      emit(state.copyWith(status: Status.loading));
      await repository.update(id: event.id, premadeMessage: premadeMessage);
      emit(state.copyWith(status: Status.success));
      onNavigateBack();
      preMadeMessagesBloc.add(OnFetchPreMadeMessages());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onDeletePreMadeMessage(OnDeletePreMadeMessage event,
      Emitter<PreMadeMessageEditorState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.delete(event.id);
      emit(state.copyWith(status: Status.success));
      onNavigateBack();
      preMadeMessagesBloc.add(OnFetchPreMadeMessages());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
