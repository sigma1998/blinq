// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:device_info/device_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/main_screen/bloc/main_screen_bloc.dart';
import 'package:blinq/presentation/main_screen/bloc/main_screen_event.dart';
import 'package:blinq/presentation/my_reports/pdf_view/pdf_view.dart';
import 'package:blinq/utils/general_functions.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'reports_screen_event.dart';
import 'reports_screen_state.dart';

class ReportsScreenBloc extends Bloc<ReportsScreenEvent, ReportsScreenState> {
  final ProfileRepository repository;
  final ReportBloc reportBloc;
  final MainScreenBloc mainScreenBloc;

  ReportsScreenBloc(
      {required this.repository,
      required this.reportBloc,
      required this.mainScreenBloc})
      : super(const ReportsScreenState(status: Status.loading)) {
    on<OnInit>(_onInit);
    on<OnTabBarChanged>(_onTabBatChanged);
    on<OnItemDelete>(_onDeleteItem);
    on<OnOpenItem>(_onOpenItem);
    on<OnDownloadItem>(_onDownloadItem);
    on<OnContinueItem>(_onContinueItem);
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
    OnDownloadItem event,
    Emitter<ReportsScreenState> emit,
  ) async {
    if (event.itemModelDto.accidentDocumentPdf == null) {
      NavigationService.showErrorToast('');
      return;
    }
    File? file;
    if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      String fn = event.itemModelDto.accidentDocumentPdf!.split('/').last;
      file = File('${dir.path}/$fn');
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
        file = File('${dir.path}/$fn');
      }
    }
    if (file == null) return;

    emit(state.copyWith(status: Status.loading));

    await repository.downloadReport(
      localPath: file.path,
      url: event.itemModelDto.accidentDocumentPdf!,
    );

    emit(state.copyWith(status: Status.success));

    NavigationService.showToast(
      text: 'strPdfSaved'.tr(),
      title: 'strSuccess'.tr(),
    );
  }

  FutureOr<void> _onContinueItem(
      OnContinueItem event, Emitter<ReportsScreenState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final RouteAndArgs? routeAndArgs = await reportBloc.getReportStep(
          event.itemModelDto.id!, event.reportType);

      emit(state.copyWith(status: Status.initial));

      if (routeAndArgs == null) {
        NavigationService.showErrorToast('');
      } else {
        NavigationService.back();
        mainScreenBloc.add(OnItemPressed(newIndex: 0));
        NavigationService.pushNamed(
            routeName: routeAndArgs.route,
            nestedKey: NavigationService.homeNavigatorKey,
            arguments: routeAndArgs.args);
      }
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
