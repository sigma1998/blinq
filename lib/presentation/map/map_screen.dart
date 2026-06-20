// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/glass_button.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
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
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      cubit = MapCubit(
        position: const CameraPosition(
          target: LatLng(41.30275284012766, 69.23845700742682),
          zoom: 14.4746,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
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
                          zoomControlsEnabled: false,
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
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MapPicker(
                iconWidget: SvgPicture.asset(AppDrawables.mapLocation, height: 60),
                mapPickerController: cubit.mapPickerController,
                padding: const EdgeInsets.only(bottom: 60),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: cubit.onDeterminePosition,
                            icon: SizedBox(
                              height: 44,
                              width: 44,
                              child: GlassContainer(
                                isCircle: true,
                                child: GlassContainer(
                                  child: Icon(Icons.gps_fixed, color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (state.selectedPlace?.placeName.isNotEmpty ?? false)
                        GlassContainer(
                          radius: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              state.selectedPlace?.placeName ?? '',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              style: AppTextStyles.s16W600.copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      SizedBox(height: 16),
                      GlassButton(
                        height: 44,
                        backgroundColor: AppColors.primaryColor,
                        tint: 0.6,
                        onTap: cubit.onDeterminePosition,
                        title: 'Share my location',
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 30,
                left: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 5),
                    //   child: GestureDetector(
                    //     onTap: cubit.onNavigateBack,
                    //     child: Icon(
                    //       Icons.close,
                    //       color: Theme.of(context).colorScheme.primary,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 10),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(12),
                    //     color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.8),
                    //   ),
                    //   child: state.status == Status.loading
                    //       ? Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Expanded(
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(10.0),
                    //                 child: Text(
                    //                   state.selectedPlace?.placeName ?? '',
                    //                   maxLines: 2,
                    //                   textAlign: TextAlign.center,
                    //                   overflow: TextOverflow.clip,
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         )
                    //       : Container(),
                    // ),
                  ],
                ),
              ),
            ],
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
