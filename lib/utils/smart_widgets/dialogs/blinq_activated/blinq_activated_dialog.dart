// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'blinq_activated_bloc.dart';
import 'widgets/button.dart';

class BlinqActivatedDialog extends StatelessWidget {
  //
  const BlinqActivatedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlinqActivatedBloc(reportBloc: context.read<ReportBloc>());

    return MyInfoContainer(
      isEdit: true,
      onClose: NavigationService.back,
      closeButtonColor: Colors.white,
      padding: const EdgeInsets.all(18),
      color: Theme.of(context).colorScheme.primary,
      height: MediaQuery.of(context).size.height * 0.54,
      margin: const EdgeInsets.symmetric(horizontal: 52),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            'strBlinqActivated'.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 30,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            'strBlinqActivatedQuestions'.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          BlinqActivatedButton(
            title: 'strBreakDown'.tr(),
            onTap: bloc.onBreakDownPressed,
            icon: AppDrawables.blinqBreakdown,
          ),
          const SizedBox(height: 10),
          BlinqActivatedButton(
            title: 'strAccident'.tr(),
            onTap: bloc.onAccidentPressed,
            icon: AppDrawables.blinqAccident,
          ),
        ],
      ),
    );
  }
}
