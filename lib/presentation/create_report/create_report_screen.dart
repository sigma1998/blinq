// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'bloc/create_report_bloc.dart';
import 'widgets/item.dart';

class CreateReportScreen extends StatelessWidget {
  //
  static const route = '/create_report';

  const CreateReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = CreateReportBloc();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 64,
          horizontal: 18,
        ),
        child: Column(
          children: [
            CreateReportItem(
              icon: AppDrawables.heartPulse,
              onTap: bloc.onMedicalAssistancePressed,
              title: 'strMedicalAssistance'.tr(),
            ),
            const SizedBox(height: 20),
            CreateReportItem(
              icon: AppDrawables.medicalKit,
              title: 'strContactEmergencyService'.tr(),
              onTap: bloc.onEmergencyServicesPressed,
            ),
            const SizedBox(height: 20),
            CreateReportItem(
              icon: AppDrawables.handShake,
              title: 'strInformYourCloseOnes'.tr(),
              onTap: bloc.onInformYourCloseOnesPressed,
            ),
            const SizedBox(height: 20),
            CreateReportItem(
              icon: AppDrawables.file,
              title: 'strCreateReport'.tr(),
              onTap: bloc.onCreateReportPressed,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
      floatingActionButton: const NavigationButton(height: 135),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
