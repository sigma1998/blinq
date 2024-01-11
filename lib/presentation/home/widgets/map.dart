// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/home/bloc/home_screen_cubit.dart';
import 'package:blinq/presentation/home/bloc/home_screen_state.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/map_pin.dart';

class HomeMap extends StatelessWidget {
  //
  const HomeMap({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeScreenCubit>();

    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
        bloc: bloc,
        builder: (context, state) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Visibility(
                    visible: !state.mapHidden,
                    child: GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: bloc.latlng,
                        zoom: 14.4746,
                      ),
                      onMapCreated: bloc.onCameraCreated,
                      onCameraMove: bloc.onCameraMove,
                      onCameraIdle: bloc.onCameraIdle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: SizedBox(
                        width: 138,
                        height: 45,
                        child: AppButton(
                          btnColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          text: 'strMyLocation'.tr(),
                          txtColor: Colors.black,
                          onTap: bloc.onMyLocationPressed,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: MapPicker(
                      iconWidget: SvgPicture.asset(
                        AppDrawables.mapLocation,
                        height: 30,
                      ),
                      mapPickerController: bloc.mapPickerController,
                      padding: const EdgeInsets.only(bottom: 30),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
