// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'cards/image_card.dart';
import 'cards/info_card.dart';

class ProfileInfoWidget extends StatelessWidget {
  //
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ProfileInfoCard(
                    title: 'strDriver'.tr(),
                    onTap: bloc.onDriverPressed,
                    image: AppDrawables.policyHolder,
                    desc:
                        '${state.profile?.firstName} ${state.profile?.lastName}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileInfoCard(
                    desc: 'Laziz',
                    title: 'strPolicyHolder'.tr(),
                    image: AppDrawables.policyHolder,
                    onTap: bloc.onPolicyHolderPressed,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ProfileInfoCard(
                    desc: 'Motor, trailer',
                    title: 'strVehicle'.tr(),
                    onTap: bloc.onVehiclePressed,
                    image: AppDrawables.electricBolt,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileInfoCard(
                    desc: 'Allianz',
                    title: 'strInsurance'.tr(),
                    image: AppDrawables.insurance,
                    onTap: bloc.onInsurancePressed,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ProfileImageCard(
              title: 'strMyCar'.tr(),
              desc: 'adsfadfs',
              onTap: bloc.onMyCarPressed,
              image: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  AppDrawables.vehicle,
                  width: 305,
                  height: 153,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ProfileImageCard(
              title: 'strTapToOpen'.tr(),
              desc: 'strQrCode'.tr(),
              onTap: bloc.onQrCodePressed,
              image: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  AppDrawables.scanningQr,
                  height: 163,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
