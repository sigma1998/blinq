import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/generated/assets.dart';
import 'package:blinq/utils/components/buttons/glass_button.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/locator.dart';
import '../../../../domain/bloc/report_bloc/report_bloc.dart';
import '../../../../domain/repositories/accident_repository.dart';
import '../../../../domain/repositories/profile_repository.dart';
import '../../../../presentation/create_report/bloc/create_report_bloc.dart';
import '../../../smart_widgets/dialogs/blinq_activated/blinq_activated_bloc.dart';

bool isBreakdownAccidentDialogShown = false;

class BreakdownAccident extends StatefulWidget {
  const BreakdownAccident({super.key});

  @override
  State<BreakdownAccident> createState() => _BreakdownAccidentState();
}

class _BreakdownAccidentState extends State<BreakdownAccident> {
  late final CreateReportBloc rBloc;

  @override
  void initState() {
    isBreakdownAccidentDialogShown = true;
    super.initState();
  }

  @override
  void dispose() {
    isBreakdownAccidentDialogShown = false;
    super.dispose();
  }

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GlassContainer(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 16),
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
                        imagePath: Assets.imagesBreakdownNew,
                        onTap: bloc.onBreakDownPressed,
                      ),
                      const SizedBox(width: 12),
                      getBtn(
                        text: 'Accident',
                        imagePath: Assets.imagesAccidentTwoCars,
                        onTap: () {
                          bloc.onAccidentPressed();
                          rBloc.onCreateReportPressed();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  GlassButton(
                    title: 'Yes, I’m okay',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  getBtn({
    required String imagePath,
    required String text,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: SizedBox(
        height: 170.h,
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
