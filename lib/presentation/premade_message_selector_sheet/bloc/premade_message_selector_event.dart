import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';

sealed class PremadeMessageSelectorEvent {}

class OnLoadPremadeMessages extends PremadeMessageSelectorEvent {}

class OnSelectPremadeMessage extends PremadeMessageSelectorEvent {
  final PreMadeMessageResponseModel message;

  OnSelectPremadeMessage({required this.message});
}

class OnContactsLoaded extends PremadeMessageSelectorEvent {
  PreMadeMessageResponseDto? premadeMessages;

  OnContactsLoaded({required this.premadeMessages});
}
