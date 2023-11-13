// Package imports:
import 'package:blinq/presentation/premade_messages_selector_sheet/premade_messages_selector_sheet.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'inform_close_ones_event.dart';

part 'inform_close_ones_state.dart';
part 'inform_close_ones_bloc.freezed.dart';

class InformCloseOnesBloc
    extends Bloc<InformCloseOnesEvent, InformCloseOnesState> {
  //
  InformCloseOnesBloc() : super(const InformCloseOnesState()) {
    on<InformCloseOnesEvent>((event, emit) {});
  }

  void onChoosePremadeMessage() {
    NavigationService.showBottomSheet(
      isScrollable: false,
      sheet: const PremadeMessagesSelectorSheet(),
    );
  }
}
