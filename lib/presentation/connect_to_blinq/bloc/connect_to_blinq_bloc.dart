// Package imports:
import 'package:blinq/utils/navigation_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'connect_to_blinq_event.dart';

part 'connect_to_blinq_state.dart';
part 'connect_to_blinq_bloc.freezed.dart';

class ConnectToBlinqBloc
    extends Bloc<ConnectToBlinqEvent, ConnectToBlinqState> {
  ConnectToBlinqBloc() : super(const ConnectToBlinqState()) {
    on<OnStartScanningBlinq>(_onStartScanningBlinq);
  }

  void onNavigateBack() {
    NavigationService.homeNavigatorKey.currentState?.pop();
  }

  Future<void> _onStartScanningBlinq(
    OnStartScanningBlinq event,
    Emitter<ConnectToBlinqState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading,
      isScanning: true,
    ));
  }
}
