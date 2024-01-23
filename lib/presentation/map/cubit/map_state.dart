part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    @Default(Status.initial) Status status,
    PlaceModel? selectedPlace,
    @Default(false) bool mapHidden,
    @Default(false) bool mapRendered,
  }) = _MapState;
}
