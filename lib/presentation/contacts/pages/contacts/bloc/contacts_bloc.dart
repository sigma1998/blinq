// Dart imports:
import 'dart:async';

// Package imports:
import 'package:blinq/utils/url_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/editors/contact/contact_edit_screen.dart';
import 'package:blinq/data/model/contact/contact_response_dto.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
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
      emit(state.copyWith(status: Status.loading));
      final data = await repository.fetchList();
      emit(state.copyWith(contacts: data, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  void onEditPressed({int? id}) async {
    NavigationService.pushNamed(
      arguments: id,
      routeName: ContactEditScreen.route,
      nestedKey: NavigationService.contactsNavigatorKey,
    );
  }

  void onPhoneCall(String phoneNumber) => MyUrlLauncher.call(phoneNumber);

  void onMessage(String phoneNumber) => MyUrlLauncher.message(phoneNumber);
}
