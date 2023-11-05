// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'widgets/item.dart';

class OrderHistoryScreen extends StatelessWidget {
  //
  static const String route = '/order_history';

  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'strOrderHistory'.tr()),
      body: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const ProfileOrderHistoryItem(
            date: '24 Dec 2022, 07:43pm',
            price: '12.12',
          );
        },
      ),
    );
  }
}
