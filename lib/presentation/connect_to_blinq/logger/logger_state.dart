part of 'logger_cubit.dart';

@freezed
class LoggerState with _$LoggerState {
  //
  factory LoggerState({
    @Default([]) List<String> logTexts,
    @Default(0) int numberOfMessages,
  }) = _LoggerState;
}
