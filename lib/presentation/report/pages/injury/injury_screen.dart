// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/injury/cubit/injury_screen_cubit.dart';
import 'package:blinq/presentation/report/pages/injury/cubit/injury_screen_state.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/modal_progress_hud.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'wigets/item.dart';

class InjuryScreen extends StatefulWidget {
  //
  static const route = '/injury';

  const InjuryScreen({super.key});

  @override
  State<InjuryScreen> createState() => _InjuryScreenState();
}

class _InjuryScreenState extends State<InjuryScreen> {
  late InjuryScreenCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = InjuryScreenCubit(
      reportBloc: context.read(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InjuryScreenCubit, InjuryScreenState>(
      bloc: cubit,
      builder: (context, state) {
        return SafeArea(
          child: ModalProgressHud(
            isLoading: state.status == Status.loading,
            child: Scaffold(
              appBar: ProgressAppBar(
                step: 2,
                onSaveTap: cubit.isNextEnabled ? cubit.onNext : null,
              ),
              extendBody: true,
              body: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                physics: const ClampingScrollPhysics(),
                children: [
                  const Text(
                    '2. Short questions',
                    style: AppTextStyles.s22W600,
                  ),
                  const SizedBox(height: 32),
                  InjuryItem(
                    title: 'strMinorInjuries'.tr(),
                    onChanged: cubit.onAnyInjuriesChanged,
                  ),
                  const SizedBox(height: 50),
                  InjuryItem(
                    title: 'strDamagedVehicle'.tr(),
                    onChanged: cubit.onDamagedVehiclesChanged,
                  ),
                  const SizedBox(height: 50),
                  InjuryItem(
                    title: 'strDamagedBesidesVehicle'.tr(),
                    onChanged: cubit.onDamageBesideVehicleChanged,
                  ),
                  const SizedBox(height: 100),
                ],
              ),
              floatingActionButton: NavigationButton(
                padding: 16,
                onNextTap: cubit.onNext,
                canGoForward: cubit.isNextEnabled,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ),
        );
      },
    );
  }
}
