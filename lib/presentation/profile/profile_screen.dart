// Flutter imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/tab_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/profile_event.dart';
import 'widgets/views/profile/profile_view.dart';
import 'widgets/views/settings/settings_view.dart';

class ProfileScreen extends StatefulWidget {
  //
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  //
  late TabController _tabController;

  @override
  void initState() {
    context.read<ProfileBloc>().add(OnFetchProfile());
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              'strMyProfile'.tr(),
              'strSettings'.tr(),
            ],
            tabController: _tabController,
            margin: const EdgeInsets.symmetric(horizontal: 72),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ProfileView(),
                SettingsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
