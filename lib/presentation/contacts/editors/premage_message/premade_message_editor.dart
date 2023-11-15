// Flutter imports:
import 'package:blinq/presentation/contacts/editors/premage_message/bloc/premade_message_editor_event.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'bloc/premade_message_editor_bloc.dart';
import 'package:blinq/app/locator.dart';

class PremadeMessageEditor extends StatelessWidget {
  //
  const PremadeMessageEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = PremadeMessageEditorBloc(
      premadeMessagesBloc: context.read<PremadeMessagesBloc>(),
      repository: getIt<PremadeMessagesRepositoryImpl>(),
    );

    return BlocBuilder<PremadeMessageEditorBloc, PremadeMessageEditorState>(
      bloc: bloc,
      builder: (context, state) {
        return MyInfoContainer(
          height: 400,
          isEdit: true,
          onClose: () {},
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16).copyWith(top: 0),
          child: Column(
            children: [
              NameTextField(
                labelText: 'strMessageName'.tr(),
                controller: bloc.titleController,
              ),
              const SizedBox(height: 40),
              NameTextField(
                labelText: 'strMessages'.tr(),
                controller: bloc.messageController,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton.tertiary(
                    label: 'strDelete'.tr(),
                    onTap: () {},
                    labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 52,
                    ),
                  ),
                  const SizedBox(width: 12),
                  MyButton.primary(
                    label: 'strSave'.tr(),
                    onTap: () => bloc.add(OnAddPremadeMessage()),
                    labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 52,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
