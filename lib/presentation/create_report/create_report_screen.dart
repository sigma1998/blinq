// Flutter imports:
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/modal_progress_hud.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bloc/create_report_bloc.dart';
import 'widgets/item.dart';

class CreateReportScreen extends StatefulWidget {
  //
  static const route = '/create_report';

  const CreateReportScreen({super.key});

  @override
  State<CreateReportScreen> createState() => _CreateReportScreenState();
}

class _CreateReportScreenState extends State<CreateReportScreen> {
  //
  late final CreateReportBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = CreateReportBloc(
      profileRepository: getIt<ProfileRepositoryImpl>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      reportBloc: context.read<ReportBloc>(),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CreateReportBloc, GenericBlocState>(
        bloc: bloc,
        builder: (context, state) {
          return ModalProgressHud(
            isLoading: state.status == Status.loading,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 18,
              ),
              child: ListView(
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.darkGrey),
                          child: SvgPicture.asset(
                            AppDrawables.arrowLeft,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
