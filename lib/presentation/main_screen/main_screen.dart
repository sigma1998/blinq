// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/presentation/profile/profile_screen.dart';
import 'package:blinq/presentation/contacts/contacts.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/presentation/home/home.dart';
import 'bloc/main_screen_bloc.dart';
import 'bloc/main_screen_event.dart';
import 'widgets/item.dart';

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
    final bloc = context.read<MainScreenBloc>();

    return BlocBuilder<MainScreenBloc, GenericBlocState<int>>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: bloc.onWillPop,
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
                        MainBottomNavigationItem(
                          icon: AppDrawables.blinq,
                          isActive: state.data == 0,
                          onTap: () => bloc.add(OnItemPressed(newIndex: 0)),
                        ),
                        MainBottomNavigationItem(
                          icon: AppDrawables.contacts,
                          isActive: state.data == 1,
                          onTap: () => bloc.add(OnItemPressed(newIndex: 1)),
                        ),
                        MainBottomNavigationItem(
                          icon: AppDrawables.profile,
                          isActive: state.data == 2,
                          onTap: () => bloc.add(OnItemPressed(newIndex: 2)),
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
