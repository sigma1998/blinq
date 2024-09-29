// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/presentation/report/pages/sketch/sketch_photo_screen.dart';
import 'package:blinq/presentation/report/pages/sketch/widget/custom_paletter.dart';
import 'package:blinq/presentation/report/pages/sketch/widget/sketch_button.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:blinq/utils/components/dialogs/modal/sketch_or_phot.dart';
import 'package:blinq/utils/services/dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_painter_v2/flutter_painter.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'bloc/sketch_bloc.dart';

class SketchScreen extends StatefulWidget {
  static const String route = '/sketch_screen';

  const SketchScreen({Key? key}) : super(key: key);

  @override
  State<SketchScreen> createState() => _SketchScreenState();
}

class _SketchScreenState extends State<SketchScreen> {
  late SketchBloc bloc;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCustomDialog(
        context: context,
        child: SketchOrPhoto(onCameraPressed: () async {
          final res = await NavigationService.pushNamed(
            routeName: SketchPhotoScreen.route,
          );
          NavigationService.back();
          if (res != null) {
            NavigationService.back(result: true);
          }
        }),
      );
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bloc = SketchBloc(
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
      reportBloc: context.read<ReportBloc>(),
      mediaService: getIt<MediaServiceImpl>(),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() async {
    super.dispose();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchBloc, GenericBlocState<bool>>(
      bloc: bloc,
      builder: (context, state) {
        final bool visible = state.data ?? false;
        return KeyboardEscape(
          child: Scaffold(
            appBar: ProgressAppBar(
              step: 7,
              onSaveTap: () => bloc.onSubmitted(context),
              onBackTap: () => NavigationService.back(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  SketchButton(
                    iconPath: AppDrawables.camera,
                    text: 'strSketchAccident'.tr(),
                    onPressed: () async {
                      final res = await NavigationService.pushNamed(
                        routeName: SketchPhotoScreen.route,
                      );
                      if (res != null) {
                        NavigationService.back(result: true);
                      }
                    },
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Image.asset(
                          AppDrawables.sketchBack,
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                        RepaintBoundary(
                          key: bloc.key,
                          child: FlutterPainter(
                            controller: bloc.painterController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  visible
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                getCircle(
                                  big: true,
                                  onTap: () {
                                    bloc.painterController
                                        .freeStyleStrokeWidth = 10;
                                  },
                                ),
                                const SizedBox(width: 20),
                                getCircle(
                                  onTap: () {
                                    bloc.painterController
                                        .freeStyleStrokeWidth = 4;
                                  },
                                ),
                                const Spacer(),
                                getIconBtn(
                                  iconPath: AppDrawables.delete,
                                  onTap: () {
                                    bloc.painterController.clearDrawables();
                                  },
                                ),
                                getIconBtn(
                                  iconPath: AppDrawables.cornerUpLeft,
                                  onTap: () {
                                    bloc.painterController.undo();
                                  },
                                ),
                                getIconBtn(
                                  iconPath: AppDrawables.cornerUpRight,
                                  onTap: () {
                                    bloc.painterController.redo();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ValueListenableBuilder(
                              valueListenable: bloc.painterController,
                              builder: (context, _, __) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomPalette(
                                    colors: bloc.customColors,
                                    painterController: bloc.painterController,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  // Free-style eraser
                                  getClickable(
                                    clicked:
                                        bloc.painterController.freeStyleMode ==
                                            FreeStyleMode.erase,
                                    iconPath: AppDrawables.eraser,
                                    onTap: bloc.toggleFreeStyleErase,
                                  ),
                                  const SizedBox(width: 24),
                                  // Free-style drawing
                                  getClickable(
                                    clicked:
                                        bloc.painterController.freeStyleMode ==
                                            FreeStyleMode.draw,
                                    iconPath: AppDrawables.penBig,
                                    onTap: bloc.toggleFreeStyleDraw,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        )
                      : const SizedBox(),
                  visible
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: NavigationButton(
                            padding: 0,
                            loading: state.status == Status.loading,
                            onNextTap: () {
                              bloc.onSubmitted(context);
                            },
                            onBack: () => NavigationService.back(),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  getClickable({
    required bool clicked,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: clicked ? AppColors.white : Colors.transparent,
          border: Border.all(
            color: AppColors.white,
          ),
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 26,
          height: 26,
          colorFilter: ColorFilter.mode(
            clicked ? AppColors.black : AppColors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  getIconBtn({
    required VoidCallback onTap,
    required String iconPath,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.darkGrey,
          ),
          padding: const EdgeInsets.all(4),
          child: SvgPicture.asset(
            iconPath,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }

  getCircle({
    bool big = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.darkGrey,
        ),
        padding: EdgeInsets.all(big ? 6 : 10),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

// Add text
// const SizedBox(width: 24),
// IconButton(
//   icon: Icon(
//     PhosphorIcons.textT(),
//     color: bloc.textFocusNode.hasFocus
//         ? Theme.of(context)
//             .secondaryHeaderColor
//         : null,
//   ),
//   onPressed: bloc.addText,
// ),
// const SizedBox(width: 24),
// IconButton(
//   icon: Icon(
//     PhosphorIcons.camera(),
//     color: bloc.textFocusNode.hasFocus
//         ? Theme.of(context)
//             .secondaryHeaderColor
//         : null,
//   ),
//   onPressed: bloc.onCameraPressed,
// ),
