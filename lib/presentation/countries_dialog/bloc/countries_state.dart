part of 'countries_bloc.dart';

@freezed
class CountriesState with _$CountriesState {
  const factory CountriesState({
    @Default(Status.initial) Status status,
    @Default([]) List<String> countries,
    Error? error,
  }) = _CountriesState;
}
