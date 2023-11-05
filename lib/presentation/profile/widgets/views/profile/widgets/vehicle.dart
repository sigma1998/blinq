// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'cards/report_card.dart';
import 'cards/vehicle_card.dart';

class ProfileVehicleWidget extends StatelessWidget {
  //
  const ProfileVehicleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'strMyVehicle'.tr(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            GestureDetector(
              onTap: bloc.onMyVehiclePressed,
              child: SvgPicture.asset(
                AppDrawables.edit,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ProfileVehicleCard(
                icon: AppDrawables.wheel,
                title: 'strKMTravelled'.tr(),
                desc: 'strAllTime'.tr(),
                value: '',
                unit: 'km',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ProfileVehicleCard(
                icon: AppDrawables.gear,
                title: 'strNextTechnicalins'.tr(),
                desc: 'View your vehicle details',
                value: '',
                unit: 'days left',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ProfileVehicleCard(
                icon: AppDrawables.oil,
                title: 'strOilReplacement'.tr(),
                desc: 'View your vehicle details',
                value: '',
                unit: 'km',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ProfileVehicleCard(
                icon: AppDrawables.batteryReplacement,
                title: 'strBatteryReplacement'.tr(),
                desc: 'View your vehicle details',
                value: '',
                unit: 'km',
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const ProfileReportCard(),
      ],
    );
  }
}
