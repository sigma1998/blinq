// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/presentation/create_report/create_report_screen.dart';
import 'package:blinq/presentation/home/bloc/home_screen_cubit.dart';
import 'package:blinq/presentation/home/bloc/home_screen_state.dart';
import 'package:blinq/presentation/home/widgets/map.dart';
import 'package:blinq/presentation/home/widgets/menu_item.dart';
import 'package:blinq/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:blinq/presentation/main_screen/bloc/main_screen_event.dart';
import 'package:blinq/utils/navigation_service.dart';

class HomeMain extends StatefulWidget {
  //
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bloc = context.read<HomeScreenCubit>();

    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      bloc: bloc,
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FadeInLeft(
                        duration: const Duration(milliseconds: 400),
                        child: HomeScreenMenuItem(
                          text: 'strEmergencyContacts'.tr(),
                          icon: AppDrawables.emergencyBook,
                          onTap: () => context.read<MainScreenBloc>()
                            ..add(OnItemPressed(newIndex: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FadeInRight(
                        duration: const Duration(milliseconds: 400),
                        child: BlocBuilder<ConnectToBlinqCubit,
                            ConnectToBlinqState>(
                          builder: (context, state) {
                            final paired = state.bleConnectionState ==
                                BleConnectionState.paired;

                            return HomeScreenMenuItem(
                              text: paired
                                  ? 'strConnectBLINQ'.tr()
                                  : 'strDisconnectBLINQ'.tr(),
                              icon: paired
                                  ? AppDrawables.blinqConnected
                                  : AppDrawables.blinq,
                              onTap: bloc.onConnectToBlinqPressed,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  child: const HomeMap(),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: FadeInLeft(
                        duration: const Duration(milliseconds: 400),
                        child: HomeScreenMenuItem(
                          padding: 10,
                          background: AppDrawables.breakdown,
                          text: 'strBreakDown'.tr(),
                          onTap: bloc.onBreakDownPressed,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FadeInRight(
                        duration: const Duration(milliseconds: 400),
                        child: HomeScreenMenuItem(
                          padding: 10,
                          text: 'strAccident'.tr(),
                          background: AppDrawables.accident,
                          onTap: bloc.onAccidentPressed,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openCreateReportScreen() {
    NavigationService.pushNamed(
      routeName: CreateReportScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
  }
}
