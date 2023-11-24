import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/damaged_parts_screen.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/step_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VehicleTypeScreen extends StatelessWidget {
  static const String route = '/vehicle_type_screen';

  const VehicleTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepIndicator(
                currentStep: 11,
                title: 'strBreakDown'.tr(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'strVehicleType'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              _vehicleType(AppDrawables.carSvg, 'Auto', () {
                NavigationService.pushNamed(
                    routeName: DamagedPartsScreen.route,
                    nestedKey: NavigationService.homeNavigatorKey,
                    arguments:
                        DamagedPartsScreenArgs(vehicleType: VehicleType.auto));
              }, context),
              const SizedBox(
                height: 10,
              ),
              _vehicleType(AppDrawables.bigCarSvg, 'Van', () {
                NavigationService.pushNamed(
                    routeName: DamagedPartsScreen.route,
                    nestedKey: NavigationService.homeNavigatorKey,
                    arguments:
                        DamagedPartsScreenArgs(vehicleType: VehicleType.van));
              }, context),
              const SizedBox(
                height: 10,
              ),
              _vehicleType(AppDrawables.bykeSvg, 'Moto', () {
                NavigationService.pushNamed(
                    routeName: DamagedPartsScreen.route,
                    nestedKey: NavigationService.homeNavigatorKey,
                    arguments:
                        DamagedPartsScreenArgs(vehicleType: VehicleType.moto));
              }, context),
              const Spacer(),
              NavigationButton(
                onNextTap: () {},
                padding: 0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _vehicleType(
      String image, String name, VoidCallback onTap, BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(10)),
                  child: SvgPicture.asset(image)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
