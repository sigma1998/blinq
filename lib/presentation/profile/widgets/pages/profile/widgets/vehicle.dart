// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/data/datasource/local/auth_local_db.dart';
import 'package:blinq/generated/assets.dart';
import 'package:blinq/presentation/auth/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../app/locator.dart';
import '../../../../../../core/drawables/app_drawables.dart';
import '../../../../../../utils/components/wrappers/glass_container.dart';
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
                TextButton(
                  onPressed: bloc.onMyVehiclePressed,
                  child: Text(
                    'Edit',
                    style: AppTextStyles.s17W600.copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ProfileVehicleCard(
                    icon: Assets.iconsRoute,
                    unit: 'km',
                    desc: 'strAllTime'.tr(),
                    title: 'strKMTravelled'.tr(),
                    value: '${state.profile?.car?.traveledKm ?? '-'}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileVehicleCard(
                    icon: Assets.iconsCarTechnicalInspection,
                    unit: 'strDaysLeft'.tr(),
                    title: 'strNextTechnicalins'.tr(),
                    value: '${state.profile?.car?.nextTechnical ?? '-'}',
                    desc: (state.profile?.car?.nextTechnicalUpdatedDate ?? '-').toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ProfileVehicleCard(
                    icon: Assets.iconsOilcanFill,
                    unit: 'strKmLeft'.tr(),
                    title: 'strOilReplacement'.tr(),
                    value: '${state.profile?.car?.oilReplacement ?? '-'}',
                    desc: '${'strLastReplacement'.tr()}\n${(state.profile?.car?.oilReplacementUpdatedDate ?? '-').toString() ?? ''}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileVehicleCard(
                    unit: 'strDaysLeft'.tr(),
                    title: 'strBatteryReplacement'.tr(),
                    icon: Assets.iconsBoltBatteryblockFill,
                    value: '${state.profile?.car?.batterReplacement ?? '-'}',
                    desc: '${'strLastReplacement'.tr()}\n${(state.profile?.car?.batteryReplacementUpdatedDate ?? '-') ?? ''}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ProfileReportCard(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Log out'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text('No'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                        onPressed: () async {
                          getIt.get<AuthLocalStorageImpl>().clearAll();
                          Navigator.of(context).pushNamedAndRemoveUntil(SignInScreen.route, (route) => false);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: GlassContainer(
                radius: 16,
                padding: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        'Log out',
                        style: AppTextStyles.s17W600.copyWith(color: AppColors.primaryColor),
                      ),
                      const Expanded(child: SizedBox(width: 16)),
                      SvgPicture.asset(AppDrawables.arrowRight),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
