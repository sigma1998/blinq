part of 'speech_to_text_cubit.dart';

@freezed
class SpeechToTextState with _$SpeechToTextState {
  const factory SpeechToTextState({
    @Default(Status.initial) Status status,
    @Default(false) bool isRecording,
    Error? error,
  }) = _SpeechToTextState;
}
