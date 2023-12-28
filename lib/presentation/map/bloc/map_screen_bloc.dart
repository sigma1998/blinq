// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:blinq/data/model/map/map_models.dart';
import 'package:blinq/presentation/map/bloc/map_screen_state.dart';
import 'package:blinq/utils/map_pin.dart';
import 'package:blinq/utils/map_style.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/location/location_service.dart';

class MapScreenBloc extends Cubit<MapState> {
  //
  late GoogleMapController? mapController;

  final MapPickerController mapPickerController = MapPickerController();

  late CameraPosition position;

  MapScreenBloc({required this.position}) : super(MapInitial());

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController!.setMapStyle(mapStyle);
  }

  void onCameraMove(CameraPosition newPosition) {
    if (state is! MapLoading) {
      _draggingStarted();
    }
    position = newPosition;
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
    NavigationService.homeNavigatorKey.currentState?.pop();
  }

  void _getPlaceFullAddress(double lat, double lng) async {
    emit(MapLoading());
    try {
      String? result = await LocationService.getAddressFromLatLng(lat, lng);
      debugPrint('detail : $result');
      emit(MapLoaded(PlaceModel(lat: lat, lon: lng, placeName: result ?? '')));
    } catch (e) {
      debugPrint('error2 : $e');
      emit(MapError());
    }
  }

  void _draggingStarted() {
    emit(MapLoading());
  }
}
