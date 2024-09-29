// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/step_indicator.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
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
            appBar: ProgressAppBar(
              step: bloc.getStep(),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16,
              ),
              children: [
                Text(
                  '6. ${'strCircumstance'.tr()}',
                  style: AppTextStyles.s20W600,
                ),
                const SizedBox(height: 8),
                Text(
                  (bloc.isAccident ? 'strBigTxt'.tr() : 'strBigTxt2'.tr()),
                  style: AppTextStyles.s15W400,
                ),
                const SizedBox(height: 32),
                bloc.isAccident
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 38,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'A',
                                  style: AppTextStyles.s20W600,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.activeReportColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_downward_rounded,
                                    color: AppColors.black,
                                    size: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 38,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'B',
                                  style: AppTextStyles.s20W600,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.activeReportColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_downward_rounded,
                                    color: AppColors.black,
                                    size: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 24),
                ListView.separated(
                  padding: const EdgeInsets.only(bottom: 192),
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
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: NavigationButton(
                padding: 16,
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
