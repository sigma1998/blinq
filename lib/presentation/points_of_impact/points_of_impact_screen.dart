import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PointsOfImpactScreen extends StatelessWidget {
  static const String route = 'points_of_impact_screen';

  const PointsOfImpactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 52,
              ),
              Text(
                'strIndicateDescription'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 48,),

            ],
          ),
        ),
      ),
    );
  }
}
