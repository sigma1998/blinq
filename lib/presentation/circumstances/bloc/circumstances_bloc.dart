

import 'package:flutter_bloc/flutter_bloc.dart';

import 'circumstance_state.dart';

class CircumstancesBloc extends Cubit<CircumstanceState>{

  CircumstancesBloc(): super(const CircumstanceState());


}


enum Circumstances {
  parkedStopped(
    title: 'parked/stopped',
    key: 'parked_stopperd',
  ),
  leavingPlace(
    title: 'leaving a parking place/ opening the door',
    key: 'leaving_place',
  ),
  enteringPlace(
    title: 'entering a parking place',
    key: 'entering_place',
  ),
  emergingFrom(
    title: 'emerging from a car park, from private ground, from a track',
    key: 'emerging_from',
  ),
  enteringPark(
    title: 'entering a car park, private ground, a track',
    key: 'entering_park',
  ),
  enteringCirculation(
    title: 'entering a roundabout',
    key: 'entering_roundabout',
  ),
  circulatingRoundabout(
    title: 'circulating a roundabout',
    key: 'circulating_roundabout',
  ),
  strikingRear(
    title: 'striking the rear of the other vehicle while'
        ' going in the same direction and in the same lane',
    key: 'striking_rear',
  ),
  sameDirection(
    title: 'going in the same direction but in a different lane',
    key: 'same_direction',
  ),
  changingLanes(
    title: 'changing lanes',
    key: 'changing_lanes',
  ),
  overtaking(
    title: 'overtaking turning to the right turning to the left reversing',
    key: 'overtaking',
  ),
  turningRight(
    title: 'turning to the right turning to the left reversing',
    key: 'turning_right',
  ),
  turningLeft(
    title: 'turning to the left',
    key: 'turning_left',
  ),
  reversing(
    title: 'reversing',
    key: 'reversing',
  ),
  encroaching(
    title: 'encroaching on a lane reserved for '
        'circulation in the opposite direction',
    key: 'encroaching',
  ),
  comingRight(
    title: 'coming from the right (at road junctions)',
    key: 'coming_right',
  ),
  notObserved(
    title: 'had not observed a right of way sign or a red light',
    key: 'not_observed',
  );

  const Circumstances({
    required this.title,
    required this.key,
  });

  final String title;
  final String key;
}
