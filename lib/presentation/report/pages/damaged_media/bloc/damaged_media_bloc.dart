// Dart imports:
import 'dart:io';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;

// Project imports:
import 'package:blinq/utils/custom_widgets/cupertino_action/cupertino_action.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/image_crop_helper.dart';
import 'damaged_media_event.dart';

part 'damaged_media_state.dart';
part 'damaged_media_bloc.freezed.dart';

class DamagedMediaBloc extends Bloc<DamagedMediaEvent, DamagedMediaState> {
  //
  final MediaService mediaService;

  DamagedMediaBloc({required this.mediaService})
      : super(const DamagedMediaState()) {
    on<OnAddDamagedMediaFiles>(_imagePickerPressed);
    on<OnRemoveDamagedMediaFile>(_removeDamagedMediaPressed);
  }

  Future<void> _imagePickerPressed(
      OnAddDamagedMediaFiles event, Emitter<DamagedMediaState> emit) async {
    final result = await NavigationService.showMyCupertinoModalPopup(
      actions: [
        if (state.files.where((file) => _isVideoFile(file)).length < 2)
          MyCupertinoActionSheetAction(
            label: 'strRecordVideo'.tr(),
            onPressed: () async {
              final videoPath =
                  await mediaService.pickVideoPath(AppImageSource.camera);
              final result = File(videoPath!);
              NavigationService.back(result: result);
            },
          ),
        if (state.files.where((file) => !_isVideoFile(file)).length < 6)
          MyCupertinoActionSheetAction(
            label: 'strTakeImage'.tr(),
            onPressed: () async {
              final imagePath =
                  await mediaService.pickImagePath(AppImageSource.camera);
              final result = await ImageCropHelper.cropImage(imagePath);
              NavigationService.back(result: result);
            },
          ),
        MyCupertinoActionSheetAction(
          label: 'strSelectFromGallery'.tr(),
          onPressed: () async {
            final mediaPaths = await mediaService.pickMultipleMediaPaths();
            final result = mediaPaths?.map((e) => File(e)).toList();
            NavigationService.back(result: result);
          },
        ),
      ],
    );

    if (result != null) {
      final files = result is File ? [result] : result;
      final updatedFiles = List<File>.from(state.files)..addAll(files);
      // check if updated files have max 2 videos and max 6 photos
      if (updatedFiles.where((file) => _isVideoFile(file)).length > 2 ||
          updatedFiles.where((file) => !_isVideoFile(file)).length > 6) {
        NavigationService.showErrorToast('strMaxMediaFiles'.tr());
        return;
      }

      emit(state.copyWith(status: Status.success, files: updatedFiles));
    }
  }

  bool _isVideoFile(File file) {
    final fileExtension = p.extension(file.path).toLowerCase();
    return fileExtension == '.mp4' || fileExtension == '.mov';
  }

  Future<void> _removeDamagedMediaPressed(
      OnRemoveDamagedMediaFile event, Emitter<DamagedMediaState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final updatedFiles = List<File>.from(state.files);
      updatedFiles.remove(event.file);
      emit(state.copyWith(status: Status.success, files: updatedFiles));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
