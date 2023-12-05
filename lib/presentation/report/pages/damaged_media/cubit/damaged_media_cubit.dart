// Dart imports:
import 'dart:async';
import 'dart:io';

import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';

// Flutter imports:
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/a_b_users_completed/a_b_users_completed_screen.dart';
import 'package:blinq/presentation/report/pages/connect_to_driver/connect_to_driver_screen.dart';
import 'package:blinq/utils/custom_widgets/cupertino_action/cupertino_action.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/image_crop_helper.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/media_dialogs/file_quality_reduced_dialog.dart';

// Project imports:
import 'package:blinq/utils/smart_widgets/dialogs/media_dialogs/max_file_size_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/media_dialogs/success_dialog.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:video_compress/video_compress.dart';

part 'damaged_media_cubit.freezed.dart';

part 'damaged_media_state.dart';

class DamagedMediaCubit extends Cubit<DamagedMediaState> {
  //
  final ReportBloc reportBloc;
  final AccidentRepository accidentRepository;

  final MediaService mediaService;

  final _maxVideoFiles = 2;
  final _maxImageFiles = 6;

  final _maxVideoSize = 80;
  final _maxImageSize = 10;

  DamagedMediaCubit({
    required this.reportBloc,
    required this.accidentRepository,
    required this.mediaService,
  }) : super(const DamagedMediaState());

  ///
  /// Upload
  ///

  Future<void> onUploadDamagedMediaFiles() async {
    try {
      if(state.files.isEmpty){
        _navigate();
        return;
      }

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

      _navigate();

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<void> _uploadMedia() async {
    if(reportBloc.reportType == ReportType.accident){
      if(reportBloc.user == User.A){
        await accidentRepository.uploadMedia(
          reportBloc.reportId,
          state.uploadedFilesId,
        );
      } else{
        await accidentRepository.uploadMediaB(
          reportBloc.reportId,
          state.uploadedFilesId,
        );
      }
    }else{
      //TODO
    }

    await NavigationService.showDialog(
      dialog: const FileUploadedSuccessfullyDialog(),
    );
  }

  ///
  /// Image picker
  ///

  Future<void> imagePickerPressed() async {
    await NavigationService.showMyCupertinoModalPopup(
      actions: [
        if (_isMaxVideoFiles(
            state.files.where((file) => _isVideoFile(file)).length + 1))
          _recordVideoActionWidget,
        if (_isMaxImageFiles(
            state.files.where((file) => !_isVideoFile(file)).length + 1))
          _pickImageActionWidget,
        _pickFromGalleryActionWidget,
      ],
    );
  }

  Future<void> removeDamagedMediaPressed(File file) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final updatedFiles = List<File>.from(state.files);
      updatedFiles.remove(file);
      emit(state.copyWith(status: Status.success, files: updatedFiles));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  ///
  /// Action Sheet
  ///
  Widget get _recordVideoActionWidget {
    return MyCupertinoActionSheetAction(
      label: 'strRecordVideo'.tr(),
      onPressed: () => _updateFiles(
        mediaService.pickVideoPath(AppImageSource.camera),
      ),
    );
  }

  Widget get _pickImageActionWidget {
    return MyCupertinoActionSheetAction(
      label: 'strTakeImage'.tr(),
      onPressed: () => _updateFiles(
        mediaService.pickImagePath(AppImageSource.camera),
      ),
    );
  }

  Widget get _pickFromGalleryActionWidget {
    return MyCupertinoActionSheetAction(
      label: 'strSelectFromGallery'.tr(),
      onPressed: () => _updateFiles(
        mediaService.pickMediaPath(),
      ),
    );
  }

  ///

  Future<void> _updateFiles(Future<String?> openMedia) async {
    NavigationService.back();
    final mediaPath = await openMedia;
    File? croppedImage;
    if (mediaPath != null && !_isVideoFile(File(mediaPath))) {
      if (_isImageFile(File(mediaPath))) {
        croppedImage = await ImageCropHelper.cropImage(mediaPath);
      } else {
        NavigationService.showErrorToast(
            'Allowed only jpg, jpeg, png, mp4, mov');
        return;
      }
    }

    final file = croppedImage ?? File(mediaPath ?? '');
    bool isFileValid = _isVideoFile(file)
        ? await _isVideoValid(file) != null
        : await _isImageValid(file) != null;

    if (isFileValid) {
      final updatedFiles = List<File>.from(state.files)..add(file);
      if (!_isMaxVideoFiles(
              updatedFiles.where((file) => _isVideoFile(file)).length) ||
          !_isMaxImageFiles(
              updatedFiles.where((file) => !_isVideoFile(file)).length)) {
        NavigationService.showErrorToast('strMaxMediaFiles'.tr());
        return;
      }

      emit(state.copyWith(status: Status.success, files: updatedFiles));
    }
  }

  ///
  /// Validation
  ///
  Future<File?> _isVideoValid(File file) async {
    File compressedFile = file;

    if (!_isFileSizeValid(file)) {
      emit(state.copyWith(status: Status.loading));
      compressedFile = await _compressVideo(file);
      emit(state.copyWith(status: Status.initial));

      if (_isFileSizeValid(compressedFile)) {
        await NavigationService.showDialog(
          dialog: const FileQualityReducedDialog(),
        );
      } else {
        await NavigationService.showDialog(dialog: MaxFileSizeDialog.video());
        return null;
      }
    }

    return compressedFile;
  }

  Future<File?> _isImageValid(File file) async {
    File compressedFile = file;

    if (!_isFileSizeValid(file)) {
      emit(state.copyWith(status: Status.loading));
      compressedFile = await _compressImageFile(file);
      emit(state.copyWith(status: Status.initial));

      if (!_isFileSizeValid(compressedFile)) {
        await NavigationService.showDialog(
          dialog: MaxFileSizeDialog.image(),
        );
        return null;
      }
    }

    return compressedFile;
  }

  bool _isMaxVideoFiles(int length) => length <= _maxVideoFiles;

  bool _isMaxImageFiles(int length) => length <= _maxImageFiles;

  bool _isFileSizeValid(File file) {
    final sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    if (_isVideoFile(file)) {
      return sizeInMb <= _maxVideoSize;
    } else {
      return sizeInMb <= _maxImageSize;
    }
  }

  bool _isVideoFile(File file) {
    final fileExtension = p.extension(file.path).toLowerCase();
    return fileExtension == '.mp4' || fileExtension == '.mov';
  }

  bool _isImageFile(File file) {
    final fileExtension = p.extension(file.path).toLowerCase();
    return fileExtension == '.jpg' ||
        fileExtension == '.jpeg' ||
        fileExtension == '.png';
  }

  ///
  /// Compress
  ///

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

  Future<File> _compressImageFile(File file) async {
    try {
      final filePath = file.absolute.path;

      final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
      final splitted = filePath.substring(0, (lastIndex));
      final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
      var result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        outPath,
      );

      return File(result!.path);
    } catch (e) {
      return file;
    }
  }

  void _navigate() {
    print('askdjoadfjodjasm');
    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.user == User.A) {
        print('askdjoadfjodjasdsadasdsam');

        NavigationService.pushNamed(
          routeName: ConnectToDriverScreen.route,
          nestedKey: NavigationService.homeNavigatorKey,
        );
      } else {
        NavigationService.pushNamed(
          routeName: ABUsersCompletedScreen.route,
          nestedKey: NavigationService.homeNavigatorKey,
        );
      }
    } else {
      //TODO
    }
  }

  int step() {
    if(reportBloc.user == User.A){
      return 8;
    }
    return 13;
  }
}
