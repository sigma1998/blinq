// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/widgets/car_positions_section.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/damaged_parts_bloc.dart';
import 'bloc/damaged_parts_state.dart';
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
  final ScrollController pageController = ScrollController();
  final ScrollController listScrollController = ScrollController();
  ValueNotifier<int> valueNotifier = ValueNotifier<int>(0);


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
    return BlocProvider(
      create: (_) {
        return bloc;
      },
      child: BlocBuilder<DamagedPartsBloc, DamagedPartsState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            appBar: ProgressAppBar(
              step: 10,
              onSaveTap: () => bloc.onNextTap(context),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '10. ${'strSelectDamage'.tr()}',
                        style: AppTextStyles.s22W600,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SelectedPartsList(
                      controller: listScrollController,
                    ),
                    SizedBox(height: 24.h),
                    CarPositionsSection(
                      valueNotifier: valueNotifier,
                    ),
                    SizedBox(height: 12.h),
                    Expanded(
                      child: Stack(
                        children: [
                          RepaintBoundary(
                            key: bloc.imagePreview,
                            child: VehiclesList(
                              pageController: pageController,
                              listController: listScrollController,
                              valueNotifier: valueNotifier,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    NavigationButton(
                      padding: 16,
                      loading: state.status == Status.loading,
                      onNextTap: () => bloc.onNextTap(context),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }
}

class DamagedPartsScreenArgs {
  final VehicleType vehicleType;

  DamagedPartsScreenArgs({required this.vehicleType});
}
