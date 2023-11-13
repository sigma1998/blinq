// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project improts:
import 'package:blinq/presentation/home/bloc/home_screen_cubit.dart';
import 'package:blinq/utils/custom_widgets/tab_bar.dart';
import 'pages/home_main.dart';
import 'pages/info.dart';

class HomeScreen extends StatefulWidget {
  //
  static const String route = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //
  late TabController _tabController;
  late HomeScreenCubit homeScreenCubit;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    homeScreenCubit = HomeScreenCubit();
    super.initState();
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
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: 0,
                backgroundColor: Colors.transparent,
              ),
              body: Column(
                children: [
                  MyTabBar(
                    tabLabels: [
                      'strMyBlinq'.tr(),
                      'strInfo'.tr(),
                    ],
                    tabController: _tabController,
                    margin: const EdgeInsets.symmetric(horizontal: 72),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [HomeMain(), HomeInfo()],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
