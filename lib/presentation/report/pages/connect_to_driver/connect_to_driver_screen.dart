// Flutter imports:

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/app_bar/accident_app_bar.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
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
          child: SafeArea(
            child: Scaffold(
              appBar: const AccidentAppBar(),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      AppDrawables.haveBlinqIcon,
                      width: 96,
                      height: 96,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'strSecondDriverBlinq'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s34W600,
                    ),
                    // const SizedBox(height: 118),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     YesNoButton(
                    //       onChanged: cubit.onHasBlinqChanged,
                    //     ),
                    //   ],
                    // ),
                    const Spacer(),
                    RegularButton(
                      title: 'strYes'.tr(),
                      padding: 0,
                      onTap: () {
                        cubit.onHasBlinqChanged(true);
                        cubit.onNextPressed();
                      },
                    ),
                    const SizedBox(height: 8),
                    RegularButton(
                      padding: 0,
                      title: 'strNo'.tr(),
                      background: AppColors.darkGrey,
                      onTap: () {
                        cubit.onHasBlinqChanged(false);
                        cubit.onNextPressed();
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              resizeToAvoidBottomInset: false,
              // floatingActionButton: NavigationButton(
              //   padding: 16,
              //   onBack: cubit.onBack,
              //   onNextTap: cubit.onNextPressed,
              //   canGoForward: cubit.isNextEnabled,
              //   loading: state.status == Status.loading,
              // ),
              // floatingActionButtonLocation:
              //     FloatingActionButtonLocation.centerFloat,
            ),
          ),
        );
      },
    );
  }
}
