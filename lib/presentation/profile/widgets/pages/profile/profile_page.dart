// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      ///user data section
                      SizedBox(
                        child: GlassContainer(
                          child: Column(
                            children: [
                              SizedBox(height: 26.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: bloc.imagePickerPressed,
                                    child: SizedBox(
                                      width: 140,
                                      child: MyImage(
                                        state.profile?.image ?? '',
                                        width: 140,
                                        height: 140,
                                        userName: state.profile?.firstName,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '${state.profile?.firstName} ${state.profile?.lastName}',
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              carInformationBtn(state, bloc),
                              const SizedBox(height: 26),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      //& Info & Policy

                      const ProfileInfoWidget(),
                      const SizedBox(height: 24),
                      const ProfileVehicleWidget(),
                      const SizedBox(height: 24),

                      //* Reports & History
                      const SizedBox(height: 54),

                      const SafeArea(
                        top: false,
                        child: SizedBox(height: 16),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Row carInformationBtn(ProfileState state, ProfileBloc bloc) {
    final hasBrand = state.profile?.car?.brand != null && state.profile?.car?.brand != '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (!hasBrand) {
              bloc.onVehiclePressed();
            }
          },
          child: GlassContainer(
            tint: 0.3,
            radius: 8,
            tintColor: AppColors.activeReportColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                hasBrand ? state.profile!.car!.brand! : 'Add car information',
                style: AppTextStyles.s15W600.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
