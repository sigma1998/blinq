// Package imports:

// Project imports:
import 'dart:async';

import 'package:blinq/presentation/premade_message_selector_sheet/premade_message_selector_sheet.dart';
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blinq/utils/url_helper.dart';
import 'inform_close_ones_event.dart';

part 'inform_close_ones_bloc.freezed.dart';
part 'inform_close_ones_state.dart';

class InformCloseOnesBloc
    extends Bloc<InformCloseOnesEvent, InformCloseOnesState> {
  //
  final ContactsBloc contactsBloc;

  InformCloseOnesBloc({required this.contactsBloc})
      : super(const InformCloseOnesState()) {
    on<OnLoadContacts>(_onLoadContacts);
    on<OnContactsLoaded>(_onPreMadeMessagesLoaded);
    on<OnSelectContact>(_onSelectContact);

    contactsBloc.stream.listen((event) {
      if (event.contacts != null) {
        add(OnContactsLoaded(contacts: event.contacts));
      }
    });
  }

  void onChoosePremadeMessage() async {
    final phoneNumbers =
        state.selectedContacts.map((e) => e.phoneNumber ?? '').toList();

    final res = await NavigationService.showBottomSheet(
      isScrollable: false,
      sheet: PremadeMessageSelectorSheet(
        phoneNumbers: phoneNumbers,
      ),
    );
    if (res is bool) {
      if (res) {
        NavigationService.back();
      }
    }
  }

  void onPhoneCall(String phoneNumber) => MyUrlLauncher.call(phoneNumber);

  void _onLoadContacts(
      OnLoadContacts event, Emitter<InformCloseOnesState> emit) {
    emit(
      state.copyWith(
        status: contactsBloc.state.status,
        contacts: contactsBloc.state.contacts?.results ?? [],
      ),
    );
  }

  FutureOr<void> _onPreMadeMessagesLoaded(
      OnContactsLoaded event, Emitter<InformCloseOnesState> emit) {
    emit(
      state.copyWith(
        status: contactsBloc.state.status,
        contacts: event.contacts?.results ?? [],
      ),
    );
  }

  void _onSelectContact(
      OnSelectContact event, Emitter<InformCloseOnesState> emit) {
    final list = [...state.selectedContacts];
    if (list.contains(event.contact)) {
      list.remove(event.contact);
    } else {
      list.add(event.contact);
    }
    emit(state.copyWith(selectedContacts: list));
  }
}
