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
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ProfileInfoCard(
                    image: AppDrawables.policyHolder,
                    title: 'strDriver'.tr(),
                    desc:
                        '${state.profile?.firstName} ${state.profile?.lastName}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileInfoCard(
                    image: AppDrawables.policyHolder,
                    title: 'strPolicyHolder'.tr(),
                    desc: 'Laziz',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ProfileInfoCard(
                    image: AppDrawables.electricBolt,
                    title: 'strVehicle'.tr(),
                    desc: 'Motor, trailer',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileInfoCard(
                    image: AppDrawables.insurance,
                    title: 'strInsurance'.tr(),
                    desc: 'Allianz',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ProfileImageCard(
              title: 'strMyCar'.tr(),
              desc: 'adsfadfs',
              image: AppDrawables.vehicle,
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ProfileImageCard(
              title: 'strMyCar'.tr(),
              desc: 'strQrCode'.tr(),
              image: AppDrawables.scanningQr,
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}
