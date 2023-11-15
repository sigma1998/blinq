// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/presentation/finished/widgets/share_item.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:lottie/lottie.dart';

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

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                'strDamageReportSent'.tr(),
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
                onTap: () {},
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
                onTap: () {},
              ),
              const SizedBox(height: 12),
              FinishedShareItem.whatsapp(
                onTap: () {},
              ),
              const SizedBox(height: 12),
              FinishedShareItem.email(
                onTap: () {},
              ),
              const SizedBox(height: 72),
              MyButton.primary(
                label: 'strComplete'.tr(),
                onTap: () {},
              ),
            ],
          ],
        ),
      ),
    );
  }
}
