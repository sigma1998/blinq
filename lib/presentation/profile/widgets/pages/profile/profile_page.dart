// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'widgets/info.dart';
import 'widgets/vehicle.dart';

class ProfilePage extends StatelessWidget {
  //
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final isLoading = state.status == Status.loading;

        return isLoading
            ? const Loading()
            : ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: MyImage(
                          state.profile?.image ?? '',
                          width: 150,
                          height: 150,
                          userName: state.profile?.firstName,
                          onChangeImage: bloc.imagePickerPressed,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '${state.profile?.firstName} ${state.profile?.lastName}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  carInformationBtn(state, bloc),
                  const SizedBox(height: 54),

                  //& Info & Policy

                  const ProfileInfoWidget(),
                  const SizedBox(height: 94),
                  const ProfileVehicleWidget(),
                  const SizedBox(height: 20),

                  //* Reports & History
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

  carInformationBtn(ProfileState state, ProfileBloc bloc) {
    final hasBrand =
        state.profile?.car?.brand != null && state.profile?.car?.brand != '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (!hasBrand) {
              bloc.onVehiclePressed();
            }
          },
          child: Container(
            height: 36,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.activeReportColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                if (!hasBrand) ...[
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  hasBrand ? state.profile!.car!.brand! : 'Add car information',
                  style: AppTextStyles.s15W600.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
