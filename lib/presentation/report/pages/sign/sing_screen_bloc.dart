import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/finished/finished_screen.dart';
import 'package:blinq/presentation/report/pages/sign/sign_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/screenshot_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand_signature/signature.dart';

class SignScreenBloc extends Cubit<GenericBlocState<bool>> {
  final AccidentRepository accidentRepository;
  final BreakdownRepository breakdownRepository;
  final ReportBloc reportBloc;
  final User user;

  final GlobalKey previewContainer = GlobalKey();
  final HandSignatureControl control = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  String driver = '';

  SignScreenBloc(
      {required this.reportBloc,
      required this.accidentRepository,
      required this.breakdownRepository,
      required this.user})
      : super(const GenericBlocState(status: Status.initial)) {
    if (reportBloc.reportType == ReportType.accident) {
      if (user == User.A) {
        driver = ' A';
      } else {
        driver = ' B';
      }
    }
  }

  Future<void> onNextTap(BuildContext context) async {
    emit(const GenericBlocState(status: Status.loading));

    final img = await captureSign(previewContainer, context);

    final MultipartFile sign = MultipartFile.fromBytes(
      img!.readAsBytesSync(),
      filename: img.path.split('/').last,
    );

    if (reportBloc.reportType == ReportType.accident) {
      switch (user) {
        case User.A:
          _sendUserASign(sign);
          break;
        case User.B:
          _sendUserBSign(sign);
          break;
      }
    } else {
      _sendSignForBreakdown(sign);
    }
  }

  Future<void> _sendUserASign(MultipartFile sign) async {
    try {
      await accidentRepository.sign(reportBloc.reportId, sign);
      emit(const GenericBlocState(status: Status.initial));

      NavigationService.pushNamed(
          routeName: SignScreen.route,
          nestedKey: NavigationService.homeNavigatorKey,
          arguments: SignScreenArgs(user: User.B));
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial));
    }
  }

  Future<void> _sendUserBSign(MultipartFile sign) async {
    try {
      await accidentRepository.signB(reportBloc.reportId, sign);

      emit(const GenericBlocState(status: Status.initial));

      NavigationService.pushNamed(
        routeName: FinishedScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial));
    }
  }

  void _sendSignForBreakdown(MultipartFile sign) async {
    try {
      await breakdownRepository.sign(reportBloc.reportId, sign);

      emit(const GenericBlocState(status: Status.initial));

      NavigationService.pushNamed(
        routeName: FinishedScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial));
    }
  }

  int getStep() {
    if(reportBloc.reportType == ReportType.accident){
      return user == User.A ? 16: 17;
    }else{return 10;}
  }
}
