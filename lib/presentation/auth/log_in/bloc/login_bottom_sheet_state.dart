// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';

part 'login_bottom_sheet_state.freezed.dart';

@freezed
class LoginBottomSheetState with _$LoginBottomSheetState{
  const factory LoginBottomSheetState ({
    @Default(Status.initial) Status status,
    Error? error,
    @Default(true) bool isCodeVisible,
  }) = _LoginBottomSheetState;
}
