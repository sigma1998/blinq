import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/step_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/damaged_parts_bloc.dart';
import 'bloc/damaged_parts_state.dart';
import 'widgets/arrows.dart';
import 'widgets/selected_parts_list.dart';
import 'widgets/vehicles.dart';

class DamagedPartsScreen extends StatefulWidget {
  static const String route = 'damaged_parts_screen';

  const DamagedPartsScreen({Key? key}) : super(key: key);

  @override
  State<DamagedPartsScreen> createState() => _DamagedPartsScreenState();
}

class _DamagedPartsScreenState extends State<DamagedPartsScreen> {
  late DamagedPartsBloc bloc;

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)?.settings.arguments as DamagedPartsScreenArgs?;

    bloc = DamagedPartsBloc(
      vehicleType: args?.vehicleType ?? VehicleType.auto,
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
      reportBloc: context.read(),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) {
        return bloc;
      },
      child: BlocBuilder<DamagedPartsBloc, DamagedPartsState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    StepIndicator(
                      currentStep: bloc.getStep(),
                      showTrailingTitle: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'strSelectDamage'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const SelectedPartsList(),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          RepaintBoundary(
                            key: bloc.imagePreview,
                            child: const VehiclesList(),
                          ),
                          if (state.pageIndex < bloc.vehicleSelect.length - 1)
                            Arrow(
                              alignment: Alignment.centerRight,
                              icon: AppDrawables.leftArrow,
                              onTap: () => bloc.setPageIndex(
                                  state.pageIndex + 1, width, context),
                            ),
                          if (state.pageIndex > 0)
                            Arrow(
                              alignment: Alignment.centerLeft,
                              icon: AppDrawables.rightArrow,
                              onTap: () => bloc.setPageIndex(
                                  state.pageIndex - 1, width, context),
                            ),
                        ],
                      ),
                    ),
                    NavigationButton(
                      padding: 0,
                      loading: state.status == Status.loading,
                      onNextTap: () => bloc.onNextTap(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DamagedPartsScreenArgs {
  final VehicleType vehicleType;

  DamagedPartsScreenArgs({required this.vehicleType});
}
