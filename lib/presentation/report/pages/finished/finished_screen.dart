// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/home/home_screen.dart';
import 'package:blinq/presentation/report/pages/finished/bloc/finishied_screen_bloc.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/loading/blinq_loading.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'widgets/share_item.dart';

class FinishedScreen extends StatefulWidget {
  //
  static const route = '/finished';

  const FinishedScreen({super.key});

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen>
    with TickerProviderStateMixin {
  //
  bool animationIsFinished = false;

  late final AnimationController _controller;

  late final FinishedScreenBloc bloc;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    bloc = FinishedScreenBloc(
      reportBloc: context.read(),
      profileBloc: context.read(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
    );
    super.didChangeDependencies();
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishedScreenBloc, GenericBlocState<String>>(
      bloc: bloc,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: state.status == Status.loading
                ? const BlinqLoading()
                : Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!animationIsFinished) ...[
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
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ] else ...[
                          SvgPicture.asset(
                            AppDrawables.blinq,
                            width: 84,
                            height: 75,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'strYouhavefinishedthedamagereport'.tr(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppDrawables.share,
                                width: 36,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'strSendto'.tr(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          FinishedShareItem.insurance(
                            onTap: bloc.onSendInsurance,
                          ),
                          const SizedBox(height: 8),
                          Divider(
                            indent: 55,
                            thickness: 2,
                            endIndent: 55,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          const SizedBox(height: 8),
                          FinishedShareItem.telegram(
                            onTap: bloc.onSendTelegram,
                          ),
                          const SizedBox(height: 12),
                          FinishedShareItem.whatsapp(
                            onTap: bloc.onSendWhatsApp,
                          ),
                          const SizedBox(height: 12),
                          FinishedShareItem.email(
                            onTap: bloc.onSendEmail,
                          ),
                          const Spacer(),
                          MyButton.primary(
                            label: 'strComplete'.tr(),
                            onTap: () {
                              NavigationService.newRootScreen(HomeScreen.route,
                                  nestedKey:
                                      NavigationService.homeNavigatorKey);
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
