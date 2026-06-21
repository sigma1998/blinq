// Flutter imports:
import 'package:blinq/presentation/profile/widgets/pages/settings/settings_page.dart';
import 'package:blinq/utils/components/wrappers/screen_background.dart';
import 'package:blinq/utils/custom_widgets/tab_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'bloc/profile_event.dart';
import 'widgets/pages/profile/profile_page.dart';

class ProfileScreen extends StatefulWidget {
  //
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
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
    return ScreenBackground(
      darBackground: false,
      body: ProfilePage(),
    );
  }
}
