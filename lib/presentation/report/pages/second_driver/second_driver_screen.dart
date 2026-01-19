// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/animations/connecting_animation.dart';
import 'package:blinq/utils/components/app_bar/accident_app_bar.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/components/items/name_first_letter.dart';
import '../../../profile/bloc/profile_bloc.dart';
import 'cubit/second_driver_cubit.dart';

class SecondDriverScreen extends StatefulWidget {
  //
  static const route = '/second_driver';

  const SecondDriverScreen({super.key});

  @override
  State<SecondDriverScreen> createState() => _SecondDriverScreenState();
}

class _SecondDriverScreenState extends State<SecondDriverScreen> {
  //
  SecondDriverCubit? cubit;

  @override
  void didChangeDependencies() {
    final id = ModalRoute.of(context)!.settings.arguments as int;

    if (cubit != null) return;

    cubit = SecondDriverCubit(
        repository: getIt<AccidentRepositoryImpl>(), reportBloc: context.read())
      ..onFetchSecondDriver(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondDriverCubit, SecondDriverState>(
      bloc: cubit,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: cubit?.onScreenPop,
          child: SafeArea(
            child: Scaffold(
              appBar: const AccidentAppBar(),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        state.status == Status.loading
                            ? 'Collecting data...'
                            : 'strIsSecondDriverAccount'.tr(),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.s28W600,
                      ),
                      const SizedBox(height: 60),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: AppColors.darkGrey,
                            border: Border.all(
                              color: state.status == Status.failure
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                          child: state.status == Status.loading
                              ? BlocBuilder<ProfileBloc, ProfileState>(
                                  builder: (context, pState) {
                                    return Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColors.grey1)),
                                          child: (state.secondDriver?.image
                                                      ?.isNotEmpty ??
                                                  false)
                                              ? MyImage(
                                                  state.secondDriver?.image ??
                                                      '',
                                                  width: 86,
                                                  height: 86,
                                                )
                                              : NameFirstLetter(
                                                  name: state
                                                      .secondDriver?.fullName,
                                                  size: 86,
                                                ),
                                        ),
                                        const SizedBox(height: 24),
                                        const ConnectingAnimation(),
                                        const SizedBox(height: 24),
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColors.grey1)),
                                          child: (pState.profile?.image
                                                      ?.isNotEmpty ??
                                                  false)
                                              ? MyImage(
                                                  pState.profile?.image ?? '',
                                                  width: 86,
                                                  height: 86,
                                                )
                                              : NameFirstLetter(
                                                  name:
                                                      pState.profile?.fullName,
                                                  size: 86,
                                                ),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              : Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: AppColors.grey1)),
                                      child: MyImage(
                                        state.secondDriver?.image ?? '',
                                        width: 86,
                                        height: 86,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Text(
                                      cubit?.state.secondDriver?.fullName ??
                                          '-',
                                      style: AppTextStyles.s28W600,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      RegularButton(
                        padding: 0,
                        title: state.status == Status.failure
                            ? 'Scan QR code'
                            : 'Yes',
                        onTap: state.status == Status.failure
                            ? () {
                                cubit?.toQrScanning();
                              }
                            : () {
                                cubit?.onValueChanged(true);
                                cubit?.onNextPressed();
                              },
                      ),
                      SizedBox(height: 12.h),
                      RegularButton(
                        padding: 0,
                        background: AppColors.darkGrey,
                        title: state.status == Status.failure
                            ? 'The second driver does not have a BLINQ'
                            : 'No',
                        onTap: state.status == Status.failure
                            ? () {
                                cubit?.onBack();
                              }
                            : () {
                                cubit?.onValueChanged(false);
                                cubit?.onBack();
                              },
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
