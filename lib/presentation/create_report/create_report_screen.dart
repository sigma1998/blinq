// Flutter imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/modal_progress_hud.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/create_report_bloc.dart';
import 'widgets/item.dart';

class CreateReportScreen extends StatelessWidget {
  //
  static const route = '/create_report';

  CreateReportScreen({super.key});

  final bloc = CreateReportBloc(
    profileRepository: getIt<ProfileRepositoryImpl>(),
    accidentRepository: getIt<AccidentRepositoryImpl>(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReportBloc, GenericBlocState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHud(
            isLoading: state.status == Status.loading,
            child: Padding(
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
          ),
          floatingActionButton: const NavigationButton(height: 135),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
