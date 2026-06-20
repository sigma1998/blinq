// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/components/app_bar/back_app_bar.dart';
import 'package:blinq/utils/components/buttons/finish_button.dart';
import 'package:blinq/utils/components/buttons/glass_button.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:blinq/utils/components/wrappers/screen_background.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/finished/bloc/finishied_screen_bloc.dart';
import 'package:blinq/utils/custom_widgets/loading/blinq_loading.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

import '../../../../utils/navigation_service.dart';
import '../../../home/home_screen.dart';
import '../../../profile/bloc/profile_bloc.dart';

class FinishedScreen extends StatefulWidget {
  //
  static const route = '/finished';

  const FinishedScreen({super.key});

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> with TickerProviderStateMixin {
  bool animationIsFinished = false;
  bool completed = false;

  late final AnimationController _controller;

  late final FinishedScreenBloc bloc;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    bloc = FinishedScreenBloc(
      reportBloc: context.read(),
      profileBloc: context.read(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
    );
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rBloc = context.read<ReportBloc>();
    return BlocBuilder<FinishedScreenBloc, GenericBlocState<String>>(
      bloc: bloc,
      builder: (context, state) {
        return ScreenBackground(
          darBackground: false,
          body: Column(
            children: [
              SizedBox(height: 20),
              BackAppBar(
                onTap: () {
                  NavigationService.newRootScreen(
                    HomeScreen.route,
                    nestedKey: NavigationService.homeNavigatorKey,
                  );
                },
              ),
              Expanded(
                child: state.status == Status.loading
                    ? const BlinqLoading()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: (!animationIsFinished && !completed)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 100.h),
                                  Center(
                                    child: Lottie.asset(
                                      AppDrawables.successAnim,
                                      repeat: false,
                                      controller: _controller,
                                      onLoaded: (composition) {
                                        _controller
                                          ..duration = composition.duration
                                          ..forward().whenComplete(() {
                                            animationIsFinished = true;
                                            updateState();
                                          });
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'strYouhavefinishedthedamagereport'.tr(),
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.s34W600,
                                  ),
                                  // SizedBox(height: 200.h),
                                  // GlassButton(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       completed = true;
                                  //     });
                                  //   },
                                  //   title: 'Complete',
                                  // ),
                                ],
                              )
                            : BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                                  return ListView(
                                    children: [
                                      SizedBox(height: 12),
                                      const Text(
                                        'You have finished the damage report!',
                                        style: AppTextStyles.s34W600,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Send to',
                                        style: AppTextStyles.s15W400.copyWith(
                                          color: AppColors.lightGreyVariant,
                                        ),
                                      ),
                                      SizedBox(height: 32.h),
                                      FinishButton(
                                        email: state.profile?.email ?? '',
                                        text: 'My email',
                                        iconPath: AppDrawables.myEmail,
                                        onTap: bloc.onSendEmail,
                                      ),
                                      if (rBloc.secondUser != null)
                                        Column(
                                          children: [
                                            SizedBox(height: 32.h),
                                            FinishButton(
                                              email: rBloc.secondUser?.email ?? '',
                                              text: rBloc.secondUser?.firstName ?? '',
                                              iconPath: AppDrawables.myEmail,
                                              onTap: () {
                                                bloc.onSendEmail(email: rBloc.secondUser?.email);
                                              },
                                            ),
                                          ],
                                        ),
                                      SizedBox(height: 12.h),
                                      FinishButton(
                                        email: state.profile?.insurance?.email ?? '',
                                        text: 'Insurance email',
                                        iconPath: AppDrawables.insuranceEmail,
                                        onTap: bloc.onSendInsurance,
                                      ),
                                      SizedBox(height: 24.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 1,
                                              color: AppColors.grey2,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          const Text(
                                            'or',
                                            style: AppTextStyles.s13W400,
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Container(
                                              height: 1,
                                              color: AppColors.grey2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 24.h),
                                      Row(
                                        children: [
                                          getBtn(
                                            iconPath: AppDrawables.messageSend,
                                            onTap: bloc.onSendTelegram,
                                          ),
                                          const SizedBox(width: 12),
                                          getBtn(
                                            iconPath: AppDrawables.call,
                                            onTap: bloc.onSendWhatsApp,
                                          ),
                                          const SizedBox(width: 12),
                                          getBtn(
                                            iconPath: AppDrawables.sendMessage,
                                            onTap: bloc.onSendEmail,
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: 24.h),
                                      // RegularButton(
                                      //   padding: 0,
                                      //   title: 'Complete',
                                      //   onTap: () {
                                      //     NavigationService.newRootScreen(
                                      //       HomeScreen.route,
                                      //       nestedKey: NavigationService.homeNavigatorKey,
                                      //     );
                                      //   },
                                      // ),

                                      // SvgPicture.asset(
                                      //   AppDrawables.blinq,
                                      //   width: 84,
                                      //   height: 75,
                                      //   colorFilter: ColorFilter.mode(
                                      //     Theme.of(context).colorScheme.primary,
                                      //     BlendMode.srcIn,
                                      //   ),
                                      // ),
                                      // const SizedBox(height: 24),
                                      // Text(
                                      //   'strYouhavefinishedthedamagereport'.tr(),
                                      //   textAlign: TextAlign.center,
                                      //   style: Theme.of(context).textTheme.titleLarge,
                                      // ),
                                      // const SizedBox(height: 32),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: [
                                      //     SvgPicture.asset(
                                      //       AppDrawables.share,
                                      //       width: 36,
                                      //     ),
                                      //     const SizedBox(width: 8),
                                      //     Text(
                                      //       'strSendto'.tr(),
                                      //       style: Theme.of(context).textTheme.titleMedium,
                                      //     ),
                                      //   ],
                                      // ),
                                      // const SizedBox(height: 32),
                                      // FinishedShareItem.insurance(
                                      //   onTap: bloc.onSendInsurance,
                                      // ),
                                      // const SizedBox(height: 8),
                                      // Divider(
                                      //   indent: 55,
                                      //   thickness: 2,
                                      //   endIndent: 55,
                                      //   color: Theme.of(context).colorScheme.outline,
                                      // ),
                                      // const SizedBox(height: 8),
                                      // FinishedShareItem.telegram(
                                      //   onTap: bloc.onSendTelegram,
                                      // ),
                                      // const SizedBox(height: 12),
                                      // FinishedShareItem.whatsapp(
                                      //   onTap: bloc.onSendWhatsApp,
                                      // ),
                                      // const SizedBox(height: 12),
                                      // FinishedShareItem.email(
                                      //   onTap: bloc.onSendEmail,
                                      // ),
                                      // const Spacer(),
                                      // MyButton.primary(
                                      //   label: 'strComplete'.tr(),
                                      //   onTap: () {
                                      //     NavigationService.newRootScreen(HomeScreen.route,
                                      //         nestedKey:
                                      //             NavigationService.homeNavigatorKey);
                                      //   },
                                      // ),
                                    ],
                                  );
                                },
                              ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  getBtn({
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 56,
          child: GlassContainer(
            radius: 26,
            tint: 0.1,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
