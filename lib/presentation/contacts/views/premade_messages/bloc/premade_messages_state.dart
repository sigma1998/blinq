part of 'premade_messages_bloc.dart';

@freezed
class PremadeMessagesState with _$PremadeMessagesState {
  //
  const factory PremadeMessagesState({
    @Default(Status.initial) Status status,
    PremadeMessageResponseDto? premadeMessages,
    Error? error,
  }) = _PremadeMessagesState;
}
