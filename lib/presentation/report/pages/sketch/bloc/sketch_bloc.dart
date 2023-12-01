import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/screenshot_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_painter_v2/flutter_painter.dart';

class SketchBloc extends Cubit<GenericBlocState<bool>> {
  final AccidentRepository accidentRepository;
  final ReportBloc reportBloc;

  SketchBloc({required this.reportBloc, required this.accidentRepository})
      : super(
            const GenericBlocState<bool>(status: Status.initial, data: true)) {
    onInit();
  }

  late PainterController painterController;
  FocusNode textFocusNode = FocusNode();

  final GlobalKey key = GlobalKey();

  void onInit() {
    painterController = PainterController(
      settings: PainterSettings(
        text: TextSettings(
            textStyle: const TextStyle(color: Colors.white),
            focusNode: textFocusNode),
        freeStyle: const FreeStyleSettings(color: Colors.red, strokeWidth: 5),
        scale: const ScaleSettings(
          enabled: true,
          minScale: 1,
          maxScale: 5,
        ),
      ),
    );

    textFocusNode.addListener(onFocus);
  }

  void onFocus() {
    emit(state);
  }

  void setFreeStyleColor(double value) {
    painterController.freeStyleColor =
        HSVColor.fromAHSV(1, value, 1, 1).toColor();
  }

  void undo() {
    painterController.undo();
  }

  void toggleFreeStyleErase() {
    painterController.freeStyleMode =
        painterController.freeStyleMode != FreeStyleMode.erase
            ? FreeStyleMode.erase
            : FreeStyleMode.none;
  }

  void toggleFreeStyleDraw() {
    painterController.freeStyleMode =
        painterController.freeStyleMode != FreeStyleMode.draw
            ? FreeStyleMode.draw
            : FreeStyleMode.none;
  }

  void addText() {
    if (painterController.freeStyleMode != FreeStyleMode.none) {
      painterController.freeStyleMode = FreeStyleMode.none;
    }
    painterController.addText();
  }

  void onSubmitted(BuildContext context) async {
    emit(const GenericBlocState(status: Status.initial, data: false));

    try{
      final file =  await captureSocialPng(key, context);

      final multipartFile = MultipartFile.fromBytes(
        file!.readAsBytesSync(),
        filename: file.path.split('/').last,
      );

      await accidentRepository.accidentSketch(reportBloc.reportId, multipartFile);

      emit(const GenericBlocState(status: Status.initial, data: true));
      NavigationService.back(result: true);
    }catch(e){
      emit(const GenericBlocState(status: Status.initial, data: true));
    }

  }
}
