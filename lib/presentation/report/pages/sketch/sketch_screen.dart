import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_painter_v2/flutter_painter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
    bloc = SketchBloc();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchBloc, GenericBlocState<bool>>(
      bloc: bloc,
      builder: (context, state) {
        final bool visible = state.data ?? false;
        return KeyboardEscape(
          child: Scaffold(
            body: Stack(
              children: [
                Center(
                  child: FlutterPainter(
                    controller: bloc.painterController,
                  ),
                ),
                visible ? Positioned(
                  bottom: 54,
                  right: 0,
                  left: 0,
                  child: ValueListenableBuilder(
                    valueListenable: bloc.painterController,
                    builder: (context, _, __) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 400),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              color: Colors.white54,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (bloc.painterController.freeStyleMode ==
                                    FreeStyleMode.draw)
                                  Row(
                                    children: [
                                      const Expanded(
                                          flex: 1, child: Text("Color")),
                                      // Control free style color hue
                                      Expanded(
                                        flex: 3,
                                        child: Slider.adaptive(
                                            min: 0,
                                            max: 359.99,
                                            value: HSVColor.fromColor(bloc
                                                    .painterController
                                                    .freeStyleColor)
                                                .hue,
                                            activeColor: bloc.painterController
                                                .freeStyleColor,
                                            onChanged: bloc.setFreeStyleColor),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ):const SizedBox(),
                visible ? Positioned(
                  bottom: 10,
                  left: 1,
                  right: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ValueListenableBuilder<PainterControllerValue>(
                          valueListenable: bloc.painterController,
                          builder: (context, _, child) {
                            return IconButton(
                              icon: Icon(
                                  PhosphorIcons.fill.arrowCounterClockwise),
                              onPressed: bloc.painterController.canUndo
                                  ? bloc.undo
                                  : null,
                            );
                          }),
                      ValueListenableBuilder(
                        valueListenable: bloc.painterController,
                        builder: (context, _, __) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Free-style eraser
                            IconButton(
                              icon: Icon(PhosphorIcons.fill.eraser,
                                  color: bloc.painterController.freeStyleMode ==
                                          FreeStyleMode.erase
                                      ? Theme.of(context).secondaryHeaderColor
                                      : null),
                              onPressed: bloc.toggleFreeStyleErase,
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            // Free-style drawing
                            IconButton(
                                icon: Icon(
                                  PhosphorIcons.fill.scribbleLoop,
                                  color: bloc.painterController.freeStyleMode ==
                                          FreeStyleMode.draw
                                      ? Theme.of(context)
                                          .toggleButtonsTheme
                                          .color
                                      : null,
                                ),
                                onPressed: bloc.toggleFreeStyleDraw),
                            // Add text
                            const SizedBox(
                              width: 24,
                            ),

                            IconButton(
                              icon: Icon(
                                PhosphorIcons.fill.textT,
                                color: bloc.textFocusNode.hasFocus
                                    ? Theme.of(context).secondaryHeaderColor
                                    : null,
                              ),
                              onPressed: bloc.addText,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ):const SizedBox(),
                visible ? Align(
                  alignment: Alignment.bottomCenter,

                  child:  NavigationButton(
                    onNextTap: bloc.onSubmitted,
                    onBack: () => NavigationService.back(),
                  ),
                ): const SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
