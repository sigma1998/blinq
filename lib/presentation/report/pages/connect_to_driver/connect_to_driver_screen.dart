// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/buttons/yes_no_button.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'cubit/connect_to_driver_cubit.dart';
import 'package:blinq/app/locator.dart';

class ConnectToDriverScreen extends StatelessWidget {
  //
  static const route = '/connect_to_driver';

  const ConnectToDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ConnectToDriverCubit(
      reportBloc: context.read<ReportBloc>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
    );

    return BlocBuilder<ConnectToDriverCubit, ConnectToDriverState>(
      bloc: cubit,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: ListView(
              padding: const EdgeInsets.all(32),
              physics: const ClampingScrollPhysics(),
              children: [
                const SizedBox(height: 50),
                Text(
                  'strSecondDriverBlinq'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 118),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    YesNoButton(
                      onChanged: cubit.onValueChanged,
                    ),
                  ],
                ),
              ],
            ),
            resizeToAvoidBottomInset: false,
            floatingActionButton: NavigationButton(
              onNextTap: cubit.onNextPressed,
              canGoForward: state.hasBlinq != null,
              loading: state.status == Status.loading,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ),
        );
      },
    );
  }
}
