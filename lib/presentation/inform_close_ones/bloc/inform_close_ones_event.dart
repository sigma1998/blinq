import 'package:blinq/data/model/contact/response/contact_response_model.dart';

sealed class InformCloseOnesEvent {}

class OnLoadContacts extends InformCloseOnesEvent {}

class OnSelectContact extends InformCloseOnesEvent {
  final ContactResponseModel contact;

  OnSelectContact({required this.contact});
}
