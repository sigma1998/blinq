// Flutter imports:
import 'package:animate_do/animate_do.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/create_report/create_report_screen.dart';
import 'package:blinq/presentation/home/bloc/home_screen_cubit.dart';
import 'package:blinq/presentation/home/bloc/home_screen_state.dart';
import 'package:blinq/presentation/home/widgets/map.dart';
import 'package:blinq/presentation/home/widgets/menu_item.dart';
import 'package:blinq/presentation/report/pages/damaged_media/damaged_media_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMain extends StatelessWidget {
  //
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
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
                          onTap: () {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FadeInRight(
                        duration: const Duration(milliseconds: 400),
                        child: HomeScreenMenuItem(
                          text: state.isBlinqConnected
                              ? 'strConnectBLINQ'.tr()
                              : 'strDisconnectBLINQ'.tr(),
                          icon: state.isBlinqConnected
                              ? AppDrawables.blinqConnected
                              : AppDrawables.blinq,
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInDown(
                    duration: const Duration(milliseconds: 500),
                    child: const HomeMap()),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FadeInLeft(
                        duration: const Duration(milliseconds: 400),
                        child: HomeScreenMenuItem(
                          padding: 10,
                          background: AppDrawables.breakdown,
                          text: 'strBreakDown'.tr(),
                          onTap: () {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FadeInRight(
                        duration: const Duration(milliseconds: 400),
                        child: HomeScreenMenuItem(
                          padding: 10,
                          text: 'strAccident'.tr(),
                          background: AppDrawables.accident,
                          onTap: () {
                            NavigationService.pushNamed(
                              routeName: DamagedMediaScreen.route,
                              // nestedKey: NavigationService.homeNavigatorKey,
                            );
                          },
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
