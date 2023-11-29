part of 'premade_message_selector_bloc.dart';

@freezed
class PremadeMessageSelectorState with _$PremadeMessageSelectorState {
  const factory PremadeMessageSelectorState({
    @Default(Status.initial) Status status,
    @Default([]) List<PreMadeMessageResponseModel> premadeMessages,
    PreMadeMessageResponseModel? selectedMessage,
    Error? error,
  }) = _PremadeMessageSelectorState;
}
