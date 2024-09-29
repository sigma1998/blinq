// Project imports:
import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';

sealed class PreMadeMessageSelectorEvent {}

class OnLoadPreMadeMessages extends PreMadeMessageSelectorEvent {}

class OnPreMadeMessagesLoaded extends PreMadeMessageSelectorEvent {
  final PreMadeMessageResponseDto? premadeMessages;

  OnPreMadeMessagesLoaded({required this.premadeMessages});
}

class OnSelectPreMadeMessage extends PreMadeMessageSelectorEvent {
  final PreMadeMessageResponseModel? message;

  OnSelectPreMadeMessage({required this.message});
}
