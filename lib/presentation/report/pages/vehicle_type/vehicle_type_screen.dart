// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/damaged_parts_screen.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/navigation_service.dart';

import '../../../../domain/bloc/report_bloc/report_type.dart';

class VehicleTypeScreen extends StatefulWidget {
  static const String route = '/vehicle_type_screen';

  const VehicleTypeScreen({Key? key}) : super(key: key);

  @override
  State<VehicleTypeScreen> createState() => _VehicleTypeScreenState();
}

class _VehicleTypeScreenState extends State<VehicleTypeScreen> {
  int type = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ProgressAppBar(
          step: 9,
          onSaveTap: navigate,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '9. ${'strVehicleType'.tr()}',
                style: AppTextStyles.s22W600,
              ),
              const SizedBox(
                height: 32,
              ),
              _vehicleType(
                AppDrawables.carSvg,
                'Auto',
                () {
                  setState(() {
                    type = 0;
                  });
                },
                context,
                type == 0,
              ),
              const SizedBox(
                height: 10,
              ),
              _vehicleType(
                AppDrawables.bigCarSvg,
                'Van',
                () {
                  setState(() {
                    type = 1;
                  });
                },
                context,
                type == 1,
              ),
              const SizedBox(
                height: 10,
              ),
              _vehicleType(
                AppDrawables.bykeSvg,
                'Moto',
                () {
                  setState(() {
                    type = 2;
                  });
                },
                context,
                type == 2,
              ),
              const Spacer(),
              NavigationButton(
                onNextTap: navigate,
                padding: 0,
              )
            ],
          ),
        ),
      ),
    );
  }

  navigate() {
    if (type == 0) {
      NavigationService.pushNamed(
        routeName: DamagedPartsScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
        arguments: DamagedPartsScreenArgs(vehicleType: VehicleType.auto),
      );
    } else if (type == 1) {
      NavigationService.pushNamed(
        routeName: DamagedPartsScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
        arguments: DamagedPartsScreenArgs(vehicleType: VehicleType.van),
      );
    } else {
      NavigationService.pushNamed(
        routeName: DamagedPartsScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
        arguments: DamagedPartsScreenArgs(vehicleType: VehicleType.moto),
      );
    }
  }

  Widget _vehicleType(
    String image,
    String name,
    VoidCallback onTap,
    BuildContext context,
    bool clicked,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
              color: clicked ? AppColors.primaryColor : Colors.transparent,
            ),
            child: Container(
              width: 10,
              height: 10,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: clicked ? AppColors.white : Colors.transparent,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: clicked ? Colors.transparent : AppColors.darkGrey,
                border: Border.all(
                  color: AppColors.darkGrey,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(10)),
                      child: SvgPicture.asset(
                        width: 190,
                        image,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        name,
                        style: AppTextStyles.s20W600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
