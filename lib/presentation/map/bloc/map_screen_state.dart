// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:blinq/data/model/map/map_models.dart';

abstract class MapState extends Equatable {
  const MapState();
  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final PlaceModel placeModel;
  const MapLoaded(this.placeModel);

  @override
  List<Object> get props => [placeModel];
}

class MapError extends MapState {}
