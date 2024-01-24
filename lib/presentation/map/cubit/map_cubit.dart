// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:blinq/data/model/map/map_models.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/map_pin.dart';
import 'package:blinq/utils/map_style.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/location/location_service.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  //
  late GoogleMapController? mapController;

  final MapPickerController mapPickerController = MapPickerController();

  late CameraPosition position;

  MapCubit({required this.position}) : super(const MapState()) {
    _hideMap();
    _showMap();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController!.setMapStyle(mapStyle);
  }

  void onCameraMove(CameraPosition newPosition) {
    if (state.status != Status.loading) {
      emit(state.copyWith(status: Status.loading));
    }
    position = CameraPosition(
      target: newPosition.target,
      zoom: 14.4746,
    );
    mapPickerController.mapMoving!();
  }

  void onCameraIdle() {
    mapPickerController.mapFinishedMoving!();
    _getPlaceFullAddress(position.target.latitude, position.target.longitude);
  }

  void onDeterminePosition() async {
    final currentPosition = await LocationService.determinePosition();
    if (currentPosition == null) {
      return;
    }
    mapController?.animateCamera(CameraUpdate.newLatLng(
        LatLng(currentPosition.latitude, currentPosition.longitude)));
  }

  void onNavigateBack() {
    _hideMap();
    NavigationService.homeNavigatorKey.currentState?.pop();
  }

  /// [_hideMap] hides the map to avoid flickering when navigating to another screen
  void _hideMap() {
    emit(state.copyWith(mapHidden: true, mapRendered: false));
  }

  /// [_showMap] shows the map after a delay to avoid flickering when navigating to another screen
  void _showMap() {
    Future.delayed(const Duration(milliseconds: 500), () {
      emit(state.copyWith(mapHidden: false));
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      emit(state.copyWith(mapRendered: true));
    });
  }

  void _getPlaceFullAddress(double lat, double lng) async {
    try {
      String? result = await LocationService.getAddressFromLatLng(lat, lng);
      debugPrint('detail : $result');
      emit(state.copyWith(
        selectedPlace: PlaceModel(
          lat: lat,
          lon: lng,
          placeName: result ?? '',
        ),
      ));
    } catch (e) {
      debugPrint('error2 : $e');
      emit(state.copyWith(status: Status.initial));
    }
  }
}
