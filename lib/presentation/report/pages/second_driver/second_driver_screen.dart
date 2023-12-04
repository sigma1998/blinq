// Flutter imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/buttons/yes_no_button.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/second_driver_bloc.dart';

class SecondDriverScreen extends StatefulWidget {
  //
  static const route = '/second_driver';

  const SecondDriverScreen({super.key});

  @override
  State<SecondDriverScreen> createState() => _SecondDriverScreenState();
}

class _SecondDriverScreenState extends State<SecondDriverScreen> {
  //
  late SecondDriverBloc bloc;

  @override
  void didChangeDependencies() {
    final id = ModalRoute.of(context)!.settings.arguments as int;

    bloc = SecondDriverBloc(
        repository: getIt<AccidentRepositoryImpl>(), reportBloc: context.read())
      ..onFetchSecondDriver(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondDriverBloc, SecondDriverState>(
      bloc: bloc,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: bloc.onScreenPop,
          child: SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Text(
                      'strIsSecondDriverAccount'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 60),
                    MyImage(
                      '',
                      width: 109,
                      height: 109,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      bloc.state.secondDriver?.fullName ?? '-',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        YesNoButton(
                          onChanged: (v) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              floatingActionButton: NavigationButton(
                loading: state.status == Status.loading,
                onNextTap: bloc.onNextPressed,
                onBack: bloc.onBack,
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
