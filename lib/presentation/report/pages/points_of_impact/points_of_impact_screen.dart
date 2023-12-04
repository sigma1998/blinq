import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/custom_widgets/arrow_button.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/step_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/points_of_impact_bloc.dart';
import 'bloc/points_of_impact_state.dart';

class PointsOfImpactScreen extends StatefulWidget {
  static const String route = 'points_of_impact_screen';

  const PointsOfImpactScreen({Key? key}) : super(key: key);

  @override
  State<PointsOfImpactScreen> createState() => _PointsOfImpactScreenState();
}

class _PointsOfImpactScreenState extends State<PointsOfImpactScreen> {
  late final PointsOfImpactBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = PointsOfImpactBloc(
        reportBloc: context.read(),
        accidentRepository: getIt<AccidentRepositoryImpl>());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointsOfImpactBloc, PointsOfImpactScreenState>(
      bloc: bloc,
      builder: (context, state) {
        final primary = Theme.of(context).colorScheme.primary;
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  StepIndicator(currentStep: bloc.getStep(), showTrailingTitle: true,),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'strIndicateDescription'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      color: Theme.of(context).colorScheme.background,
                      child: RepaintBoundary(
                        key: bloc.key,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ArrowButtonWidget(
                                    color:
                                        state.isTopLeftActive ? primary : null,
                                    onTap: () => bloc.onArrowPressed(
                                        pointOfImpact: PointOfImpact.topLeft),
                                    icon: AppDrawables.topLeftArrow),
                                ArrowButtonWidget(
                                  color: state.isTopActive ? primary : null,
                                  onTap: () => bloc.onArrowPressed(
                                      pointOfImpact: PointOfImpact.top),
                                  icon: AppDrawables.topArrow,
                                ),
                                ArrowButtonWidget(
                                    color:
                                        state.isTopRightActive ? primary : null,
                                    onTap: () => bloc.onArrowPressed(
                                        pointOfImpact: PointOfImpact.topRight),
                                    icon: AppDrawables.topRightArrow),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ArrowButtonWidget(
                                    color: state.isLeftActive ? primary : null,
                                    onTap: () => bloc.onArrowPressed(
                                        pointOfImpact: PointOfImpact.left),
                                    icon: AppDrawables.leftArrow),
                                SvgPicture.asset(AppDrawables.defaultCar),
                                ArrowButtonWidget(
                                    color: state.isRightActive ? primary : null,
                                    onTap: () => bloc.onArrowPressed(
                                        pointOfImpact: PointOfImpact.right),
                                    icon: AppDrawables.rightArrow),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ArrowButtonWidget(
                                    color: state.isBottomLeftActive
                                        ? primary
                                        : null,
                                    onTap: () => bloc.onArrowPressed(
                                        pointOfImpact:
                                            PointOfImpact.bottomLeft),
                                    icon: AppDrawables.bottomLeftArrow),
                                ArrowButtonWidget(
                                    color:
                                        state.isBottomActive ? primary : null,
                                    onTap: () => bloc.onArrowPressed(
                                        pointOfImpact: PointOfImpact.bottom),
                                    icon: AppDrawables.bottomArrow),
                                ArrowButtonWidget(
                                    color: state.isBottomRightActive
                                        ? primary
                                        : null,
                                    onTap: () => bloc.onArrowPressed(
                                        pointOfImpact:
                                            PointOfImpact.bottomRight),
                                    icon: AppDrawables.bottomRightArrow),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  NavigationButton(
                    padding: 0,
                    loading: state.status == Status.loading,
                    onNextTap: () => bloc.onNextPressed(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
