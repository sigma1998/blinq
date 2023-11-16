import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';

sealed class PremadeMessageSelectorEvent {}

class OnLoadPremadeMessages extends PremadeMessageSelectorEvent {}

class OnSelectPremadeMessage extends PremadeMessageSelectorEvent {
  final PremadeMessageResponseModel message;

  OnSelectPremadeMessage({required this.message});
}

class OnSendPremadeMessage extends PremadeMessageSelectorEvent {
  final List<String> recepients;

  OnSendPremadeMessage({required this.recepients});
}
