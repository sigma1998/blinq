part of 'inform_close_ones_bloc.dart';

@freezed
class InformCloseOnesState with _$InformCloseOnesState {
  const factory InformCloseOnesState({
    @Default(Status.initial) Status status,
    @Default([]) List<ContactResponseModel> contacts,
    @Default([]) List<ContactResponseModel> selectedContacts,
    Error? error,
  }) = _InformCloseOnesState;
}
