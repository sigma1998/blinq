// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/generated/assets.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:blinq/utils/components/inputs/custom_text_input.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:blinq/utils/components/wrappers/screen_background.dart';
import 'package:blinq/utils/custom_widgets/text_fields/default_text_field.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/step_indicator.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bloc/circumstance_state.dart';
import 'bloc/circumstances_bloc.dart';
import 'widgets/item.dart';

class CircumstancesScreen extends StatefulWidget {
  static const String route = 'circumstances_screen';

  const CircumstancesScreen({Key? key}) : super(key: key);

  @override
  State<CircumstancesScreen> createState() => _CircumstancesScreenState();
}

class _CircumstancesScreenState extends State<CircumstancesScreen> {
  late final CircumstancesBloc bloc;
  final TextEditingController controller = TextEditingController();

  @override
  void didChangeDependencies() {
    bloc = CircumstancesBloc(
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
      reportBloc: context.read(),
    );
    super.didChangeDependencies();
  }

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CircumstancesBloc, CircumstanceState>(
      bloc: bloc,
      builder: (context, state) {
        return ScreenBackground(
          body: Stack(
            children: [
              Column(
                children: [
                  ProgressAppBar(step: bloc.getStep()),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 16,
                      ),
                      children: [
                        Text(
                          '6. ${'strCircumstance'.tr()}',
                          style: AppTextStyles.s20W600,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          (bloc.isAccident ? 'strBigTxt'.tr() : 'strBigTxt2'.tr()),
                          style: AppTextStyles.s15W400,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.white.withAlpha(100), width: 0.6)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 16),
                              SvgPicture.asset(Assets.iconsSearch),
                              Expanded(
                                child: TextField(
                                  controller: controller,
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    border: InputBorder.none,
                                    hintStyle: AppTextStyles.s17W600.copyWith(fontWeight: FontWeight.w500),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        bloc.isAccident
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 38,
                                    child: GlassContainer(
                                      radius: 8,
                                      tint: 0.1,
                                      padding: const EdgeInsets.symmetric(vertical: 4),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'A',
                                            style: AppTextStyles.s20W600,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: const Icon(
                                              Icons.arrow_downward_rounded,
                                              color: AppColors.black,
                                              size: 18,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 38,
                                    child: GlassContainer(
                                      radius: 8,
                                      tint: 0.1,
                                      padding: const EdgeInsets.symmetric(vertical: 4),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'B',
                                            style: AppTextStyles.s20W600,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: const Icon(
                                              Icons.arrow_downward_rounded,
                                              color: AppColors.black,
                                              size: 18,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                        if (bloc.isAccident) const SizedBox(height: 24),
                        ListView.separated(
                          padding: const EdgeInsets.only(bottom: 192),
                          physics: const ClampingScrollPhysics(),
                          itemCount: Circumstances.values.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (controller.text.isNotEmpty &&
                                !Circumstances.values[index].title.toLowerCase().contains(controller.text.toLowerCase())) {
                              return SizedBox();
                            }
                            return CircumstanceItem(
                              isAccident: bloc.isAccident,
                              index: index,
                              driverAActive: bloc.driverAActive(index),
                              driverBActive: bloc.driverBActive(index),
                              onCheckedA: () => bloc.onCheckedA(index),
                              onCheckedB: () => bloc.onCheckedB(index),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 8,
                right: 0,
                left: 0,
                child: NavigationButton(
                  padding: 16,
                  loading: state.status == Status.loading,
                  onNextTap: bloc.onSubmit,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
