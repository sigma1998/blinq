// Flutter imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sms/flutter_sms.dart';

// Project imports:
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/presentation/create_report/create_report_screen.dart';
import 'package:blinq/utils/services/permission/i_permission_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'premade_message_selector_event.dart';

part 'premade_message_selector_state.dart';
part 'premade_message_selector_bloc.freezed.dart';

class PremadeMessageSelectorBloc
    extends Bloc<PremadeMessageSelectorEvent, PremadeMessageSelectorState> {
  //
  final PremadeMessagesBloc premadeMessagesBloc;
  final IPermissionService permissionService;

  PremadeMessageSelectorBloc({
    required this.premadeMessagesBloc,
    required this.permissionService,
  }) : super(const PremadeMessageSelectorState()) {
    on<OnLoadPremadeMessages>(_onLoadPremadeMessages);
    on<OnSelectPremadeMessage>(_onSelectPremadeMessage);
  }

  void _onLoadPremadeMessages(
      OnLoadPremadeMessages event, Emitter<PremadeMessageSelectorState> emit) {
    emit(
      state.copyWith(
        status: Status.initial,
        premadeMessages:
            premadeMessagesBloc.state.premadeMessages?.results ?? [],
      ),
    );
  }

  void _onSelectPremadeMessage(
      OnSelectPremadeMessage event, Emitter<PremadeMessageSelectorState> emit) {
    emit(state.copyWith(
      selectedMessage: event.message,
    ));
  }

  Future<void> sendMessage(List<String> recipients) async {
    final isGranted = await permissionService.handleSendSmsPermission();

    if (!isGranted) {
      NavigationService.showErrorToast('strPermissionDenied'.tr());
      return;
    }

    final result = await sendSMS(
      sendDirect: true,
      recipients: recipients,
      message: state.selectedMessage?.message ?? '',
    );
    debugPrint('result: $result');
    NavigationService.showErrorToast('strYourInformMessageSent'.tr());
    NavigationService.pushReplacement(routeName: CreateReportScreen.route);
  }
}
