import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/custom_widgets/step_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/circumstance_state.dart';
import 'bloc/circumstances_bloc.dart';
import 'widgets/item.dart';

class CircumstancesScreen extends StatefulWidget {
  static const String route = 'circumstances_screen';

  const CircumstancesScreen({Key? key}) : super(key: key);

  @override
  State<CircumstancesScreen> createState() => _CircumstancesScreenState();
}

class _CircumstancesScreenState extends State<CircumstancesScreen> {
  late final CircumstancesBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = CircumstancesBloc(
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
      reportBloc: context.read(),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CircumstancesBloc, CircumstanceState>(
      bloc: bloc,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: ListView(padding: const EdgeInsets.all(24.0), children: [
              StepIndicator(currentStep: bloc.getStep()),
              const SizedBox(
                height: 32,
              ),
              Text(
                'strCircumstance'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Text(
                (bloc.isAccident ? 'strBigTxt'.tr() : 'strBigTxt2'.tr()),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.outline),
              ),
              const SizedBox(height: 20),
              bloc.isAccident
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('A',
                                style: Theme.of(context).textTheme.titleLarge),
                            const Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                              size: 32,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text('B',
                                style: Theme.of(context).textTheme.titleLarge),
                            const Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              ListView.separated(
                padding: const EdgeInsets.only(top: 10, bottom: 192),
                physics: const ClampingScrollPhysics(),
                itemCount: Circumstances.values.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CircumstanceItem(
                    isAccident: bloc.isAccident,
                    index: index,
                    driverAActive: bloc.driverAActive(index),
                    driverBActive: bloc.driverBActive(index),
                    onCheckedA: () => bloc.onCheckedA(index),
                    onCheckedB: () => bloc.onCheckedB(index),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                },
              ),
            ]),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: NavigationButton(
                loading: state.status == Status.loading,
                onNextTap: bloc.onSubmit,
              ),
            ),
            backgroundColor: Colors.transparent,
            extendBody: true,
          ),
        );
      },
    );
  }
}
