// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/buttons/yes_no_button.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
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
                        onChanged: cubit.onHasBlinqChanged,
                      ),
                    ],
                  ),
                ],
              ),
              resizeToAvoidBottomInset: false,
              floatingActionButton: NavigationButton(
                onBack: cubit.onBack,
                onNextTap: cubit.onNextPressed,
                canGoForward: cubit.isNextEnabled,
                loading: state.status == Status.loading,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ),
        );
      },
    );
  }
}
