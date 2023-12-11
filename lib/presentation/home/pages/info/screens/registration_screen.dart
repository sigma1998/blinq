// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/home/pages/info/widgets/card.dart';
import 'package:blinq/utils/custom_widgets/coming_soon_widget.dart';

class HomeInfoRegistrationScreen extends StatelessWidget {
  //
  static const String route = '/home_info_registration_screen';

  const HomeInfoRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeInfoCard(
        title: 'strRegistration'.tr(),
        children: const [
          ComingSoonWidget(),
        ],
      ),
    );
  }
}
