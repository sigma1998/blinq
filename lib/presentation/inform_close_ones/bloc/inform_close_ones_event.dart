// Project imports:
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:blinq/data/model/contact/contact_response_dto.dart';

sealed class InformCloseOnesEvent {}

class OnLoadContacts extends InformCloseOnesEvent {}

class OnContactsLoaded extends InformCloseOnesEvent {
  final ContactResponseDto? contacts;

  OnContactsLoaded({required this.contacts});
}

class OnSelectContact extends InformCloseOnesEvent {
  final ContactResponseModel contact;

  OnSelectContact({required this.contact});
}
