// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:video_compress/video_compress.dart';

// Project imports:
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/a_b_users_completed/a_b_users_completed_screen.dart';
import 'package:blinq/presentation/report/pages/connect_to_driver/connect_to_driver_screen.dart';
import 'package:blinq/presentation/report/pages/sign/sign_screen.dart';
import 'package:blinq/utils/custom_widgets/cupertino_action/cupertino_action.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/image_crop_helper.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/media_dialogs/file_quality_reduced_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/media_dialogs/max_file_size_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/media_dialogs/success_dialog.dart';

part 'damaged_media_cubit.freezed.dart';

part 'damaged_media_state.dart';

class DamagedMediaCubit extends Cubit<DamagedMediaState> {
  //
  final ReportBloc reportBloc;
  final AccidentRepository accidentRepository;
  final BreakdownRepository breakdownRepository;

  final MediaService mediaService;

  final _maxVideoFiles = 2;
  final _maxImageFiles = 5;

  final _maxVideoSize = 80;
  final _maxImageSize = 10;

  DamagedMediaCubit({
    required this.reportBloc,
    required this.accidentRepository,
    required this.breakdownRepository,
    required this.mediaService,
  }) : super(const DamagedMediaState());

  ///
  /// Upload
  ///

  Future<void> onUploadDamagedMediaFiles() async {
    try {
      if (state.files.isEmpty) {
        _navigate();
        return;
      }

      emit(state.copyWith(status: Status.loading, isUploading: true));
      await _uploadFiles();
      await _uploadMedia();

      _navigate();

      emit(state.copyWith(status: Status.success, isUploading: false));
    } catch (e) {
      emit(state.copyWith(status: Status.initial, isUploading: false));
    }
  }

  /// Upload multipart files to server and get file ids to upload media
  /// [state.files] are uploaded one by one

  Future<void> _uploadFiles() async {
    final files = state.files;
    emit(state.copyWith(uploadedFilesId: []));

    for (final file in files) {
      final multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      );
      final uploadedFileId = await accidentRepository.uploadFile(
        file: multipartFile,
      );

      emit(state.copyWith(
        uploadedFilesId: [...state.uploadedFilesId, uploadedFileId],
      ));
    }
  }

  /// Upload file ids depending on user type and report type
  Future<void> _uploadMedia() async {
    final reportId = reportBloc.reportId;
    final uploadedFilesId = state.uploadedFilesId;

    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.state.user == User.A) {
        await accidentRepository.uploadMedia(reportId, uploadedFilesId);
      } else {
        await accidentRepository.uploadMediaB(reportId, uploadedFilesId);
      }
    } else {
      await breakdownRepository.uploadMedia(reportId, uploadedFilesId);
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

  Future<void> _updateFiles(Future<String?> filePath) async {
    NavigationService.back();
    final filePathSync = await filePath;

    if (filePathSync == null) {
      return;
    }

    if (_isVideoFile(File(filePathSync))) {
      await _updateVideoFiles(filePathSync);
    } else if (_isImageFile(File(filePathSync))) {
      await _updateImageFiles(filePathSync);
    } else {
      NavigationService.showErrorToast(
        'Allowed only jpg, jpeg, heic, heif, png, mp4, mov',
      );
    }
  }

  Future<void> _updateImageFiles(String imagePath) async {
    final croppedImage = await ImageCropHelper.cropImage(
      imagePath,
      ratioX: 9,
      ratioY: 16,
    );

    final compressedFile = await _isImageValid(croppedImage);

    await _handleFile(compressedFile);
  }

  Future<void> _updateVideoFiles(String filePath) async {
    final file = await _isVideoValid(File(filePath));
    await _handleFile(file);
  }

  Future<void> _handleFile(File? file) async {
    if (file != null) {
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

  /// Compress video if it's size is more than [_maxVideoSize]
  /// Show dialog if video quality is reduced
  /// Show dialog if video size is more than [_maxVideoSize]
  /// Return compressed file if it's size is less than [_maxVideoSize]

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

  /// Check if file is valid
  /// Show dialog if the limit [_maxVideoSize] or [_maxImageSize] exceeded

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
        fileExtension == '.heic' ||
        fileExtension == '.heif' ||
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
    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.state.user == User.A) {
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
      NavigationService.pushNamed(
        routeName: SignScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
    }
  }

  int step() {
    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.state.user == User.A) {
        return 8;
      }
      return 13;
    } else {
      return 9;
    }
  }
}
