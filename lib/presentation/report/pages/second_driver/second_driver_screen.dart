// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/buttons/yes_no_button.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'cubit/second_driver_cubit.dart';

class SecondDriverScreen extends StatefulWidget {
  //
  static const route = '/second_driver';

  const SecondDriverScreen({super.key});

  @override
  State<SecondDriverScreen> createState() => _SecondDriverScreenState();
}

class _SecondDriverScreenState extends State<SecondDriverScreen> {
  //
  late SecondDriverCubit cubit;

  @override
  void didChangeDependencies() {
    final id = ModalRoute.of(context)!.settings.arguments as int;

    cubit = SecondDriverCubit(
        repository: getIt<AccidentRepositoryImpl>(), reportBloc: context.read())
      ..onFetchSecondDriver(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondDriverCubit, SecondDriverState>(
      bloc: cubit,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: cubit.onScreenPop,
          child: SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        state.status == Status.loading
                            ? 'strWaitingForRes'.tr()
                            : 'strIsSecondDriverAccount'.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 60),
                      MyImage(
                        state.secondDriver?.image ?? '',
                        width: 109,
                        height: 109,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        cubit.state.secondDriver?.fullName ?? '-',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // const SizedBox(height: 10),
                      // Text(
                      //   'strSecondDriverName'.tr(),
                      //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      //         color: Theme.of(context).colorScheme.onSecondary,
                      //       ),
                      // ),
                      const SizedBox(height: 120),
                      if (state.status != Status.loading)
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
                ),
              ),
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
