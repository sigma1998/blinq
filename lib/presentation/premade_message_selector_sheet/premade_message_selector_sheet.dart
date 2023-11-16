// Flutter imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/utils/services/permission/permission_service.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/utils/custom_widgets/pop_ups/base_selector_sheet.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'bloc/premade_message_selector_event.dart';
import 'bloc/premade_message_selector_bloc.dart';
import 'widgets/item.dart';

class PremadeMessageSelectorSheet extends StatefulWidget {
  //
  final List<String> phoneNumbers;

  const PremadeMessageSelectorSheet({
    super.key,
    required this.phoneNumbers,
  });

  @override
  State<PremadeMessageSelectorSheet> createState() =>
      _PremadeMessageSelectorSheetState();
}

class _PremadeMessageSelectorSheetState
    extends State<PremadeMessageSelectorSheet> {
  //
  late PremadeMessageSelectorBloc bloc;

  @override
  void initState() {
    bloc = PremadeMessageSelectorBloc(
      premadeMessagesBloc: context.read<PremadeMessagesBloc>(),
      permissionService: getIt<PermissionService>(),
    );
    bloc.add(OnLoadPremadeMessages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PremadeMessageSelectorBloc, PremadeMessageSelectorState>(
      bloc: bloc,
      builder: (context, state) {
        final list = state.premadeMessages;

        return MyBaseSelectorSheet(
          title: 'strChooseAndSendMessage'.tr(),
          bottomChild: MyButton.primary(
            margin: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 18,
            ),
            enable: state.selectedMessage != null,
            label: 'strChooseTheContactToSendMessage'.tr(),
            onTap: () => bloc.sendMessage(widget.phoneNumbers),
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final message = list[index];

                return PremadeMessageSelectorItem(
                  premadeMessage: message,
                  isSelected: message == state.selectedMessage,
                  onTap: () =>
                      bloc.add(OnSelectPremadeMessage(message: message)),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
