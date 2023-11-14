// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/buttons/yes_no_button.dart';
import 'package:blinq/presentation/qr_scan/qr_scan_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

class ConnectToDriverScreen extends StatelessWidget {
  //
  static const route = '/connect_to_driver';

  const ConnectToDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(32),
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 50),
          Text(
            'strSecondDriverBlinq'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 118),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YesNoButton(
                onChanged: (v) {},
              ),
            ],
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: NavigationButton(
        onNextTap: () => NavigationService.pushNamed(
          routeName: QrScanScreen.route,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
