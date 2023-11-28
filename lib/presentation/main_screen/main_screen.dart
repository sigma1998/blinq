// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/presentation/main_screen/main_screen_event.dart';
import 'package:blinq/presentation/profile/profile_screen.dart';
import 'package:blinq/presentation/contacts/contacts.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/presentation/home/home.dart';
import 'main_screen_bloc.dart';

class MainScreen extends StatefulWidget {
  //
  static const String route = '/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //

  @override
  void initState() {
    super.initState();
    context.read<ConnectToBlinqCubit>().connectPreviousDevices();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, GenericBlocState<int>>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: context.read<MainScreenBloc>().onWillPop,
          child: Scaffold(
            extendBody: true,
            body: IndexedStack(
              index: state.data,
              children: const [
                Home(),
                Contacts(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(
                bottom: 38,
                right: 16,
                left: 16,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: Container(
                    height: 64,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => context
                              .read<MainScreenBloc>()
                              .add(OnItemPressed(newIndex: 0)),
                          child: SvgPicture.asset(
                            AppDrawables.blinq,
                            colorFilter: ColorFilter.mode(
                                state.data == 0
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSecondary,
                                BlendMode.srcIn),
                          ),
                        ),
                        InkWell(
                          onTap: () => context
                              .read<MainScreenBloc>()
                              .add(OnItemPressed(newIndex: 1)),
                          child: SvgPicture.asset(AppDrawables.contacts,
                              colorFilter: ColorFilter.mode(
                                  state.data == 1
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                  BlendMode.srcIn)),
                        ),
                        InkWell(
                          onTap: () => context
                              .read<MainScreenBloc>()
                              .add(OnItemPressed(newIndex: 2)),
                          child: SvgPicture.asset(AppDrawables.profile,
                              colorFilter: ColorFilter.mode(
                                  state.data == 2
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                  BlendMode.srcIn)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
