import 'dart:async';
import 'dart:io';

import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/reports/pdf_view/pdf_view.dart';
import 'package:blinq/presentation/reports/reports_screen_event.dart';
import 'package:blinq/presentation/reports/reports_screen_state.dart';
import 'package:blinq/utils/general_functions.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:device_info/device_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ReportsScreenBloc extends Bloc<ReportsScreenEvent, ReportsScreenState> {
  final ProfileRepository repository;

  ReportsScreenBloc({required this.repository})
      : super(const ReportsScreenState(status: Status.loading)) {
    on<OnInit>(_onInit);
    on<OnTabBarChanged>(_onTabBatChanged);
    on<OnItemDelete>(_onDeleteItem);
    on<OnOpenItem>(_onOpenItem);
    on<OnDownloadItem>(_onDownloadItem);
  }

  FutureOr<void> _onInit(OnInit event, Emitter<ReportsScreenState> emit) async {
    try {
      final res = await repository.fetchHistory();

      emit(
        state.copyWith(
          status: Status.success,
          accidents: res.accidents,
          breakdowns: res.breakdowns,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failure,
        ),
      );
    }
  }

  FutureOr<void> _onTabBatChanged(
      OnTabBarChanged event, Emitter<ReportsScreenState> emit) {
    emit(state.copyWith(pageIndex: event.index));
  }

  FutureOr<void> _onDeleteItem(
      OnItemDelete event, Emitter<ReportsScreenState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await repository.deleteReport(event.id);
      add(OnInit());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onOpenItem(
      OnOpenItem event, Emitter<ReportsScreenState> emit) async {
    if (event.itemModelDto.accidentDocumentPdf == null) {
      NavigationService.showErrorToast('');
      return;
    }
    NavigationService.pushNamed(
        routeName: PdfViewScreen.route,
        arguments: PdfViewDetail(event.itemModelDto.accidentDocumentPdf!,
            getReportTime(event.itemModelDto.createdAt!)));
  }

  FutureOr<void> _onDownloadItem(
      OnDownloadItem event, Emitter<ReportsScreenState> emit) async {
    if (event.itemModelDto.accidentDocumentPdf == null) {
      NavigationService.showErrorToast('');
      return;
    }
    File? file;
    if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      String fn = event.itemModelDto.accidentDocumentPdf!.split('/').last;
      file = File('${dir.path}/$fn.pdf');
    }
    if (Platform.isAndroid) {
      final plugin = DeviceInfoPlugin();
      final android = await plugin.androidInfo;

      var status = android.version.sdkInt < 33
          ? await Permission.storage.request()
          : PermissionStatus.granted;

      if (status != PermissionStatus.granted) {
        status = await Permission.storage.request();
      }
      if (status.isGranted) {
        const downloadsFolderPath = '/storage/emulated/0/Download/';
        Directory dir = Directory(downloadsFolderPath);
        String fn = event.itemModelDto.accidentDocumentPdf!.split('/').last;
        file = File('${dir.path}/$fn.pdf');
      }
    }
    if (file == null) return;

    await repository.downloadReport(
        url: event.itemModelDto.accidentDocumentPdf!, localPath: file.path);

    NavigationService.showToast(
        text: 'strPdfSaved'.tr(), title: 'strSuccess'.tr());
  }
}
