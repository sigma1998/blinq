import 'package:blinq/generated/assets.dart';
import 'package:blinq/presentation/home/widgets/main_bluetooth_section.dart';
import 'package:blinq/presentation/inform_close_ones/inform_close_ones_screen.dart';
import 'package:blinq/utils/components/buttons/main_help_button.dart';
import 'package:blinq/utils/components/wrappers/screen_background.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blinq/presentation/home/bloc/home_screen_cubit.dart';
import 'package:blinq/utils/services/notification/notification_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/drawables/app_drawables.dart';
import '../../utils/components/dialogs/bottom_sheet/service_types.dart';
import '../../utils/services/dialogs/bottom_sheet.dart';
import '../connect_to_blinq/cubit/connect_to_blinq_cubit.dart';

class HomeScreen extends StatefulWidget {
  //
  static const String route = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  //
  late TabController _tabController;
  late HomeScreenCubit homeScreenCubit;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    NotificationService.setupNotificationService();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    homeScreenCubit = HomeScreenCubit(
      reportBloc: context.read(),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    homeScreenCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => homeScreenCubit,
      child: BlocBuilder(
        bloc: homeScreenCubit,
        builder: (context, state) {
          return ScreenBackground(
            darBackground: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  BlocBuilder<ConnectToBlinqCubit, ConnectToBlinqState>(
                    builder: (context, state) {
                      final paired = state.recentlyConnected != null && state.bleConnectionState == BleConnectionState.paired;

                      ///bluetooth
                      return MainBluetoothSection(
                        recentlyConnected: state.recentlyConnected,
                        onConnectTap: homeScreenCubit.onConnectToBlinqPressed,
                        paired: paired,
                      );
                    },
                  ),
                  SizedBox(height: 34.h),

                  ///help button
                  MainHelpButton(
                    onTap: () {
                      showCustomBottomSheet(
                        context: context,
                        child: ServiceTypes(
                          onAccidentPressed: homeScreenCubit.onAccidentPressed,
                          onBreakdownPressed: homeScreenCubit.onBreakDownPressed,
                          onEmergencyPressed: () {
                            NavigationService.pushNamed(routeName: InformCloseOnesScreen.route);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
