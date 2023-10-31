// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'card.dart';

class ProfileCarPolicySection extends StatelessWidget {
  //
  const ProfileCarPolicySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'strMyInformation'.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ProfileCarPolicyCard(
                image: AppDrawables.qr,
                title: 'strDriver'.tr(),
                desc: 'strQrCode'.tr(),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ProfileCarPolicyCard(
                image: AppDrawables.car,
                title: 'strCar'.tr(),
                desc: 'BMW'.tr(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ProfileCarPolicyCard(
                image: AppDrawables.policyHolder,
                title: 'strPolicyHolder'.tr(),
                desc: 'Laziz',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ProfileCarPolicyCard(
                image: AppDrawables.electricBolt,
                title: 'strVehicle'.tr(),
                desc: 'Motor, trailer',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ProfileCarPolicyCard(
                image: AppDrawables.insurance,
                title: 'strInsurance'.tr(),
                desc: 'Allianz',
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(child: SizedBox(width: 10)),
          ],
        ),
      ],
    );
  }
}
