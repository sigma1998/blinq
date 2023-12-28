// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/navigation_service.dart';

class OfflineScreen extends StatelessWidget {
  static const String route = '/offline_screen';

  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0).copyWith(bottom: 56),
            child: Column(
              children: [
                const Spacer(),
                Lottie.asset(AppDrawables.noInternet),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'strConnectionProblem'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'strPleaseConnect'.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                ),
                const Spacer(),
                MyButton.primary(
                  label: 'strTryAgain'.tr(),
                  onTap: () => NavigationService.back(result: true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
