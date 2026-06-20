// Flutter imports:

import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/generated/assets.dart';
import 'package:blinq/utils/components/app_bar/accident_app_bar.dart';
import 'package:blinq/utils/components/buttons/glass_button.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:blinq/utils/components/wrappers/screen_background.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cubit/connect_to_driver_cubit.dart';

class ConnectToDriverScreen extends StatefulWidget {
  //
  static const route = '/connect_to_driver';

  const ConnectToDriverScreen({super.key});

  @override
  State<ConnectToDriverScreen> createState() => _ConnectToDriverScreenState();
}

class _ConnectToDriverScreenState extends State<ConnectToDriverScreen> {
  late ConnectToDriverCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = ConnectToDriverCubit(
      reportBloc: context.read<ReportBloc>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
    );
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectToDriverCubit, ConnectToDriverState>(
      bloc: cubit,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: cubit.onWillPop,
          child: ScreenBackground(
            body: Column(
              children: [
                SizedBox(height: 16.h),
                AccidentAppBar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        SizedBox(height: 200.h),
                        SizedBox(
                          width: 96,
                          height: 96,
                          child: GlassContainer(
                            isCircle: true,
                            child: SvgPicture.asset(
                              Assets.iconsSecondDriverIcon
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'strSecondDriverBlinq'.tr(),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.s28W600,
                        ),
                        const Spacer(),
                        GlassButton(
                          title: 'strYes'.tr(),
                          backgroundColor: AppColors.primaryColor,
                          tint: 0.6,
                          onTap: () {
                            cubit.onHasBlinqChanged(true);
                            cubit.onNextPressed();
                          },
                        ),
                        const SizedBox(height: 8),
                        GlassButton(
                          title: 'strNo'.tr(),
                          tint: 0.15,
                          onTap: () {
                            cubit.onHasBlinqChanged(false);
                            cubit.onNextPressed();
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
