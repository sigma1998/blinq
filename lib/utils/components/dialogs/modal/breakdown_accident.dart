import 'dart:ui';

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:blinq/utils/components/containers/horizontal_top_container.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/locator.dart';
import '../../../../domain/bloc/report_bloc/report_bloc.dart';
import '../../../../domain/repositories/accident_repository.dart';
import '../../../../domain/repositories/profile_repository.dart';
import '../../../../presentation/create_report/bloc/create_report_bloc.dart';
import '../../../smart_widgets/dialogs/blinq_activated/blinq_activated_bloc.dart';

class BreakdownAccident extends StatefulWidget {
  const BreakdownAccident({super.key});

  @override
  State<BreakdownAccident> createState() => _BreakdownAccidentState();
}

class _BreakdownAccidentState extends State<BreakdownAccident> {
  late final CreateReportBloc rBloc;

  @override
  void didChangeDependencies() {
    rBloc = CreateReportBloc(
      profileRepository: getIt<ProfileRepositoryImpl>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      reportBloc: context.read<ReportBloc>(),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlinqActivatedBloc(reportBloc: context.read<ReportBloc>());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: HorizontalTopContainer(
            child: Column(
              children: [
                const Text(
                  'BLINQ activated',
                  style: AppTextStyles.s28W600,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Hey! Are you OK? How can we help you?',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s15W400,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    getBtn(
                      text: 'Breakdown',
                      imagePath: AppDrawables.accidentCar,
                      onTap: bloc.onBreakDownPressed,
                    ),
                    const SizedBox(width: 12),
                    getBtn(
                      text: 'Accident',
                      imagePath: AppDrawables.accidentImage,
                      onTap: () {
                        bloc.onAccidentPressed();
                        rBloc.onCreateReportPressed();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                RegularButton(
                  padding: 0,
                  title: 'Yes, I’m okay',
                  background: AppColors.darkGrey,
                  borderColor: AppColors.grey1,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  getBtn({
    required String imagePath,
    required String text,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            border: Border.all(
              color: AppColors.grey2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      imagePath,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                text,
                style: AppTextStyles.s16W700,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
