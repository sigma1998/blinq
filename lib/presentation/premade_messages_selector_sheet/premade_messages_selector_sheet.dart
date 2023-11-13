// Flutter imports:
import 'package:blinq/utils/custom_widgets/buttons/primary_button.dart';
import 'package:blinq/utils/custom_widgets/pop_ups/base_selector_sheet.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_bloc.dart';
import 'widgets/item.dart';

class PremadeMessagesSelectorSheet extends StatelessWidget {
  //
  const PremadeMessagesSelectorSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MyBaseSelectorSheet(
      title: 'strChooseAndSendMessage'.tr(),
      bottomChild: PrimaryButton(
        label: 'strSend'.tr(),
        onTap: () {},
      ),
      children: [
        BlocBuilder<PremadeMessagesBloc, PremadeMessagesState>(
          builder: (context, state) {
            // final list = state.premadeMessages?.results ?? [];

            return ListView.builder(
              shrinkWrap: true,
              itemCount: 50,
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                // final message = list[index];

                return const PremadeMessagesSelectorItem(
                  isSelected: false,
                  title: 'message.title!',
                  desc: ' message.message!',
                );
              },
            );
          },
        ),
      ],
    );
  }
}
