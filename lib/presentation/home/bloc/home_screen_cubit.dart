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
  final ReportBloc reportBloc;

  late GoogleMapController? mapController;
  final MapPickerController mapPickerController = MapPickerController();

  CameraPosition? position;

  HomeScreenCubit({required this.reportBloc}) : super(const HomeScreenState()) {
    _getLocation();
  }

  void _getLocation() async {
    final res = await LocationService.determinePosition();
    if (res != null) {
      position = CameraPosition(
        target: LatLng(res.latitude, res.longitude),
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

  void onMyLocationPressed() {
    NavigationService.pushNamed(
      routeName: MapScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
      arguments: MapScreenArgs(initialPosition: position),
    );
  }

  void onConnectToBlinqPressed() {
    NavigationService.pushNamed(
      routeName: ConnectToBlinqScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
  }

  void onAccidentPressed() {
    reportBloc.setReportType(ReportType.accident);
    NavigationService.pushNamed(
      routeName: CreateReportScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
  }

  void onBreakDownPressed() {
    reportBloc.setReportType(ReportType.breakdown);
    NavigationService.pushNamed(
      routeName: CreateReportScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
  }
}
