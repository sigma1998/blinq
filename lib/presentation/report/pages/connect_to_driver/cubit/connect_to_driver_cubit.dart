// Package imports:
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/qr_scan/qr_scan_screen.dart';

// Project imports:
import 'package:blinq/presentation/report/second_driver_editors/screens/policy_holder/policy_holder_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connect_to_driver_cubit.freezed.dart';

part 'connect_to_driver_state.dart';

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
      emit(state.copyWith(status: Status.success));

      NavigationService.pushNamed(
        routeName: SecondDriverEditorPolicyHolderScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  onBack() {
    reportBloc.setUser(User.A);
    NavigationService.homeNavigatorKey.currentState?.pop();
  }

  Future<bool> onWillPop() async {
    reportBloc.setUser(User.A);
    return true;
  }
}
