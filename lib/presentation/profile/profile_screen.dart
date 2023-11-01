// Flutter imports:
import 'package:blinq/app/locator.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/profile_bloc.dart';
import 'bloc/profile_event.dart';
import 'widgets/editors/user_info/user_info_editor.dart';
import 'widgets/sections/accident/accident_reports_section.dart';
import 'widgets/sections/breakdown/breakdown_reports_section.dart';
import 'widgets/sections/order_history/order_history_section.dart';
import 'widgets/sections/car_policy/car_policy_section.dart';
import 'widgets/sections/user_info/bloc/user_info_bloc.dart';
import 'widgets/sections/user_info/user_info_section.dart';
import 'widgets/sections/vehicle/vehicle_section.dart';

class ProfileScreen extends StatefulWidget {
  //
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //
  late final ProfileBloc bloc;
  late final ProfileUserInfoBloc userInfoBloc;

  @override
  void initState() {
    bloc = ProfileBloc(repository: getIt<ProfileRepositoryImpl>());
    userInfoBloc = ProfileUserInfoBloc();

    bloc.add(OnFetchProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => bloc,
        ),
        BlocProvider<ProfileUserInfoBloc>(
          create: (context) => userInfoBloc,
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return KeyboardEscape(
            child: Scaffold(
              body: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 38),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyImage(
                        state.profile?.image ?? '',
                        width: 86,
                        height: 86,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${state.profile?.firstName} ${state.profile?.lastName}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  //& Info & Policy

                  BlocBuilder<ProfileUserInfoBloc, GenericBlocState<bool>>(
                    builder: (context, state) {
                      if (state.data!) {
                        return const ProfileUserInfoEditor();
                      } else {
                        return const ProfileUserInfoSection();
                      }
                    },
                  ),
                  const SizedBox(height: 54),
                  const ProfileVehicleSection(),
                  const SizedBox(height: 54),
                  const ProfileCarPolicySection(),
                  const SizedBox(height: 54),

                  //* Reports & History

                  const ProfileOrderHistorySection(),
                  const SizedBox(height: 36),
                  const ProfileAccidentReportsSection(),
                  const SizedBox(height: 36),
                  const ProfileBreakdownReportsSection(),
                  const SafeArea(
                    top: false,
                    child: SizedBox(height: 16),
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
