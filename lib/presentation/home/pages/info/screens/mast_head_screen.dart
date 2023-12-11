// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/home/pages/info/widgets/card.dart';
import 'package:blinq/utils/custom_widgets/coming_soon_widget.dart';

class HomeInfoMastHeadScreen extends StatelessWidget {
  //
  static const String route = '/home_info_mast_head_screen';

  const HomeInfoMastHeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeInfoCard(
        title: 'strMastHead'.tr(),
        children: const [
          ComingSoonWidget(),
        ],
      ),
    );
  }
}
