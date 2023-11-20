part of 'premade_messages_bloc.dart';

@freezed
class PreMadeMessagesState with _$PreMadeMessagesState {
  //
  const factory PreMadeMessagesState({
    @Default(Status.initial) Status status,
    PreMadeMessageResponseDto? premadeMessages,
    Error? error,
  }) = _PremadeMessagesState;
}
