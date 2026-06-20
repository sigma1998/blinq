// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:blinq/presentation/map/map_screen.dart';
import 'package:blinq/utils/components/bot_navs/main_bot_navs.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/presentation/contacts/contacts.dart';
import 'package:blinq/presentation/home/home.dart';
import 'package:blinq/presentation/profile/profile_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/main_screen_bloc.dart';
import 'bloc/main_screen_event.dart';

class MainScreen extends StatefulWidget {
  //
  static const String route = '/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<ConnectToBlinqCubit>().connectPreviousDevices();
  }

  bool canPop() {
    if (currentIndex == 0) {
      if (NavigationService.homeNavigatorKey.currentState?.canPop() ?? false) {
        NavigationService.homeNavigatorKey.currentState?.pop();
        return false;
      }
      return true;
    } else if (currentIndex == 1) {
      if (NavigationService.contactsNavigatorKey.currentState?.canPop() ?? false) {
        NavigationService.contactsNavigatorKey.currentState?.pop();
        return false;
      }
      return true;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainScreenBloc>();

    return BlocBuilder<MainScreenBloc, GenericBlocState<int>>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (currentIndex == 0) {
              if (NavigationService.homeNavigatorKey.currentState?.canPop() ?? false) {
                NavigationService.homeNavigatorKey.currentState?.pop();
                return false;
              }
              return true;
            } else if (currentIndex == 1) {
              if (NavigationService.contactsNavigatorKey.currentState?.canPop() ?? false) {
                NavigationService.contactsNavigatorKey.currentState?.pop();
                return false;
              }
              return true;
            } else {
              return true;
            }
          },
          child: Scaffold(
            extendBody: true,
            body: IndexedStack(
              index: state.data,
              children: const [
                Home(),
                MapScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: MainBotNav(
                  currentIndex: state.data ?? currentIndex,
                  onTap: (int index) {
                    setState(() {
                      currentIndex = index;
                      bloc.add(OnItemPressed(newIndex: index));
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
