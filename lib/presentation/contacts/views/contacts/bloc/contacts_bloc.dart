// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'contacts_event.dart';

part 'contacts_state.dart';
part 'contacts_bloc.freezed.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  //
  final ContactsRepository repository;

  ContactsBloc({required this.repository}) : super(const ContactsState()) {
    on<OnFetchContacts>(_onFetchContacts);
  }

  FutureOr<void> _onFetchContacts(
      OnFetchContacts event, Emitter<ContactsState> emit) async {
    try {
      emit(const ContactsState(status: Status.loading));
      final data = await repository.fetchList();
      repository.setContacts(data);
      emit(ContactsState(contacts: data, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
