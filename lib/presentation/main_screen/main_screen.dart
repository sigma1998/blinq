// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/presentation/contacts/contacts.dart';
import 'package:blinq/presentation/home/home.dart';
import 'package:blinq/presentation/profile/profile_screen.dart';
import 'package:blinq/utils/custom_widgets/salomon_bottom_bar.dart';
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
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.4),
                      ),
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SalomonBottomBar(
                        currentIndex: state.data!,
                        curve: Curves.linearToEaseOut,
                        itemPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 24,
                        ),
                        onTap: (index) =>
                            bloc.add(OnItemPressed(newIndex: index)),
                        items: [
                          _buildBottomBarItem(
                            title: 'strHome'.tr(),
                            icon: AppDrawables.blinq,
                            activeIcon: AppDrawables.blinq,
                          ),
                          _buildBottomBarItem(
                            title: 'strContacts'.tr(),
                            icon: AppDrawables.contacts,
                            activeIcon: AppDrawables.contacts,
                          ),
                          _buildBottomBarItem(
                            title: 'strProfile'.tr(),
                            icon: AppDrawables.profile,
                            activeIcon: AppDrawables.profile,
                          ),
                        ],
                      ),
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

  SalomonBottomBarItem _buildBottomBarItem({
    required String icon,
    required String title,
    required String activeIcon,
  }) {
    return SalomonBottomBarItem(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
      icon: SvgPicture.asset(
        icon,
      ),
      activeIcon: SvgPicture.asset(
        activeIcon,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      selectedColor: Theme.of(context).colorScheme.outline,
    );
  }
}
