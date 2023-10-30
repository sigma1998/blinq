

import 'package:blinq/data/model/send_email_response/send_email_response.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_screen_state.freezed.dart';

@freezed
class EmailScreenState with _$EmailScreenState{
  const factory EmailScreenState ({
    @Default(Status.initial) Status status,
    Error? error,
    SendEmailResponse? sendEmailResponse,
    @Default(false) bool changeEye,
}) = _EmailScreenState;
}