// Flutter imports:
import 'dart:io';

import 'package:blinq/utils/custom_widgets/cupertino_action/cupertino_action.dart';
import 'package:blinq/utils/image_crop_helper.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_painter_v2/flutter_painter.dart';

// Project imports:
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/screenshot_util.dart';

class SketchBloc extends Cubit<GenericBlocState<bool>> {
  //
  final ReportBloc reportBloc;

  final AccidentRepository accidentRepository;
  final BreakdownRepository breakdownRepository;

  final MediaService mediaService;

  late PainterController painterController;
  FocusNode textFocusNode = FocusNode();

  final GlobalKey key = GlobalKey();

  final List<Color> customColors = const [
    Color(0xFFFF0000), // Red at 0%
    Color(0xFFFF912C), // Orange at 11.31%
    Color(0xFFFFED4C), // Yellow at 23.67%
    Color(0xFF68FF77), // Light Green at 37.09%
    Color(0xFF00F0FF), // Cyan at 50.51%
    Color(0xFF001AFF), // Blue at 65.51%
    Color(0xFFAD00FF), // Purple at 76.64%
    Color(0xFFE80D9E), // Pink at 88.65%
    Color(0xFFFF0000), // Red at 100%
  ];

  SketchBloc({
    required this.reportBloc,
    required this.accidentRepository,
    required this.breakdownRepository,
    required this.mediaService,
  }) : super(const GenericBlocState<bool>(
          status: Status.initial,
          data: true,
        )) {
    onInit();
  }

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
    painterController.freeStyleColor = customColors[0];

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

  Future<File?> getImageFromGallery() async{
    final result = await NavigationService.showMyCupertinoModalPopup(
      actions: [
        MyCupertinoActionSheetAction(
          label: 'strTakeImage'.tr(),
          onPressed: () {
            mediaService
                .pickImagePath(AppImageSource.camera)
                .then((value) async {
              final croppedImage = await ImageCropHelper.cropImage(value!);
              NavigationService.back(result: croppedImage);
            });
          },
        ),
        MyCupertinoActionSheetAction(
          label: 'strSelectFromGallery'.tr(),
          onPressed: () {
            mediaService
                .pickImagePath(AppImageSource.gallery)
                .then((value) async {
              final croppedImage = await ImageCropHelper.cropImage(value!);
              NavigationService.back(result: croppedImage);
            });
          },
        ),
      ],
    );
    return result;
  }

  void onCameraPressed() async {
    final result = await NavigationService.showMyCupertinoModalPopup(
      actions: [
        MyCupertinoActionSheetAction(
          label: 'strTakeImage'.tr(),
          onPressed: () {
            mediaService
                .pickImagePath(AppImageSource.camera)
                .then((value) async {
              final croppedImage = await ImageCropHelper.cropImage(value!);
              NavigationService.back(result: croppedImage);
            });
          },
        ),
        MyCupertinoActionSheetAction(
          label: 'strSelectFromGallery'.tr(),
          onPressed: () {
            mediaService
                .pickImagePath(AppImageSource.gallery)
                .then((value) async {
              final croppedImage = await ImageCropHelper.cropImage(value!);
              NavigationService.back(result: croppedImage);
            });
          },
        ),
      ],
    );

    if (result != null) {
      uploadSketch(result);
    }
  }

  Future<void> onSubmitted(BuildContext context) async {
    final file = await captureSocialPng(key, context);
    await uploadSketch(file!);
  }

  Future<void> uploadSketch(File file) async {
    emit(const GenericBlocState(status: Status.initial, data: false));

    try {
      final multipartFile = MultipartFile.fromBytes(
        file.readAsBytesSync(),
        filename: file.path.split('/').last,
      );

      emit(const GenericBlocState(status: Status.loading, data: true));

      if (reportBloc.reportType == ReportType.accident) {
        await accidentRepository.accidentSketch(
          reportBloc.reportId,
          multipartFile,
        );
      } else {
        await breakdownRepository.uploadBreakdownSketch(
          breakdownId: reportBloc.reportId,
          sketch: multipartFile,
        );
      }

      emit(const GenericBlocState(status: Status.initial, data: true));
      NavigationService.back(result: true);
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial, data: true));
    }
  }
}
