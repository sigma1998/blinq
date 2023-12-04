// Flutter imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/injury/bloc/injury_screen_bloc.dart';
import 'package:blinq/presentation/report/pages/injury/bloc/injury_screen_state.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/modal_progress_hud.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/step_indicator.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'wigets/item.dart';

class InjuryScreen extends StatefulWidget {
  //
  static const route = '/injury';

  const InjuryScreen({super.key});

  @override
  State<InjuryScreen> createState() => _InjuryScreenState();
}

class _InjuryScreenState extends State<InjuryScreen> {
  late InjuryScreenBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = InjuryScreenBloc(
        reportBloc: context.read(),
        accidentRepository: getIt<AccidentRepositoryImpl>());

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InjuryScreenBloc, InjuryScreenState>(
        bloc: bloc,
        builder: (context, state) {
          return SafeArea(
            child: ModalProgressHud(
              isLoading: state.status == Status.loading,
              child: Scaffold(
                extendBody: true,
                body: ListView(
                  padding: const EdgeInsets.all(32),
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const StepIndicator(currentStep: 2),
                    const SizedBox(height: 52),
                    InjuryItem(
                      title: 'strMinorInjuries'.tr(),
                      onChanged: (v) {
                        bloc.anyInjuries = v;
                      },
                    ),
                    const SizedBox(height: 50),
                    InjuryItem(
                      title: 'strDamagedVehicle'.tr(),
                      onChanged: (v) {
                        bloc.damagedVehicles = v;
                      },
                    ),
                    const SizedBox(height: 50),
                    InjuryItem(
                      title: 'strDamagedBesidesVehicle'.tr(),
                      onChanged: (v) {
                        bloc.damageBesideVehicle = v;
                      },
                    ),
                  ],
                ),
                floatingActionButton: NavigationButton(onNextTap: bloc.onNext),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              ),
            ),
          );
        });
  }
}
