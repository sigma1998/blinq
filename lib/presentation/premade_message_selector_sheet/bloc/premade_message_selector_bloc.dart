// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:blinq/utils/url_helper.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/presentation/contacts/pages/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/permission/permission_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'premade_message_selector_event.dart';

part 'premade_message_selector_bloc.freezed.dart';

part 'premade_message_selector_state.dart';

class PreMadeMessageSelectorBloc
    extends Bloc<PreMadeMessageSelectorEvent, PremadeMessageSelectorState> {
  //
  final PreMadeMessagesBloc premadeMessagesBloc;
  final PermissionService permissionService;

  PreMadeMessageSelectorBloc({
    required this.premadeMessagesBloc,
    required this.permissionService,
  }) : super(const PremadeMessageSelectorState()) {
    on<OnLoadPreMadeMessages>(_onLoadPremadeMessages);
    on<OnPreMadeMessagesLoaded>(_onPreMadeMessagesLoaded);
    on<OnSelectPreMadeMessage>(_onSelectPremadeMessage);

    premadeMessagesBloc.stream.listen((event) {
      if (event.premadeMessages != null) {
        add(OnPreMadeMessagesLoaded(premadeMessages: event.premadeMessages));
      }
    });
  }

  void _onLoadPremadeMessages(
      OnLoadPreMadeMessages event, Emitter<PremadeMessageSelectorState> emit) {
    emit(
      state.copyWith(
        status: premadeMessagesBloc.state.status,
        premadeMessages:
            premadeMessagesBloc.state.premadeMessages?.results ?? [],
      ),
    );
  }

  void _onSelectPremadeMessage(
      OnSelectPreMadeMessage event, Emitter<PremadeMessageSelectorState> emit) {
    emit(state.copyWith(
      selectedMessage: event.message,
    ));
  }

  Future<void> sendMessage(List<String> recipients, {String? message}) async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      pathSegments: recipients,
      queryParameters: <String, String>{
        'body': message ?? state.selectedMessage?.message ?? ''
      },
    );

    if (await canLaunchUrl(smsLaunchUri)) {
      final result = await launchUrl(smsLaunchUri);
      debugPrint('result: $result');
      await NavigationService.showToast(
        text: 'strYourInformMessageSent'.tr(),
        title: 'strSuccess'.tr(),
      );
    } else {
      permissionService.handleSendSmsPermission();
      sendMessage(
        recipients,
        message: message,
      );
    }
  }

  FutureOr<void> _onPreMadeMessagesLoaded(OnPreMadeMessagesLoaded event,
      Emitter<PremadeMessageSelectorState> emit) {
    emit(
      state.copyWith(
        status: premadeMessagesBloc.state.status,
        premadeMessages: event.premadeMessages?.results ?? [],
      ),
    );
  }
}
