// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/string_helper.dart';
import 'bloc/user_info_bloc.dart';
import 'bloc/user_info_event.dart';
import 'item.dart';

class ProfileUserInfoSection extends StatelessWidget {
  //
  const ProfileUserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    final userInfoBloc = ProfileUserInfoBloc();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'strMyProfile'.tr(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            GestureDetector(
              onTap: () {
                userInfoBloc.add(OnEditPressed(isEdit: true));
              },
              child: SvgPicture.asset(AppDrawables.edit),
            ),
          ],
        ),
        const SizedBox(height: 20),
        BlocBuilder<ProfileBloc, ProfileState>(
          bloc: bloc,
          builder: (context, state) {
            return MyInfoContainer(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileUserInfoItem(
                    title: 'strDateBirthday'.tr(),
                    detail: state.profile?.birthDate ?? '-',
                  ),
                  ProfileUserInfoItem(
                    title: 'strAddress'.tr(),
                    detail: state.profile?.address ?? '-',
                  ),
                  ProfileUserInfoItem(
                    title: 'strCountry'.tr(),
                    detail: state.profile?.country ?? '-',
                  ),
                  ProfileUserInfoItem(
                    title: 'strPhoneNumber'.tr(),
                    detail: MyStringHelper.phoneMask(
                        state.profile?.phoneNumber ?? '-'),
                  ),
                  ProfileUserInfoItem(
                    title: 'strDrivingLicenseNumber'.tr(),
                    detail: state.profile?.driverLicenseNumber ?? '-',
                  ),
                  ProfileUserInfoItem(
                    title: 'strCategory'.tr(),
                    detail: state.profile?.driverLicense!.name ?? '-',
                  ),
                  ProfileUserInfoItem(
                    title: 'strDrivingLicenceValidTill'.tr(),
                    detail: state.profile?.driverLicenseExpiredDate ?? '-',
                    hasDivider: false,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
