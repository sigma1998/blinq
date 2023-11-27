import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logger_cubit.freezed.dart';
part 'logger_state.dart';

class LoggerCubit extends Cubit<LoggerState> {
  //
  LoggerCubit() : super(LoggerState());

  void logMessage(String message) {
    List<String> previousMessages = [...state.logTexts];

    if (previousMessages.contains(message) == true) return;

    previousMessages.add(message);
    emit(state.copyWith(
      logTexts: [...previousMessages],
      numberOfMessages: previousMessages.length,
    ));
  }
}
