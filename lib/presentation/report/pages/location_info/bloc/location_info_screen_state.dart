import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part  'location_info_screen_state.freezed.dart';


@freezed
class LocationInfoScreenState with _$LocationInfoScreenState {
  const factory LocationInfoScreenState({
    @Default(Status.initial) Status status,
    Error? error,

  }) = _LocationInfoScreenState;
}
