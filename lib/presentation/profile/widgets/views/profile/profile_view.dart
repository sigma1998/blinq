// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'widgets/cards/report_card.dart';
import 'widgets/info.dart';
import 'widgets/vehicle.dart';

class ProfileView extends StatelessWidget {
  //
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ListView(
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
                  onChangeImage: bloc.imagePickerPressed,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              '${state.profile?.firstName} ${state.profile?.lastName}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 54),

            //& Info & Policy

            const ProfileInfoWidget(),
            const SizedBox(height: 94),
            const ProfileVehicleWidget(),
            const SizedBox(height: 20),

            //* Reports & History
            const ProfileReportCard(),
            const SizedBox(height: 54),

            const SafeArea(
              top: false,
              child: SizedBox(height: 16),
            ),
          ],
        );
      },
    );
  }
}
