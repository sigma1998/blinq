// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'item.dart';

class ProfileUserInfoSection extends StatelessWidget {
  //
  const ProfileUserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            SvgPicture.asset(AppDrawables.edit),
          ],
        ),
        const SizedBox(height: 20),
        MyInfoContainer(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileUserDetailsItem(
                title: 'strDateBirthday'.tr(),
                detail: '07 July 2003',
              ),
              ProfileUserDetailsItem(
                title: 'strAddress'.tr(),
                detail: 'Mirzo Ulugbek district Asaka 35',
              ),
              ProfileUserDetailsItem(
                title: 'strCountry'.tr(),
                detail: 'Uzbekistan',
              ),
              ProfileUserDetailsItem(
                title: 'strPhoneNumber'.tr(),
                detail: '+998 90 002 83 82',
              ),
              ProfileUserDetailsItem(
                title: 'strDrivingLicenseNumber'.tr(),
                detail: '13443f3r43',
              ),
              ProfileUserDetailsItem(
                title: 'strCategory'.tr(),
                detail: 'B',
              ),
              ProfileUserDetailsItem(
                title: 'strValidUntil'.tr(),
                detail: '07 July 2024',
                hasDivider: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
