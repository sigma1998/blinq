// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/premade_message_selector_sheet/premade_message_selector_sheet.dart';
import 'package:blinq/presentation/contacts/views/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'inform_close_ones_event.dart';

part 'inform_close_ones_state.dart';
part 'inform_close_ones_bloc.freezed.dart';

class InformCloseOnesBloc
    extends Bloc<InformCloseOnesEvent, InformCloseOnesState> {
  //
  final ContactsBloc contactsBloc;

  InformCloseOnesBloc({required this.contactsBloc})
      : super(const InformCloseOnesState()) {
    on<OnLoadContacts>(_onLoadContacts);
    on<OnSelectContact>(_onSelectContact);
  }

  void onChoosePremadeMessage() {
    final phoneNumbers =
    state.selectedContacts.map((e) => e.phoneNumber ?? '').toList();

    NavigationService.showBottomSheet(
      isScrollable: false,
      sheet: PremadeMessageSelectorSheet(
        phoneNumbers: phoneNumbers,
      ),
    );
  }

  void _onLoadContacts(
      OnLoadContacts event, Emitter<InformCloseOnesState> emit) {
    emit(
      state.copyWith(
        status: contactsBloc.state.status,
        contacts: contactsBloc.state.contacts?.results ?? [],
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
