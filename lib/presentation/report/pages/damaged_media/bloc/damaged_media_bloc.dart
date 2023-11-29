// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:blinq/utils/smart_widgets/dialogs/media_dialogs/max_file_size_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/media_dialogs/success_dialog.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:video_compress/video_compress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart';

// Project imports:
import 'package:blinq/utils/smart_widgets/dialogs/media_dialogs/file_quality_reduced_dialog.dart';
import 'package:blinq/utils/custom_widgets/cupertino_action/cupertino_action.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/image_crop_helper.dart';
import 'damaged_media_event.dart';

part 'damaged_media_state.dart';
part 'damaged_media_bloc.freezed.dart';

class DamagedMediaBloc extends Bloc<DamagedMediaEvent, DamagedMediaState> {
  //
  final ReportBloc reportBloc;

  final AccidentRepository accidentRepository;

  final MediaService mediaService;

  DamagedMediaBloc({
    required this.reportBloc,
    required this.accidentRepository,
    required this.mediaService,
  }) : super(const DamagedMediaState()) {
    on<OnAddDamagedMediaFiles>(_imagePickerPressed);
    on<OnRemoveDamagedMediaFile>(_removeDamagedMediaPressed);
    on<OnUploadDamagedMediaFiles>(_onUploadDamagedMediaFiles);
  }

  ///
  /// Upload
  ///

  Future<void> _onUploadDamagedMediaFiles(
      OnUploadDamagedMediaFiles event, Emitter<DamagedMediaState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final files = state.files;
      final uploadedFilesId = <int>[];
      for (final file in files) {
        final multipartFile = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last);
        final uploadedFileId = await accidentRepository.uploadFile(
          file: multipartFile,
        );
        uploadedFilesId.add(uploadedFileId);
      }
      emit(state.copyWith(uploadedFilesId: uploadedFilesId));
      await _uploadMedia();
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<void> _uploadMedia() async {
    await accidentRepository.uploadMedia(
      reportBloc.accidentId,
      state.uploadedFilesId,
    );
    print('Media uploaded successfully');
  }

  ///
  /// Image picker
  ///

  Future<void> _imagePickerPressed(
      OnAddDamagedMediaFiles event, Emitter<DamagedMediaState> emit) async {
    final result = await NavigationService.showMyCupertinoModalPopup(
      actions: [
        if (_checkMaxVideoFiles(state.files)) _recordVideoActionWidget,
        if (_checkMaxImageFiles(state.files)) _pickImageActionWidget,
        _pickFromGalleryActionWidget,
      ],
    );
    emit(state.copyWith(status: Status.loading));

    if (result != null) {
      final file = result as File;
      final updatedFiles = List<File>.from(state.files)..add(file);
      if (!_checkMaxVideoFiles(updatedFiles) ||
          !_checkMaxImageFiles(updatedFiles)) {
        NavigationService.showErrorToast('strMaxMediaFiles'.tr());
        return;
      }

      emit(state.copyWith(status: Status.success, files: updatedFiles));
    }

    emit(state.copyWith(status: Status.initial));
  }

  ///
  /// Action Sheet
  ///
  Widget get _recordVideoActionWidget {
    return MyCupertinoActionSheetAction(
      label: 'strRecordVideo'.tr(),
      onPressed: () async {
        final videoPath =
            await mediaService.pickVideoPath(AppImageSource.camera);
        final result = File(videoPath ?? '');
        _isVideoValid(result);
      },
    );
  }

  Widget get _pickImageActionWidget {
    return MyCupertinoActionSheetAction(
      label: 'strTakeImage'.tr(),
      onPressed: () async {
        final imagePath =
            await mediaService.pickImagePath(AppImageSource.camera);
        final result = await ImageCropHelper.cropImage(imagePath);
        NavigationService.back(result: result);
      },
    );
  }

  Widget get _pickFromGalleryActionWidget {
    return MyCupertinoActionSheetAction(
      label: 'strSelectFromGallery'.tr(),
      onPressed: () async {
        final mediaPath = await mediaService.pickMediaPath();
        final result = File(mediaPath ?? '');
        _isVideoValid(result);
      },
    );
  }

  //

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

  Future<File> _compressVideo(File file) async {
    try {
      final MediaInfo? info = await VideoCompress.compressVideo(
        file.path,
        includeAudio: true,
        deleteOrigin: true,
        quality: VideoQuality.Res1280x720Quality,
      );
      return File(info!.path!);
    } catch (e) {
      return file;
    }
  }

  ///
  /// Validation
  ///
  void _isVideoValid(File file) async {
    if (!_isVideoFile(file)) return;

    if (!_isVideoFileSizeValid(file)) {
      final compressedVideo = await _compressVideo(file);

      if (_isVideoFileSizeValid(compressedVideo)) {
        await NavigationService.showDialog(
          dialog: const FileQualityReducedDialog(),
        );
      } else {
        await NavigationService.showDialog(
          dialog: const MaxFileSizeDialog(),
        );
        return;
      }
    }
    await NavigationService.showDialog(
      dialog: const FileUploadedSuccessfullyDialog(),
    );

    NavigationService.back(result: file);
  }

  bool _checkMaxVideoFiles(List<File> files) {
    return files.where((file) => _isVideoFile(file)).length <= 2;
  }

  bool _checkMaxImageFiles(List<File> files) {
    return files.where((file) => !_isVideoFile(file)).length <= 6;
  }

  bool _isVideoFile(File file) {
    final fileExtension = p.extension(file.path).toLowerCase();
    return fileExtension == '.mp4' || fileExtension == '.mov';
  }

  bool _isVideoFileSizeValid(File file) {
    final sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb <= 1;
  }
}
