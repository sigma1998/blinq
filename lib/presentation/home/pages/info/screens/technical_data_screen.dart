// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/home/pages/info/widgets/card.dart';
import 'package:blinq/utils/custom_widgets/coming_soon_widget.dart';

class HomeInfoTechnicalDataScreen extends StatelessWidget {
  //
  static const String route = '/home_info_technical_data_screen';

  const HomeInfoTechnicalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeInfoCard(
        title: 'strTechnicalData'.tr(),
        children: const [
          ComingSoonWidget(),
        ],
      ),
    );
  }
}
