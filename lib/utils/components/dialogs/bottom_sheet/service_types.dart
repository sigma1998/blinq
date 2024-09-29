import 'dart:ui';

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../domain/bloc/report_bloc/report_bloc.dart';
import '../../../../domain/repositories/accident_repository.dart';
import '../../../../domain/repositories/profile_repository.dart';
import '../../../../presentation/create_report/bloc/create_report_bloc.dart';
import '../../../generic_bloc_state.dart';

class ServiceTypes extends StatefulWidget {
  final VoidCallback onEmergencyPressed;
  final VoidCallback onBreakdownPressed;
  final VoidCallback onAccidentPressed;

  const ServiceTypes({
    super.key,
    required this.onEmergencyPressed,
    required this.onBreakdownPressed,
    required this.onAccidentPressed,
  });

  @override
  State<ServiceTypes> createState() => _ServiceTypesState();
}

class _ServiceTypesState extends State<ServiceTypes> {
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
    return BlocBuilder<CreateReportBloc, GenericBlocState>(
      bloc: bloc,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.white.withOpacity(0.8),
                        AppColors.white.withOpacity(0.06),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.darkGrey.withOpacity(0.63),
                          AppColors.darkGrey.withOpacity(0.06),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 36,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        const SizedBox(height: 8),
                        getItem(0, widget.onEmergencyPressed),
                        SizedBox(height: 12.h),
                        getItem(1, widget.onBreakdownPressed),
                        SizedBox(height: 12.h),
                        getItem(2, () {
                          widget.onAccidentPressed();
                          bloc.onCreateReportPressed();
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100.h),
          ],
        );
      },
    );
  }

  getItem(int index, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(images[index]),
            SizedBox(height: 16.h),
            Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    texts[index],
                    style:
                        AppTextStyles.s16W700.copyWith(color: AppColors.white),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColors.white,
                ),
                const SizedBox(width: 8),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  final List<String> texts = [
    'Emergency services',
    'Breakdown',
    'Accident',
  ];
  final List<String> images = [
    AppDrawables.emergency,
    AppDrawables.breakdownImage,
    AppDrawables.accidentImage,
  ];
}
