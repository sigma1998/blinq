import 'dart:ui';

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/generated/assets.dart';
import 'package:blinq/utils/components/wrappers/bottom_sheet_wrapper.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
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
        return BottomSheetGlassWrapper(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(height: 8),
              // getItem(0, widget.onEmergencyPressed),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'What do you need help with?',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s26W700.copyWith(fontSize: 24),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              getItem(1, widget.onBreakdownPressed),
              SizedBox(height: 24.h),
              getItem(2, () {
                widget.onAccidentPressed();
                bloc.onCreateReportPressed();
              }),
            ],
          ),
        );
      },
    );
  }

  getItem(int index, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        radius: 16,
        padding: EdgeInsets.all(8.h),
        tint: 0.1,
        blur: 2,
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
                    style: AppTextStyles.s16W700.copyWith(color: AppColors.white),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColors.white,
                ),
                const SizedBox(width: 8),
              ],
            ),
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
    Assets.imagesAccidentNew,
    Assets.imagesCarCrashNew,
  ];
}
