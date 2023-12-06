import 'package:animate_do/animate_do.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/map/bloc/map_screen_bloc.dart';
import 'package:blinq/presentation/map/bloc/map_screen_state.dart';
import 'package:blinq/utils/map_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static const String route = 'map_screen';
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapScreenBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = MapScreenBloc(
        position: (ModalRoute.of(context)!.settings.arguments as MapScreenArgs)
            .initialPosition ?? const CameraPosition(
          target: LatLng(41.30275284012766, 69.23845700742682),
          zoom: 14.4746,
        ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapScreenBloc, MapState>(
        bloc: bloc,
        builder: (context, state) {
          return SafeArea(
            child: FadeInRight(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GoogleMap(
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition: bloc.position,
                        onMapCreated: bloc.onMapCreated,
                        onCameraMove: bloc.onCameraMove,
                        onCameraIdle: bloc.onCameraIdle,
                      ),
                    ),
                  ),
                  MapPicker(
                    iconWidget: SvgPicture.asset(
                      AppDrawables.mapLocation,
                      height: 60,
                    ),
                    mapPickerController: bloc.mapPickerController,
                    padding: const EdgeInsets.only(bottom: 60),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant
                                      .withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: bloc.onDeterminePosition,
                                    child: Icon(
                                      Icons.near_me_outlined,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 32,
                                    )),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 30,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: GestureDetector(
                            onTap: bloc.onNavigateBack,
                            child: Icon(
                              Icons.close,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceVariant
                                  .withOpacity(0.8),
                            ),
                            child: Builder(
                              builder: (context) {
                                if (state is MapLoaded) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // addressBar(state.placeModel.placeName),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            state.placeModel.placeName,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class MapScreenArgs {
  final CameraPosition? initialPosition;

  MapScreenArgs(
      {required this.initialPosition});
}
