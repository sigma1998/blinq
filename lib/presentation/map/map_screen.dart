// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/map_pin.dart';
import 'cubit/map_cubit.dart';

class MapScreen extends StatefulWidget {
  //
  static const String route = 'map_screen';

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //
  late final MapCubit cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit = MapCubit(
      position: (ModalRoute.of(context)?.settings.arguments as MapScreenArgs)
              .initialPosition ??
          const CameraPosition(
            target: LatLng(41.30275284012766, 69.23845700742682),
            zoom: 14.4746,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                      tag: 'mapHero',
                      child: Stack(
                        children: [
                          Visibility(
                            visible: !state.mapHidden,
                            child: GoogleMap(
                              myLocationEnabled: true,
                              myLocationButtonEnabled: false,
                              mapType: MapType.normal,
                              initialCameraPosition: cubit.position,
                              onMapCreated: cubit.onMapCreated,
                              onCameraMove: cubit.onCameraMove,
                              onCameraIdle: cubit.onCameraIdle,
                            ),
                          ),
                          IgnorePointer(
                            ignoring: !state.mapHidden,
                            child: AnimatedOpacity(
                              opacity: state.mapRendered ? 0.0 : 1.0,
                              duration: const Duration(milliseconds: 500),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                MapPicker(
                  iconWidget: SvgPicture.asset(
                    AppDrawables.mapLocation,
                    height: 60,
                  ),
                  mapPickerController: cubit.mapPickerController,
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
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: cubit.onDeterminePosition,
                              child: Icon(
                                Icons.near_me_outlined,
                                color: Theme.of(context).colorScheme.primary,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
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
                          onTap: cubit.onNavigateBack,
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
                        child: state.status == Status.loading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        state.selectedPlace?.placeName ?? '',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MapScreenArgs {
  final CameraPosition? initialPosition;

  MapScreenArgs({required this.initialPosition});
}
