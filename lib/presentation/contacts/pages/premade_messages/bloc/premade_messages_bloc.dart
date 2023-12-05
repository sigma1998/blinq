// Dart imports:
import 'dart:async';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/editors/premage_message/premade_message_edit_screen.dart';
import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'premade_messages_event.dart';

part 'premade_messages_state.dart';
part 'premade_messages_bloc.freezed.dart';

class PreMadeMessagesBloc
    extends Bloc<PreMadeMessagesEvent, PreMadeMessagesState> {
  //
  final PremadeMessagesRepository repository;

  PreMadeMessagesBloc({required this.repository})
      : super(const PreMadeMessagesState()) {
    on<OnFetchPreMadeMessages>(_onFetchPremadeMessages);
  }

  FutureOr<void> _onFetchPremadeMessages(
      OnFetchPreMadeMessages event, Emitter<PreMadeMessagesState> emit) async {
    try {
      emit(const PreMadeMessagesState(status: Status.loading));
      final data = await repository.fetchList();
      emit(PreMadeMessagesState(premadeMessages: data, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  void onEditPressed({int? id}) async {
    NavigationService.pushNamed(
      arguments: id,
      routeName: PremadeMessageEditScreen.route,
      nestedKey: NavigationService.contactsNavigatorKey,
    );
  }
}
