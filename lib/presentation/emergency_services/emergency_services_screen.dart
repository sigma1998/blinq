// Flutter imports:
import 'package:blinq/utils/url_helper.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'widgets/item.dart';

class EmergencyServicesScreen extends StatelessWidget {
  //
  static const route = '/emergency_services';

  const EmergencyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'strContactEmergencyService'.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
          horizontal: 20,
        ),
        child: Column(
          children: [
            MyInfoContainer(
              onTap: onCall,
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                children: [
                  Text(
                    'strUniversalEmergencyNumber'.tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppDrawables.phone),
                      const SizedBox(width: 4),
                      const Text(
                        '112',
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'strTapToCall'.tr(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            EmergencyServicesItem(
              onTap: onCall,
              title: 'strPoliceCall'.tr(),
              icon: AppDrawables.policeCar,
            ),
            const SizedBox(height: 12),
            EmergencyServicesItem(
              onTap: onCall,
              title: 'strEmergencyCall'.tr(),
              icon: AppDrawables.emergencyCar,
            ),
            const SizedBox(height: 12),
            EmergencyServicesItem(
              onTap: onCall,
              icon: AppDrawables.fireTruck,
              title: 'strFireFighterscall'.tr(),
            ),
          ],
        ),
      ),
    );
  }

  void onCall() {
    MyUrlLauncher.call('112');
  }
}
