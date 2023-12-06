// Flutter imports:
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
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
        final vehicleType = state.profile?.car?.vehicleType;

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ProfileInfoCard(
                    title: 'strDriver'.tr(),
                    onTap: bloc.onDriverPressed,
                    image: AppDrawables.policyHolder,
                    desc: '${state.profile?.fullName}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileInfoCard(
                    title: 'strPolicyHolder'.tr(),
                    image: AppDrawables.policyHolder,
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
                    desc: 'Motor, trailer',
                    title: 'strVehicle'.tr(),
                    onTap: bloc.onVehiclePressed,
                    image: AppDrawables.electricBolt,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ProfileInfoCard(
                    title: 'strInsurance'.tr(),
                    image: AppDrawables.insurance,
                    onTap: bloc.onInsurancePressed,
                    desc: state.profile?.insurance?.name ?? '-',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ProfileImageCard(
              title: '${vehicleType?.title}',
              onTap: bloc.onMyCarPressed,
              desc: '${state.profile?.car?.brand}',
              image: SizedBox(
                height: 163,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      '${vehicleType?.image}',
                      width: vehicleType?.width,
                      height: vehicleType?.height,
                    ),
                  ),
                ),
              ),
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
                    AppDrawables.scanningQr,
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
