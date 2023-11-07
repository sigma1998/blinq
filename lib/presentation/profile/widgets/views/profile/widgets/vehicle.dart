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

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
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
                    unit: 'km',
                    desc: 'strAllTime'.tr(),
                    title: 'strKMTravelled'.tr(),
                    value: '${state.profile?.userVehicle?.traveledKm}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileVehicleCard(
                    icon: AppDrawables.gear,
                    unit: 'strDaysLeft'.tr(),
                    title: 'strNextTechnicalins'.tr(),
                    value: '${state.profile?.userVehicle?.nextTechnical}',
                    desc:
                        '${state.profile?.userVehicle?.nextTechnicalUpdatedDate}',
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
                    unit: 'strKmLeft'.tr(),
                    title: 'strOilReplacement'.tr(),
                    value: '${state.profile?.userVehicle?.oilReplacement}',
                    desc:
                        '${'strLastReplacement'.tr()} ${state.profile?.userVehicle?.oilReplacementUpdatedDate}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileVehicleCard(
                    unit: 'strDaysLeft'.tr(),
                    title: 'strBatteryReplacement'.tr(),
                    icon: AppDrawables.batteryReplacement,
                    value: '${state.profile?.userVehicle?.batteryReplacement}',
                    desc:
                        '${'strLastReplacement'.tr()} ${state.profile?.userVehicle?.batteryReplacementUpdatedDate}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ProfileReportCard(),
          ],
        );
      },
    );
  }
}
