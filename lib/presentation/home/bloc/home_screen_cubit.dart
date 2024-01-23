// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/presentation/connect_to_blinq/connect_to_blinq_screen.dart';
import 'package:blinq/presentation/create_report/create_report_screen.dart';
import 'package:blinq/presentation/home/bloc/home_screen_state.dart';
import 'package:blinq/presentation/map/map_screen.dart';
import 'package:blinq/utils/map_pin.dart';
import 'package:blinq/utils/map_style.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/location/location_service.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  //
  final ReportBloc reportBloc;

  late GoogleMapController? mapController;
  final MapPickerController mapPickerController = MapPickerController();

  CameraPosition? position;

  LatLng latlng = const LatLng(41.30275284012766, 69.23845700742682);

  HomeScreenCubit({required this.reportBloc}) : super(const HomeScreenState()) {
    _getLocation();
    _hideMap();
    _showMap();
  }

  void _getLocation() async {
    final res = await LocationService.determinePosition();
    if (res != null) {
      latlng = LatLng(res.latitude, res.longitude);
      position = CameraPosition(
        target: latlng,
        zoom: 14.4746,
      );
      mapController!.animateCamera(
          CameraUpdate.newLatLng(LatLng(res.latitude, res.longitude)));
    }
  }

  void onCameraCreated(GoogleMapController controller) {
    mapController = controller;
    mapController!.setMapStyle(mapStyle);
  }

  void onCameraMove(CameraPosition position) {
    mapPickerController.mapMoving!();
  }

  void onCameraIdle() {
    mapPickerController.mapFinishedMoving!();
  }

  void onMyLocationPressed() async {
    _hideMap();
    await NavigationService.pushNamed(
      routeName: MapScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
      arguments: MapScreenArgs(
          initialPosition: position ?? CameraPosition(target: latlng)),
    );
    _showMap();
  }

  void onConnectToBlinqPressed() async {
    _hideMap();
    await NavigationService.pushNamed(
      routeName: ConnectToBlinqScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
    _showMap();
  }

  void onAccidentPressed() async {
    _hideMap();
    reportBloc.setReportType(ReportType.accident);
    await NavigationService.pushNamed(
      routeName: CreateReportScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
    _showMap();
  }

  void onBreakDownPressed() async {
    _hideMap();
    reportBloc.setReportType(ReportType.breakdown);
    await NavigationService.pushNamed(
      routeName: CreateReportScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
    _showMap();
  }

  /// [_hideMap] hides the map to avoid flickering when navigating to another screen
  void _hideMap() {
    emit(state.copyWith(mapHidden: true, mapRendered: false));
  }

  /// [_showMap] shows the map after a delay to avoid flickering when navigating to another screen
  void _showMap() async {
    await Future.delayed(const Duration(milliseconds: 250), () {
      emit(state.copyWith(mapHidden: false));
    });
    await Future.delayed(const Duration(milliseconds: 500), () {
      emit(state.copyWith(mapRendered: true));
    });
  }
}
