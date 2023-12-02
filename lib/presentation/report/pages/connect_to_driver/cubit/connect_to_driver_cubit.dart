// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/report/second_driver_editors/screens/policy_holder/policy_holder_screen.dart';
import 'package:blinq/presentation/report/pages/qr_scan/qr_scan_screen.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

part 'connect_to_driver_state.dart';
part 'connect_to_driver_cubit.freezed.dart';

class ConnectToDriverCubit extends Cubit<ConnectToDriverState> {
  //
  final ReportBloc reportBloc;

  final AccidentRepository accidentRepository;

  ConnectToDriverCubit({
    required this.reportBloc,
    required this.accidentRepository,
  }) : super(const ConnectToDriverState());

  //

  void onValueChanged(bool value) => emit(state.copyWith(hasBlinq: value));

  void onNextPressed() async {
    if (state.hasBlinq!) {
      NavigationService.pushNamed(
        routeName: QrScanScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
      return;
    }

    emit(state.copyWith(status: Status.loading));
    try {
      await accidentRepository.connectToNoBlinqDriver(
        reportBloc.reportId,
      );
      NavigationService.pushNamed(
        routeName: SecondDriverEditorPolicyHolderScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
