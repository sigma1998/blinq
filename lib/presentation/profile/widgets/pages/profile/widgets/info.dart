// Flutter imports:
import 'package:blinq/core/locale/app_locale.dart';
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
                    onTap: () {
                      bloc.onDriverPressed();
                    },
                    image: AppDrawables.myCarImage,
                    desc: '${state.profile?.fullName}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileInfoCard(
                    title: 'strPolicyHolder'.tr(),
                    image: AppDrawables.policyHolderImage,
                    onTap: bloc.onPolicyHolderPressed,
                    desc: '${state.profile?.policyHolder?.fullName}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ProfileInfoCard(
                    desc: state.profile?.car?.brand ?? '-',
                    title: AppLocale.myCar.tr(),
                    onTap: bloc.onVehiclePressed,
                    image: AppDrawables.driverImage,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileInfoCard(
                    title: 'strInsurance'.tr(),
                    image: AppDrawables.insuranceImage,
                    onTap: bloc.onInsurancePressed,
                    desc: state.profile?.insurance?.name ?? '-',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ProfileImageCard(
              desc: 'strQrCode'.tr(),
              title: 'strTapToOpen'.tr(),
              onTap: bloc.onQrCodePressed,
              image: Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    AppDrawables.qrCodeImage,
                    height: 163,
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
